# Plan: Guide And Governance Alignment

Status: complete
Plan: completed

## Outcome

- `AGENTS.md` now states the actual governance model: `ai/health_check.py` owns the enforced baseline, `ai/governance.json` mirrors it as the machine-readable role contract, and `ai/review_check.py` consumes governance for reviewer audits.
- The architect/executor split is documented as the repo operating model. A single AI can still act as both architect and executor when that is simpler.
- `README.md` now includes `ai/run-result.json` in the local-only artifact list.
- `platforms/windows/library/bootstrap.ahk` no longer references the retired `utils` global in its startup comment.

## Validation

- Run `python ai/health_check.py --pretty --output ai/health-check.json --output-summary ai/health-check.summary.json`.
- Run `python ai/review_check.py --pretty --summary`.

## Human-only pending work

None.

## Next technical plan

Deferred. No new technical frontier is identified. Replace this file with a real plan when a frontier appears.
