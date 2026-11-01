# Global agent instructions

- Write all responses using ASD-STE100 Simplified Technical English. Use short sentences (under 20 words for steps), simple active verbs, and basic technical words. Do not use fluff, marketing terms, or made-up jargon.
- Never use the em dash (U+2014). Use a plain dash "-" instead.
- When writing commit messages or PR descriptions, NEVER auto-add your agent name as co-author.
- Use conventional commit messages.
- When opening Pull Requests, do not document prior iterations. Always document only the current and final change status.
- Never manually modify CHANGELOG.md, vendor/ directories, node_modules/, or any files that are marked as auto-generated.
- When making technical decisions, prefer quality, simplicity, robustness, scalability, and long term maintainability over development cost. For one-off work, start with the simplest end-to-end path (see ponytail).
- When doing bug fixes, always start with reproducing the bug in an E2E setting as closely aligned with how an end user would experience it as possible.
  This makes sure you find the real problem so your fix will actually solve it.
- Apply a high standard everywhere: be picky about UI and pixel details, and fix lint, test failures, and test flakiness even when they are outside your current task.
- When adding new tests, ensure they are focused on business logic and not tautological tests.
- Before using any harness feature that spawns many subagents, explain the tradeoffs and ask the user for explicit approval.
- When completing a task, run a ponytail review for over-engineering, plus a correctness review. If ponytail is unavailable, prompt me to add it.
- Do not install system tools outside nix. Do not use homebrew or direct downloads. Use `nix-shell -p <pkg> --run '<cmd>'` or `nix shell nixpkgs#<pkg> -c <cmd>`.

## Maintaining this file

Keep this file for knowledge useful to almost every future agent session in this project.
Do not repeat what the codebase already shows; point to the authoritative file or command instead.
Prefer rewriting or pruning existing entries over appending new ones.
When updating this file, preserve this bar for all agents and keep entries concise.
