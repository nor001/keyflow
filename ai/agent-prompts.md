# Agent prompts

Short reusable prompts for multi-agent work in `keyflow` and similar AI-first repos.

## Continue current repo

Use when the repo already has `AGENTS.md` and the AI operating guide:

`Read AGENTS.md, follow the mandatory workflow, and continue with the next frontier.`

Safer variant:

`Read AGENTS.md, run the required health check, follow the mandatory workflow, and continue with the next frontier.`

## Bootstrap a new AI-first repo

Use when a repo does not yet have the guide layer:

`Bootstrap AI-first maintenance for this repo: create an operational AGENTS.md, an architectural README.md, and an ai/ layer with repo-map.json, health_check.py, and health-check.summary.json.`

Stronger variant:

`Create an AI-first maintenance layer for this repo. I want AGENTS.md for workflow and rules, README.md for architecture and onboarding, and ai/ for machine-readable navigation and health checks.`

## Rebuild the guide layer

Use when the repo has drift or weak documentation:

`Rebuild the AI operating guide for this repo. Separate AGENTS.md as operational, README.md as architectural, and ai/ as machine-readable state and navigation. Remove duplicated guidance and leave one clear next frontier.`

## Mental model

- `AGENTS.md`: operational
- `README.md`: architectural
- `ai/`: machine-readable

## Rule of thumb

If you want execution, say `continue` or `execute`.

If you only want analysis, say `review` or `propose`.
