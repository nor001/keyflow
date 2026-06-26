# AGENTS.md

AutoHotkey v2 Windows automation workspace. Operational codebase, not a public package.

## Authority chain

When sources conflict, this order wins:

1. `ai/health-check.summary.json` — current repo state, machine-generated
2. `ai/repo-map.json` — routing and domain ownership
3. `AGENTS.md` — this file: naming contract and hard rules
4. `README.md` — architecture and onboarding

## Mandatory workflow

```
1. read ai/repo-map.json
2. python ai/health_check.py --pretty --summary          # confirm ok: true
3. edit smallest responsible file set
4. python ai/health_check.py --pretty \
     --output ai/health-check.json \
     --output-summary ai/health-check.summary.json
5. if wiring changed: smoke-test AHK (see docs/smoke-test.md)
```

If step 2 exits 1: fix reported `issues[]` before proceeding.

## Hard rules

- Never touch local-only files unless user explicitly asks: `local-secrets.ini`, `local-paths.ini`, `local-startup.ini`, `memory-vars.ini`, `rom.ini`, `storage.db`.
- Never introduce new `norman*` identifiers. Existing `NORMAN_*` `EnvGet()` calls are legacy-compatible — leave them.
- Never merge `sap-session.ahk` into `sap.ahk` or vice versa.
- Never guess machine paths — use `*.example.*` files as structure reference only.
- Never depend on Git metadata at runtime.
- Never reintroduce `paste.ahk` as a registered service without resolving the overlap with `MemoryService.paste()`.

## Naming contract

| Scope | Rule |
|---|---|
| Files, classes, services, helpers, groups, targets | English-first |
| New runtime APIs | `keyflow*` prefix |
| External labels (SAP titles, exe names, KeePass paths, business names) | Keep as-is, never translate |
| `NORMAN_*` env vars | Legacy-compatible inputs, documented, not renamed |

Preferred vocabulary: `session` `entry` `provider` `catalog` `window` `workspace` `target` `profile` `group` `context` `command` `run` `action` `path` `secret` `constant`

Avoid mixing: `logon/login/session` · `gui/window/desktop` · `run/open/execute/start`

## File boundaries

| Concern | Owner |
|---|---|
| SAP session lookup + KeePass login | `sap-session.ahk` |
| SAP GUI + Eclipse automation | `sap.ahk` |
| Service wiring + hotstring profiles | `bootstrap.ahk` |
| Hotkey triggers | `platforms/windows/hotkeys/` |
| Versioned catalogs | `platforms/windows/data/*.json` |
| AI tooling + machine-readable contracts | `ai/` |

## Known dead code

| Symbol | File | Action |
|---|---|---|
| `PasteService` | `automation/paste.ahk` | Not registered, no callers. Remove or integrate `exeEverything` tweak into `MemoryService` first. |
| `sapQasSnippetsJsonFile` | `constants-core-paths.ahk:16` | Declared, never consumed. Remove when confirmed unused. |

## Validation

- Code changes: check include chain from `keyflow.ahk` → `bootstrap.ahk`.
- Service or hotkey changes: inspect JSON/INI contract first.
- Never test by writing to local secret files or runtime databases.
