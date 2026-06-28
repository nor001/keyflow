# keyflow

Private Windows automation workspace built on AutoHotkey v2. This repo is optimized for fast AI maintenance, not for public packaging.

## Read first

For operational work, read in this order:

1. `ai/health-check.summary.json`
2. `ai/repo-map.json`
3. `AGENTS.md`
4. `README.md`

## Architecture

```text
platforms/windows/keyflow.ahk
  library/bootstrap.ahk
    library/config/constants-core.ahk
    library/config/constants-secrets.ahk
    library/automation/ (13 services)
  hotkeys/hotkey-tracking.ahk
  hotkeys/global.ahk
  hotkeys/sap-gui.ahk
  hotkeys/sap-eclipse.ahk
  hotkeys/editors-ide.ahk
  hotkeys/editors-office.ahk
  hotkeys/editors-text.ahk
  hotkeys/domains/comms.ahk
  hotkeys/domains/media-web.ahk
  hotkeys/domains/productivity.ahk
```

Main service surface:

`dynamic` `everything` `hotkeyTracker` `hotstring` `launcher` `memory` `run` `sap` `snipaste` `video` `whatsapp` `windowGroup` `windows`

## SAP model

- SAP secrets and session metadata come from KeePassXC through `keepassProviderCommand`.
- Session names are business-first: `pluz dev`, `pluz qas`, `pluz prd`.
- `platforms/windows/library/automation/sap-session.ahk` owns session lookup, entry resolution, launch command assembly, and credential filling.
- `platforms/windows/library/automation/sap.ahk` owns SAP GUI and Eclipse automation over an existing session.

KeePass lookup flow:

```text
kp:sap-index/session/pluz dev  ->  kp:company/nttdata/cliente/pluz dev
```

## Configuration contract

All machine-specific configuration is local-only. Use these versioned examples as structure references:

| Example file | Purpose |
|---|---|
| `platforms/windows/data/local-paths.example.ini` | Machine paths, app targets, ABAP workspace hints |
| `platforms/windows/data/local-startup.example.ini` | Runtime env, SAP defaults, UI config, startup launcher config |
| `platforms/windows/data/local-secrets.example.ini` | Secrets and `keepassProviderCommand` |
| `platforms/windows/data/sap-keepass-layout.example.md` | Expected KeePass entry layout |

Local-only files that must never be committed:

`local-secrets.ini` · `local-paths.ini` · `local-startup.ini` · `memory-vars.ini` · `rom.ini` · `storage.db` · `hotkey-usage.json`

## Startup scripts

`platforms/windows/tools/startup/host-startup.ahk` and `vmware-startup.ahk` are secondary launchers. They prepare a local machine context and then launch `platforms/windows/keyflow.ahk`.

The preferred startup contract lives in `local-startup.ini`:

- `[startup-host]`
- `[startup-vmware]`
- `[runtime-env]`
- `[sap-defaults]`
- `[sap-delays]`
- `[ui]`

## Onboarding

1. Install AutoHotkey v2 on Windows.
2. Copy each `*.example.*` file to its local counterpart when needed.
3. Configure `keepassProviderCommand` using `platforms/windows/tools/keepass/kp-get.ps1` as the reference provider.
4. Run `python ai/health_check.py --pretty --summary`.
5. Launch `platforms/windows/keyflow.ahk`.

## Current model

- One intentional global remains: `services` in `platforms/windows/keyflow.ahk`.
- The `utils` global object is gone; utility behavior lives in free `util*()` functions.
- `constants-core.ahk` is the consolidated constants file.
- Human-only pending item: catalog content freshness for `sap-transaction-catalog` and `autocorrect`.
