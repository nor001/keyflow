# Multi-Agent Governance Hardening Plan

## Intent

Harden the repo so no execution agent can silently weaken the multi-agent AI-first operating model by rewriting guides as if the repo were single-agent.

## Why this frontier exists

- The repo is technically healthy, but the guide layer still depends too much on agent judgment for preserving multi-agent wording.
- A future agent can overcompress `AGENTS.md` or related guides and still leave the repo technically healthy.
- The next gain is governance hardening, not runtime refactoring.

## Success criteria

- `AGENTS.md`, `README.md`, `ai/repo-map.json`, and `ai/governance.json` all express that the repo is intentionally multi-agent.
- `ai/health_check.py` fails if mandatory multi-agent contract language or governance keys disappear.
- `ai/review_check.py` reports whether a completed cycle preserved multi-agent handoff quality, not just technical health.
- Another AI can resume from the guide layer and infer that handoff clarity is a first-class repo invariant.

## Workstreams

### 1. Formalize the multi-agent contract

- Add machine-readable multi-agent governance fields to `ai/governance.json`.
- Make `AGENTS.md` explicitly state repo identity and non-removable multi-agent expectations.
- Keep `README.md` short, but explicit that the operating guide is multi-agent by design.

Definition of done:

- Multi-agent identity is visible in both prose and machine-readable governance.

### 2. Teach health_check to enforce it

- Extend `ai/health_check.py` to validate:
  - presence of the `## Multi-agent rules` section
  - required handoff language in `AGENTS.md`
  - required multi-agent governance keys in `ai/governance.json`
- Treat missing contract language as repo issues, not reviewer warnings.

Definition of done:

- Weakening the multi-agent contract makes `health_check.py` fail.

### 3. Teach review_check to audit cycle closure against the contract

- Extend `ai/review_check.py` so reviewer mode confirms:
  - the repo still declares itself multi-agent
  - the current frontier and plan state are aligned with that contract
  - the guide layer still exposes reviewer and handoff commands

Definition of done:

- A reviewer can detect governance drift in one command.

### 4. Reconcile the guide layer

- Update `AGENTS.md`, `README.md`, `ai/repo-map.json`, and `ai/agent-prompts.md` so they all reinforce the same operating model.
- Regenerate `ai/health-check.summary.json` after the contract hardening lands.

Definition of done:

- The guide layer and machine checks all agree on the same multi-agent operating model.

## Ordered execution

1. Formalize the contract in guides and governance.
2. Enforce it in `ai/health_check.py`.
3. Audit it in `ai/review_check.py`.
4. Regenerate summary artifacts and fold the outcome back into `AGENTS.md`.

## Non-goals

- Do not reopen runtime API refactors.
- Do not add new domain services.
- Do not introduce a separate docs layer.

## Current active frontier

The next best move is to make the repo's multi-agent governance contract impossible to weaken silently, starting with `AGENTS.md` and `ai/governance.json`.
