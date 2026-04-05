<p align="center">
  <h1 align="center">Claude Code Game Studios</h1>
  <p align="center">
    A lean AI agent setup for solo Unreal Engine 5 indie development.
    <br />
    11 agents. 12 workflows. Token-efficient for the Claude Pro plan.
  </p>
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT License"></a>
  <a href=".claude/agents"><img src="https://img.shields.io/badge/agents-11-blueviolet" alt="11 Agents"></a>
  <a href=".claude/skills"><img src="https://img.shields.io/badge/skills-12-green" alt="12 Skills"></a>
  <a href=".claude/hooks"><img src="https://img.shields.io/badge/hooks-3-orange" alt="3 Hooks"></a>
  <a href="https://docs.anthropic.com/en/docs/claude-code"><img src="https://img.shields.io/badge/built%20for-Claude%20Code-f5f5f5?logo=anthropic" alt="Built for Claude Code"></a>
</p>

---

## What This Is

A ready-made Claude Code configuration for solo UE5 game development. Drop it into any Unreal project and Claude Code gains:

- **11 specialized agents** — each owns a domain (design, programming, narrative, QA, etc.)
- **12 slash commands** — common workflows like `/brainstorm`, `/code-review`, `/scope-check`
- **3 hooks** — automated quality gates on commits and context compaction
- **UE5 engine reference** — version-pinned API docs so agents don't hallucinate deprecated APIs

Extra agents and skills are in `ondemand/` — copy them back when you need them.

---

## Install Into a UE Project

Run this once per project from the studio repo root:

```bash
bash install.sh "C:/Path/To/Your/UE/Project"
```

That's it. The script copies `.claude/`, `docs/engine-reference/unreal/`, and `CLAUDE.md` into your project root.

**Then:**

1. Open `CLAUDE.md` in your project and add your game name and concept
2. `cd` into your project and run `claude`
3. Type `/start`

### Example

```bash
bash install.sh "C:/Users/You/Unreal Projects/MyGame"
```

---

## Prerequisites

- [Git](https://git-scm.com/)
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) — `npm install -g @anthropic-ai/claude-code`
- **Optional**: [jq](https://jqlang.github.io/jq/) — used by the commit validation hook. Hooks fail gracefully without it.

---

## Active Agents

| Agent | What It Does |
|---|---|
| `creative-director` | Guards vision and creative pillars |
| `technical-director` | Architecture and tech decisions |
| `game-designer` | Mechanics, systems, GDD authoring |
| `gameplay-programmer` | Implements mechanics in UE5 C++ |
| `lead-programmer` | C++ quality, code review |
| `unreal-specialist` | UE5 APIs, patterns, best practices |
| `ue-blueprint-specialist` | Blueprint architecture and optimization |
| `systems-designer` | Formulas, progression curves, balance |
| `narrative-director` | Story structure and world-building |
| `prototyper` | Rapid throwaway prototypes |
| `qa-tester` | Bug reports and test cases |

Use the `creative-director` and `technical-director` sparingly — they run on Opus and cost more tokens.

---

## Slash Commands

Type `/` in Claude Code to access:

| Command | Purpose |
|---|---|
| `/start` | Guided onboarding — figures out where you are and what to do next |
| `/brainstorm` | Explore game ideas from scratch |
| `/design-system` | Author a full GDD for a mechanic |
| `/prototype` | Spec out a throwaway prototype |
| `/scope-check` | Gut-check scope before you build |
| `/code-review` | Review C++ or Blueprint code |
| `/design-review` | Review a design document |
| `/balance-check` | Validate numbers and progression curves |
| `/bug-report` | Write a structured bug report |
| `/estimate` | Time/effort estimate for a task |
| `/gate-check` | Check if the project is ready to move to the next stage |
| `/project-stage-detect` | Detect the current project stage from existing files |

---

## Collaboration Model

Agents never act autonomously. Every task follows:

**Question → Options → Decision → Draft → Approval**

- Agents ask before proposing
- You pick from 2–4 options
- Agents show drafts before writing anything
- Nothing is written to disk without your sign-off
- No commits without your instruction

---

## Restoring On-Demand Resources

Need a specialist not in the active roster? Copy it from `ondemand/`:

```bash
# Restore an agent (example: ue-gas-specialist for Gameplay Ability System)
cp ondemand/agents/ue-specialists/ue-gas-specialist.md .claude/agents/

# Restore a skill (example: sprint-plan)
cp -r ondemand/skills/sprint-plan .claude/skills/
```

See `ondemand/README.md` for the full list.

---

## Project Structure After Install

```
MyGame/
├── MyGame.uproject
├── CLAUDE.md                        ← edit this: game name, concept, stage
├── .claude/
│   ├── agents/                      ← 11 active agents
│   ├── skills/                      ← 12 slash commands
│   ├── hooks/                       ← 3 automated quality gates
│   ├── docs/                        ← agent coordination docs and templates
│   └── settings.json                ← hook config and permissions
└── docs/
    └── engine-reference/
        └── unreal/                  ← UE5 API reference (version-pinned)
```

---

## License

MIT License. See [LICENSE](LICENSE) for details.
