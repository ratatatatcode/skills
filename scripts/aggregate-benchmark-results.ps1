param(
    [Parameter(Mandatory = $true)]
    [string]$Results,
    [Parameter(Mandatory = $true)]
    [string]$Output
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$resultPaths = @($Results -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ })
$rows = @(
    foreach ($path in $resultPaths) {
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "Result file not found: $path" }
        Get-Content -Raw -LiteralPath $path | ConvertFrom-Json
    }
)
if ($rows.Count -lt 3) { throw 'Provide at least three benchmark result files.' }

$baseTokens = [double](($rows | ForEach-Object { $_.baseline.estimatedTokens } | Measure-Object -Sum).Sum)
$candidateTokens = [double](($rows | ForEach-Object { $_.candidate.estimatedTokens } | Measure-Object -Sum).Sum)
$baseChars = [double](($rows | ForEach-Object { $_.baseline.contextChars } | Measure-Object -Sum).Sum)
$candidateChars = [double](($rows | ForEach-Object { $_.candidate.contextChars } | Measure-Object -Sum).Sum)
$baseCalls = [double](($rows | ForEach-Object { $_.baseline.toolCalls } | Measure-Object -Sum).Sum)
$candidateCalls = [double](($rows | ForEach-Object { $_.candidate.toolCalls } | Measure-Object -Sum).Sum)
$baseDuration = [double](($rows | ForEach-Object { $_.baseline.durationMs } | Measure-Object -Sum).Sum)
$candidateDuration = [double](($rows | ForEach-Object { $_.candidate.durationMs } | Measure-Object -Sum).Sum)
$baseCompleteness = [math]::Round((($rows | ForEach-Object { $_.baseline.completenessScore } | Measure-Object -Average).Average), 2)
$candidateCompleteness = [math]::Round((($rows | ForEach-Object { $_.candidate.completenessScore } | Measure-Object -Average).Average), 2)
$baseCorrectness = [math]::Round((($rows | ForEach-Object { $_.baseline.correctnessScore } | Measure-Object -Average).Average), 2)
$candidateCorrectness = [math]::Round((($rows | ForEach-Object { $_.candidate.correctnessScore } | Measure-Object -Average).Average), 2)
$baseMissed = [double](($rows | ForEach-Object { $_.baseline.missedRequirements } | Measure-Object -Sum).Sum)
$candidateMissed = [double](($rows | ForEach-Object { $_.candidate.missedRequirements } | Measure-Object -Sum).Sum)
$baseRegressions = [double](($rows | ForEach-Object { $_.baseline.regressions } | Measure-Object -Sum).Sum)
$candidateRegressions = [double](($rows | ForEach-Object { $_.candidate.regressions } | Measure-Object -Sum).Sum)
$allVerified = ($rows | ForEach-Object { $_.comparison.verificationPreserved }) -notcontains $false

function Reduction([double]$base, [double]$candidate) {
    if ($base -eq 0) { return 0 }
    return [math]::Round((($base - $candidate) / $base) * 100, 1)
}

$lines = @(
    "# $($rows.Count)-Task Context-Efficiency Benchmark", '',
    '> These are controlled trace comparisons, not provider billing measurements. See the real benchmark runbook before drawing production-wide conclusions.', '',
    '## Per-task results', '',
    '| Task | Plain tokens | Context-efficient tokens | Reduction | Plain duration (ms) | Efficient duration (ms) | Verification |',
    '|---|---:|---:|---:|---:|---:|---|'
)
foreach ($row in $rows) {
    $lines += "| $($row.task) | $($row.baseline.estimatedTokens) | $($row.candidate.estimatedTokens) | $(Reduction $row.baseline.estimatedTokens $row.candidate.estimatedTokens)% | $($row.baseline.durationMs) | $($row.candidate.durationMs) | $($row.comparison.verificationPreserved) |"
}
$lines += @(
    '', '## Combined result', '',
    "- Estimated tokens: $baseTokens -> $candidateTokens ($(Reduction $baseTokens $candidateTokens)% reduction).",
    "- Recorded context characters: $baseChars -> $candidateChars ($(Reduction $baseChars $candidateChars)% reduction).",
    "- Tool calls: $baseCalls -> $candidateCalls ($(Reduction $baseCalls $candidateCalls)% reduction).",
    "- Recorded duration: $baseDuration -> $candidateDuration ms ($(Reduction $baseDuration $candidateDuration)% reduction).",
    "- Average completeness score (5-point): $baseCompleteness -> $candidateCompleteness.",
    "- Average correctness score (5-point): $baseCorrectness -> $candidateCorrectness.",
    "- Missed requirements: $baseMissed -> $candidateMissed; regressions: $baseRegressions -> $candidateRegressions.",
    "- Verification preserved in every task: **$allVerified**.", '',
    '## Conclusion', '',
    "The reduction appears across all $($rows.Count) controlled traces, so the sample is less consistent with a single lucky task. It is still not proof of universal savings.", '',
    '## Limitations and further benchmarking', '',
    '- These are controlled traces and may not be fresh Codex executions.',
    '- Estimated tokens use characters divided by four, not exact tokenizer, quota, cost, or latency measurements.',
    '- Duration and quality values are meaningful only when measured consistently from real runs.',
    '- Hidden system context, provider overhead, model variance, and sampling effects are not captured.',
    '- Repeat every task at least three times for both workflows and add more task types before generalizing.'
)

$directory = Split-Path -Parent $Output
if ($directory -and -not (Test-Path -LiteralPath $directory)) { New-Item -ItemType Directory -Path $directory -Force | Out-Null }
Set-Content -LiteralPath $Output -Value ($lines -join [Environment]::NewLine) -Encoding utf8
Write-Output "Wrote aggregate report: $Output"
