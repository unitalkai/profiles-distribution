# Alma — Unitalk AI Collaborator

A Hermes Agent [profile distribution](https://hermes-agent.nousresearch.com/docs/user-guide/profile-distributions): a complete autonomous collaborator for prospection, calls, email, and admin work.

## Install

```bash
hermes profile install github.com/unitalkai/profiles-distribution --alias
```

This gives you a profile named `alma`, installs its skills, wires up its MCP connections, and stages its cron jobs (paused).

## Configure

The installer prints which environment variables are required. Fill them in:

```bash
cp ~/.hermes/profiles/alma/.env.EXAMPLE ~/.hermes/profiles/alma/.env
# Edit .env with your keys
```

| Variable | Required | Purpose |
|---|---|---|
| `OPENAI_API_KEY` | yes | Model access |
| `UNITALK_API_KEY` | yes | Unitalk tools MCP server |
| `GOOGLE_CLIENT_ID` | no | Gmail / Calendar integration |
| `GOOGLE_CLIENT_SECRET` | no | Gmail / Calendar integration |

## Run

```bash
alma chat                          # with --alias
hermes -p alma chat                # without
```

Alma also works through any gateway platform (Telegram, Discord, Slack, …) — configure the channel for the `alma` profile and address it there.

## Update

```bash
hermes profile update alma
```

Distribution-owned files are replaced; your `config.yaml`, memories, sessions, and API keys stay put.

## What's in here

| Path | Purpose |
|---|---|
| `distribution.yaml` | Manifest — name, version, required env vars |
| `SOUL.md` | Personality: autonomie, open source, souveraineté |
| `config.yaml` | Model and tool defaults |
| `mcp.json` | Unitalk tools MCP server |
| `skills/unitalk-core/` | Prospection, call prep, email triage, admin procedures |
| `cron/jobs.json` | Scheduled jobs (installed paused — review with `hermes -p alma cron list`) |

## Review before you trust

Cron jobs ship **paused** and must be enabled deliberately. `SOUL.md` and skills are active the moment you chat — read them first.

## Version

Current: **1.0.0**. Track with `hermes profile info alma`.

## License

MIT