param(
    [Parameter(Mandatory = $true)]
    [string]$Baseline,

    [Parameter(Mandatory = $true)]
    [string]$Candidate,

    [Parameter(Mandatory = $true)]
    [string]$Output,

    [string]$JsonOutput
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Read-Trace {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "Trace file not found: $Path"
    }

    $trace = Get-Content -Raw -LiteralPath $Path | ConvertFrom-Json
    if (-not $trace.task -or -not $trace.mode -or -not $trace.steps) {
        throw "Trace must contain task, mode, and steps: $Path"
    }

    return $trace
}

function Sum-Number {
    param([object[]]$Values)

    $total = 0
    foreach ($value in $Values) {
        if ($null -ne $value) {
            $total += [int]$value
        }
    }
    return $total
}

function Get-Summary {
    param([object]$Trace)

    $steps = @($Trace.steps)
    $files = @(
        foreach ($step in $steps) {
            foreach ($file in @($step.files)) {
                if ($file) { $file }
            }
        }
    )
    $uniqueFiles = @($files | Sort-Object -Unique)
    $inputChars = [int](($steps | ForEach-Object { [int]$_.inputChars } | Measure-Object -Sum).Sum)
    $outputChars = [int](($steps | ForEach-Object { [int]$_.outputChars } | Measure-Object -Sum).Sum)
    $contextChars = $inputChars + $outputChars
    $repeatedChars = [int](($steps | ForEach-Object { [int]$_.repeatedChars } | Measure-Object -Sum).Sum)
    $estimatedTokens = [math]::Ceiling($contextChars / 4)
    $toolCalls = [int](($steps | ForEach-Object { [int]$_.toolCalls } | Measure-Object -Sum).Sum)
    $durationMs = 0
    $completenessScore = 0
    $correctnessScore = 0
    $missedRequirements = 0
    $regressions = 0
    if ($Trace.PSObject.Properties.Name -contains 'durationMs') { $durationMs = [int]$Trace.durationMs }
    if ($Trace.PSObject.Properties.Name -contains 'quality') {
        if ($Trace.quality.PSObject.Properties.Name -contains 'completenessScore') { $completenessScore = [double]$Trace.quality.completenessScore }
        if ($Trace.quality.PSObject.Properties.Name -contains 'correctnessScore') { $correctnessScore = [double]$Trace.quality.correctnessScore }
        if ($Trace.quality.PSObject.Properties.Name -contains 'missedRequirements') { $missedRequirements = [int]$Trace.quality.missedRequirements }
        if ($Trace.quality.PSObject.Properties.Name -contains 'regressions') { $regressions = [int]$Trace.quality.regressions }
    }

    $script:SummaryResult = [pscustomobject]@{
        mode = [string]$Trace.mode
        task = [string]$Trace.task
        toolCalls = $toolCalls
        fileReads = $files.Count
        uniqueFiles = $uniqueFiles.Count
        repeatedFileReads = [math]::Max(0, $files.Count - $uniqueFiles.Count)
        contextChars = $contextChars
        repeatedChars = $repeatedChars
        estimatedTokens = $estimatedTokens
        durationMs = $durationMs
        completenessScore = $completenessScore
        correctnessScore = $correctnessScore
        missedRequirements = $missedRequirements
        regressions = $regressions
        verified = [bool]$Trace.verified
        notes = [string]$Trace.notes
    }
}

function Get-Reduction {
    param([double]$Base, [double]$Candidate)

    if ($Base -eq 0) { return 0 }
    return [math]::Round((($Base - $Candidate) / $Base) * 100, 1)
}

$baselineTrace = Read-Trace -Path $Baseline
$candidateTrace = Read-Trace -Path $Candidate
Get-Summary -Trace $baselineTrace
$baselineSummary = $script:SummaryResult
Get-Summary -Trace $candidateTrace
$candidateSummary = $script:SummaryResult
$baselineToolCalls = [double]$baselineSummary.toolCalls
$candidateToolCalls = [double]$candidateSummary.toolCalls
$baselineFileReads = [double]$baselineSummary.fileReads
$candidateFileReads = [double]$candidateSummary.fileReads
$baselineContextChars = [double]$baselineSummary.contextChars
$candidateContextChars = [double]$candidateSummary.contextChars
$baselineEstimatedTokens = [double]$baselineSummary.estimatedTokens
$candidateEstimatedTokens = [double]$candidateSummary.estimatedTokens
$baselineRepeatedChars = [double]$baselineSummary.repeatedChars
$candidateRepeatedChars = [double]$candidateSummary.repeatedChars

$comparison = [ordered]@{
    toolCallsReductionPercent = Get-Reduction -Base $baselineToolCalls -Candidate $candidateToolCalls
    fileReadsReductionPercent = Get-Reduction -Base $baselineFileReads -Candidate $candidateFileReads
    contextCharsReductionPercent = Get-Reduction -Base $baselineContextChars -Candidate $candidateContextChars
    estimatedTokensReductionPercent = Get-Reduction -Base $baselineEstimatedTokens -Candidate $candidateEstimatedTokens
    repeatedCharsReductionPercent = Get-Reduction -Base $baselineRepeatedChars -Candidate $candidateRepeatedChars
    verificationPreserved = ($baselineSummary.verified -and $candidateSummary.verified)
}

$result = [ordered]@{
    generatedAt = (Get-Date).ToUniversalTime().ToString('o')
    task = [string]$baselineSummary.task
    baseline = $baselineSummary
    candidate = $candidateSummary
    comparison = $comparison
    method = 'Estimated tokens use observed input/output characters divided by four. This is a proxy for context volume, not provider billing or exact tokenizer usage.'
}

$markdown = @"
# Context-Efficient Workflow Benchmark

> This is a synthetic controlled sample generated from example traces. It demonstrates the benchmark format and calculator; it is not a measurement from two real Codex runs.

Task: **$($result.task)**
Generated: **$($result.generatedAt)**

## Method

This report compares two recorded traces for the same task:

- **Plain workflow:** broad reads and repeated context collection without the context-efficient workflow.
- **Context-efficient workflow:** targeted reads, bounded output, and a compact working summary.

Token counts are estimates: observed input and output characters divided by four. They are useful for comparing these traces, but they are not exact model-token, quota, cost, or latency measurements.

## Results

| Metric | Plain workflow | Context-efficient workflow | Reduction |
|---|---:|---:|---:|
| Tool calls | $($baselineSummary.toolCalls) | $($candidateSummary.toolCalls) | $($comparison.toolCallsReductionPercent)% |
| File reads | $($baselineSummary.fileReads) | $($candidateSummary.fileReads) | $($comparison.fileReadsReductionPercent)% |
| Unique files read | $($baselineSummary.uniqueFiles) | $($candidateSummary.uniqueFiles) | - |
| Repeated file reads | $($baselineSummary.repeatedFileReads) | $($candidateSummary.repeatedFileReads) | - |
| Observed context characters | $($baselineSummary.contextChars) | $($candidateSummary.contextChars) | $($comparison.contextCharsReductionPercent)% |
| Repeated characters | $($baselineSummary.repeatedChars) | $($candidateSummary.repeatedChars) | $($comparison.repeatedCharsReductionPercent)% |
| Estimated tokens (proxy) | $($baselineSummary.estimatedTokens) | $($candidateSummary.estimatedTokens) | $($comparison.estimatedTokensReductionPercent)% |
| Duration (ms, if recorded) | $($baselineSummary.durationMs) | $($candidateSummary.durationMs) | $(Get-Reduction -Base $baselineSummary.durationMs -Candidate $candidateSummary.durationMs)% |
| Completeness score | $($baselineSummary.completenessScore) | $($candidateSummary.completenessScore) | - |
| Correctness score | $($baselineSummary.correctnessScore) | $($candidateSummary.correctnessScore) | - |
| Missed requirements | $($baselineSummary.missedRequirements) | $($candidateSummary.missedRequirements) | - |
| Regressions | $($baselineSummary.regressions) | $($candidateSummary.regressions) | - |
| Verification completed | $($baselineSummary.verified) | $($candidateSummary.verified) | Preserved: $($comparison.verificationPreserved) |

## Trace notes

**Plain workflow:** $($baselineSummary.notes)

**Context-efficient workflow:** $($candidateSummary.notes)

## Interpretation

The candidate trace uses less recorded context while preserving verification. This demonstrates reduced observed context for this fixture; it does not prove a universal percentage for all tasks. Use several representative traces before making a performance or cost claim.

## Limitations and next steps

- These traces may be synthetic or manually recorded rather than fresh Codex executions.
- Estimated tokens use characters divided by four; they are not exact tokenizer, quota, cost, or latency measurements.
- Duration and quality values are only meaningful when measured consistently from real runs.
- Hidden system context, provider tool overhead, model variance, and sampling effects are not captured.
- Repeat each task at least three times for both workflows, then add more task types before generalizing the result.
"@

$outputDirectory = Split-Path -Parent $Output
if ($outputDirectory -and -not (Test-Path -LiteralPath $outputDirectory)) {
    New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null
}
Set-Content -LiteralPath $Output -Value $markdown -Encoding utf8

if ($JsonOutput) {
    $jsonDirectory = Split-Path -Parent $JsonOutput
    if ($jsonDirectory -and -not (Test-Path -LiteralPath $jsonDirectory)) {
        New-Item -ItemType Directory -Path $jsonDirectory -Force | Out-Null
    }
    $result | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $JsonOutput -Encoding utf8
}

Write-Output "Wrote benchmark report: $Output"
if ($JsonOutput) { Write-Output "Wrote benchmark data: $JsonOutput" }
