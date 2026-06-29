# Runtime-Local Contract Enforcement Plan

## Intent

Clean up the remaining drift between versioned repo contracts and runtime-local artifacts so new agents can trust which files are active, versioned, and local-only without guessing.

This plan is based on concrete repo evidence:

- `platforms/windows/data/hotkey-usage.json` is treated as runtime-local by `.gitignore`, `README.md`, and `constants-core.ahk`, but it was not consistently represented across every AI contract.
- `platforms/windows/data/memory-vars.ini` is runtime-local in both `.gitignore` and runtime constants, so it belongs in the same explicit contract check as the other local-only artifacts.
- Local/runtime boundary rules are close, but not yet fully normalized across guide files, health checks, and data layout.

## Success criteria

- Every runtime-local artifact is consistently classified across `.gitignore`, `AGENTS.md`, `README.md`, `ai/repo-map.json`, and `ai/health_check.py`.
- A new agent can infer which JSON/INI files are active runtime inputs versus leftover inventory without guessing.

## Workstreams

### 1. Normalize runtime-local contract

- Align the treatment of:
  - `platforms/windows/data/hotkey-usage.json`
  - `platforms/windows/data/memory-vars.ini`
  - `storage.db`
  - other runtime-local files already covered by `.gitignore`
- Update machine-readable and prose guidance so the same file is never local-only in one place and omitted in another.

Definition of done:

- Runtime-local file lists are consistent across repo contracts.

### 2. Strengthen health-check coverage for boundary drift

- Extend `ai/health_check.py` so it can detect:
  - runtime-local files mentioned in some guide layers but missing from others
- Keep the checks cheap and deterministic.

Definition of done:

- Boundary drift becomes machine-visible before another cleanup cycle starts.

### 3. Reconcile governance after cleanup

- Update:
  - `AGENTS.md`
  - `README.md`
  - `ai/repo-map.json`
  - `ai/governance.json`
  - `ai/catalog-review.json` if affected
- Leave one clear answer for each artifact: active versioned, active local-only, or intentionally inactive.

Definition of done:

- Another agent can resume with no ambiguity about data ownership and runtime scope.

## Ordered execution

1. Align the runtime-local contract first.
2. Teach `health_check.py` to guard the boundary.
3. Regenerate the guide layer and summary artifacts.

## Explicit non-goals for this cycle

- Do not reopen broad runtime API refactors.
- Do not create a general `human/` folder.
- Do not change active SAP session/login behavior.

## Current active frontier

The next best move is to normalize the runtime-local contract, starting with `hotkey-usage.json` alignment across `.gitignore`, guides, and `ai/health_check.py`.
