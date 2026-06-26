# keyflow health check contract

This document defines what must hold true for the runtime to start cleanly.
Use it as a reference before renaming symbols, moving files, or changing include order.

## Include chain

`platforms/windows/keyflow.ahk` must resolve all `#Include` paths without errors.

Expected chain:
```
keyflow.ahk
  library/bootstrap.ahk
    config/constants-core-base.ahk
    config/constants-core-paths.ahk
    config/constants-core-apps.ahk
    config/constants-core-rules.ahk
    config/constants-core.ahk
    config/constants-secrets.ahk
    json-service.ahk
    util.ahk
    automation/memory.ahk
    automation/hotkey-tracker.ahk
    automation/run.ahk
    automation/everything.ahk
    automation/launcher.ahk
    automation/paste.ahk
    automation/hotstring.ahk
    automation/dynamic.ahk
    automation/windows.ahk
    automation/window-group.ahk
    ui/dark-theme.ahk
    automation/sap.ahk
    automation/video.ahk
    automation/snipaste.ahk
    automation/whatsapp.ahk
  hotkeys/global.ahk
  hotkeys/sap-gui.ahk
  hotkeys/sap-eclipse.ahk
  hotkeys/editors.ahk (or equivalent domain files)
```

**Check**: run with `/ErrorStdOut` and expect empty stderr. See `smoke-test.md` for the exact command.

## Service registry contract

`keyflowServiceRegistry()` in `bootstrap.ahk` must instantiate all of these without throwing:

| Key | Class |
|---|---|
| `dynamic` | `DynamicService` |
| `sap` | `SapService` |
| `windows` | `WindowsService` |
| `windowGroup` | `WindowGroupService` |
| `video` | `VideoService` |
| `run` | `RunService` |
| `memory` | `MemoryService` |
| `launcher` | `LauncherService` |
| `snipaste` | `SnipasteService` |
| `whatsapp` | `WhatsappService` |
| `hotstring` | `HotstringService` |
| `hotkeyTracker` | `HotkeyTrackerService` |
| `everything` | `EverythingService` |

**Check**: if a class is renamed or moved, update both the `#Include` and the registry entry.

## Hotstring profile contract

`keyflowHotstringProfiles()` returns four profiles. Each must have a matching JSON file under `platforms/windows/data/`:

| Label | Expected file | Group |
|---|---|---|
| `autocorrect` | `data/autocorrect.json` | (global) |
| `quick-snippets` | `data/quick-snippets.json` | (global) |
| `sap-transaction-shortcuts` | `data/sap-transaction-shortcuts.json` | `group_sap_runtime_windows` |
| `ymt-commands` | `data/ymt-commands.json` | `group_sap_runtime_windows` |

**Check**: if a JSON file is renamed, update the `label` in `keyflowHotstringProfiles()` and verify the loader in `HotstringService`.

## JSON catalog format

Each catalog JSON must be a valid JSON object. Minimum viable shape:

```json
{ "entries": [] }
```

`HotstringService` reads entries from the catalog; an empty array is valid (no hotstrings loaded, no error).

**Check**: `json-service.ahk` must be able to parse each catalog without throwing.

## Constants contract

The following globals must be set before any service or hotkey code runs:

- `hotkeyTrackerJsonFile` — path to the runtime usage file (set by `loadCorePathConstants`)
- `sapQasSnippetsJsonFile` — path to the QAS snippets catalog
- `keepassProviderCommand` — may be empty, but `MemoryService` must degrade gracefully when it is

**Check**: if you rename a constant, grep all `.ahk` files for the old name before removing it.

## What to verify after any rename

1. Run the smoke test (`docs/smoke-test.md` step 1.1) — empty stderr = clean.
2. Confirm the renamed symbol appears in `keyflowServiceRegistry()` or `keyflowHotstringProfiles()` if it was a service or profile.
3. Confirm no `.ahk` file still references the old name (grep for it).
4. Confirm the corresponding JSON or INI contract still resolves to the same file path.
