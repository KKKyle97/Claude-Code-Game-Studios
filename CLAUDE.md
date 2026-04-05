# Claude Code Game Studios -- Game Studio Agent Architecture

Solo indie game development with Unreal Engine 5 (C++).
11 active agents cover the full solo dev workflow. Additional agents and skills
are available in `ondemand/` and can be copied back to `.claude/` as needed.

## Technology Stack

- **Engine**: Unreal Engine 5
- **Language**: C++ (primary), Blueprint (glue/prototyping)
- **Version Control**: Git with trunk-based development
- **Build System**: Unreal Build Tool (UBT)
- **Asset Pipeline**: Unreal Editor asset system

## Project Structure

@.claude/docs/directory-structure.md

## Engine Version Reference

@docs/engine-reference/unreal/VERSION.md

## Technical Preferences

@.claude/docs/technical-preferences.md

## Coordination Rules

@.claude/docs/coordination-rules.md

## Collaboration Protocol

**User-driven collaboration, not autonomous execution.**
Every task follows: **Question -> Options -> Decision -> Draft -> Approval**

- Agents MUST ask "May I write this to [filepath]?" before using Write/Edit tools
- Agents MUST show drafts or summaries before requesting approval
- Multi-file changes require explicit approval for the full changeset
- No commits without user instruction

See `docs/COLLABORATIVE-DESIGN-PRINCIPLE.md` for full protocol and examples.

> **First session?** If the project has no engine configured and no game concept,
> run `/start` to begin the guided onboarding flow.

## Coding Standards

@.claude/docs/coding-standards.md

## Context Management

@.claude/docs/context-management.md
