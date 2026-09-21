---
name: change-aware-commits
description: Create Conventional Commit messages and atomic commit plans from actual Git changes across one or many repositories and branches. Use for commit messages, commit plans, or multi-repository change summaries. Remain read-only unless Git actions are explicitly requested.
---

# Change-Aware Commits

Create commit messages from repository evidence rather than filenames or assumptions. Treat every in-scope repository and branch independently, regardless of project type or how many exist.

## Discover the complete scope

1. Start from the paths the user placed in scope.
2. Identify every Git repository within that scope without assuming a frontend/backend layout or stopping after two repositories.
3. For each repository, record its path, current branch or detached-HEAD state, staged changes, unstaged changes, and untracked files.
4. Respect repository instructions and ignore generated or irrelevant directories during discovery.
5. Do not cross outside the stated workspace merely to find more repositories.

If the user names multiple branches that are not checked out, inspect them read-only when locally available. Never switch branches if doing so could disturb working changes.

## Understand the changes

Use the relevant status and diffs to determine intent and impact. Inspect untracked content selectively when it may belong in the proposed commit. Distinguish staged from unstaged work.

Group changes by one coherent purpose. A repository may need multiple commits when changes are independently reviewable or reversible. Do not combine unrelated work solely because it exists on the same branch.

Never invent an issue number, co-author, legal requirement, breaking change, or AI-attribution footer.

## Write Conventional Commit messages

Use this form:

```text
<type>(<optional-scope>): <imperative summary>

<optional body explaining why and notable behavior>

<optional footer>
```

Choose the type from the actual effect:

- `feat`: user-visible capability.
- `fix`: defect correction.
- `docs`: documentation only.
- `refactor`: behavior-preserving restructuring.
- `test`: test-only change.
- `perf`: performance improvement.
- `build`: build system or dependency change.
- `ci`: continuous-integration change.
- `style`: formatting with no behavior change.
- `chore`: maintenance not better described above.
- `revert`: reversal of an earlier commit.

Keep the summary concise, imperative, specific, and free of a trailing period. Add a body only when it explains motivation, tradeoffs, migration, or behavior that the summary cannot.

Use `!` and a `BREAKING CHANGE:` footer only when the diff demonstrates an incompatible change. Do not label ordinary feature work as breaking.

## Cover every repository and branch

Produce a separate result for each discovered in-scope repository and branch. This rule applies to one, two, or many repositories and to any architecture: web, mobile, services, libraries, infrastructure, games, documentation, business systems, or mixed workspaces.

For multiple logical commits, assign files or hunks to each proposal. Flag files that contain mixed concerns and may require selective staging.

Use this output format:

```text
Repository: <name or path>
Branch: <branch or detached HEAD>
Change state: <staged, unstaged, untracked>

Commit 1
Message: <type(scope): summary>
Files or hunks: <group>
Rationale: <why these changes belong together>
```

Repeat until every repository and branch is covered. Explicitly report repositories with no relevant changes rather than fabricating a message.

## Action boundary

The default task is read-only message creation. Do not stage files, create commits, switch or create branches, push, open pull requests, or alter remotes unless the user explicitly asks for that action. Before an authorized commit, show the exact repository, branch, included changes, and proposed message.
