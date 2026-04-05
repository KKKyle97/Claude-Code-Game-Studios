# On-Demand Resources

Agents, skills, hooks, and engine references parked here to conserve tokens.
Restore any item by copying it back to its active location.

## How to Restore

| Resource | From | To |
|---|---|---|
| Agent | `ondemand/agents/<folder>/<name>.md` | `.claude/agents/<name>.md` |
| Skill | `ondemand/skills/<skill-name>/` | `.claude/skills/<skill-name>/` |
| Hook | `ondemand/hooks/<hook>.sh` | `.claude/hooks/<hook>.sh` + re-add entry to `.claude/settings.json` |
| Engine ref | `ondemand/engine-reference/<engine>/` | `docs/engine-reference/<engine>/` |

## Agents

### `ue-specialists/` — Restore when using advanced UE systems
- `ue-gas-specialist.md` — Gameplay Ability System (abilities, effects, tags)
- `ue-replication-specialist.md` — Multiplayer networking
- `ue-umg-specialist.md` — UMG/CommonUI heavy UI work

### `other-engines/` — Restore only if switching engine
- Godot: `godot-specialist`, `godot-gdscript-specialist`, `godot-shader-specialist`, `godot-gdextension-specialist`
- Unity: `unity-specialist`, `unity-dots-specialist`, `unity-addressables-specialist`, `unity-shader-specialist`, `unity-ui-specialist`

### `specialists/` — Restore per project phase
- `art-director.md` — Visual style decisions
- `audio-director.md` + `sound-designer.md` — Audio work
- `technical-artist.md` — Shaders, VFX, art pipeline
- `writer.md` — Dialogue and in-game text
- `narrative-director.md` — Story architecture
- `world-builder.md` — Lore, factions, world rules
- `level-designer.md` — Level layout and pacing
- `ai-programmer.md` — Enemy AI, behavior trees
- `network-programmer.md` — Multiplayer (restore when ready)
- `engine-programmer.md` — Core engine systems
- `ui-programmer.md` — UI implementation
- `tools-programmer.md` — Editor tools and pipeline
- `performance-analyst.md` — Optimization passes
- `economy-designer.md` — Progression and economy systems
- `ux-designer.md` — UX flows and interaction design

### `studio/` — Restore for team/release scenarios
- `producer.md`, `qa-lead.md`, `release-manager.md`
- `devops-engineer.md`, `analytics-engineer.md`
- `community-manager.md`, `live-ops-designer.md`
- `localization-lead.md`, `security-engineer.md`, `accessibility-specialist.md`

## Skills

All `team-*` orchestration skills are here — they spawn 5-6 agents per call.
Also: `sprint-plan`, `milestone-review`, `retrospective`, `launch-checklist`,
`release-checklist`, `patch-notes`, `changelog`, `localize`, `perf-profile`,
`asset-audit`, `tech-debt`, `hotfix`, `playtest-report`, `map-systems`,
`reverse-document`, `onboard`, `setup-engine`, `architecture-decision`.

## Hooks

To restore a hook, copy it back to `.claude/hooks/` and add its entry to `.claude/settings.json`:

- `detect-gaps.sh` → SessionStart hook (scans project for doc gaps)
- `validate-assets.sh` → PostToolUse Write|Edit hook
- `validate-push.sh` → PreToolUse Bash hook
- `session-stop.sh` → Stop hook
- `log-agent.sh` → SubagentStart hook

## Engine Reference

- `engine-reference/godot/` — Godot 4 API reference
- `engine-reference/unity/` — Unity API reference
