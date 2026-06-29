# Plan: Completed — Governance Single-Source and Reviewer Robustness

Status: complete

## Outcome

- `ai/review_check.py` now distinguishes stale generated artifacts (`stale_summary` with a clear regeneration command) from real contract failures, eliminating reviewer false positives caused by un-regenerated summaries.
- `ai/health_check.py` and `ai/review_check.py` now load `required_agents_sections` and `required_agents_phrases` from `ai/governance.json` instead of maintaining parallel hardcoded constants. `ai/governance.json` is the single enforced source for the multi-agent contract.
- `validate_guide_contracts()` in `ai/health_check.py` now accepts governance data and reads section/phrase requirements from it, falling back to module-level constants only if governance is unavailable.
- Module-level constants `REQUIRED_AGENTS_SECTIONS` and `REQUIRED_AGENTS_PHRASES` are retained in `ai/health_check.py` as the authoritative ground-truth values used to validate `ai/governance.json` itself.

## Human-only pending work

None.

## Next technical plan

Deferred. No new technical frontier is identified. Replace this file with a real plan when a frontier appears.
