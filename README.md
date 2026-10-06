# Unitalk AI — Hermes Profile Distributions

Installable [Hermes Agent](https://hermes-agent.nousresearch.com/docs/user-guide/profile-distributions) profiles, built by Unitalk AI.

Each profile is a complete agent — personality, skills, config, cron jobs, MCP connections — packaged as its own git repository. Anyone with access can install the whole agent with one command, update it in place, and keep their own memories, sessions, and API keys untouched.

> **This repository is the catalogue.** Each profile lives in its own repo so it installs with a single command — Hermes takes `distribution.yaml` from the repo root, so a profile cannot live in a subfolder here.

## Available profiles

### SEO Auditor

A continuous SEO auditor that returns **impact-ranked action plans**, not diagnostics. Crawls sites as a search engine sees them, finds indexability defects, and ranks every finding by Impact ÷ Effort.

```bash
hermes profile install github.com/unitalkai/hermes-profile-seo-auditor --alias
```

| | |
|---|---|
| Repo | [unitalkai/hermes-profile-seo-auditor](https://github.com/unitalkai/hermes-profile-seo-auditor) |
| Version | 1.0.0 |
| Requires | `OPENAI_API_KEY` · optional `PAGESPEED_API_KEY`, `SERPAPI_KEY` |
| Skills | `seo-crawl`, `seo-onpage`, `seo-report` |
| Cron | Weekly site audit, monthly index coverage (both ship paused) |

Read the [profile README](https://github.com/unitalkai/hermes-profile-seo-auditor) for the full setup.

---

*More profiles are in development.*

## Installing

Every profile follows the same three steps.

**1. Install**

```bash
hermes profile install github.com/unitalkai/<repo-name> --alias
```

The installer shows the manifest — name, version, author, required env vars — before anything is written. Add `--yes` to skip the confirmation, `--name <local-name>` to install under a different profile name.

**2. Fill in API keys**

```bash
cp ~/.hermes/profiles/<name>/.env.EXAMPLE ~/.hermes/profiles/<name>/.env
```

Each profile ships a `.env.EXAMPLE` listing exactly which keys it needs. Credentials are never in the repo — every installer brings their own.

**3. Run it**

```bash
<name> chat                # with --alias
hermes -p <name> chat      # without
```

Profiles also work through any gateway platform (Telegram, Discord, Slack, …) — configure the channel for that profile and address it there.

## Updating

```bash
hermes profile update <name>
```

Distribution-owned files (`SOUL.md`, `skills/`, `mcp.json`, `cron/jobs.json`) are replaced from the new version. Your `config.yaml`, memories, sessions, reports, and API keys stay put. Pass `--force-config` if you want the distribution's config back too.

## Trust and safety

Profile distributions are unsigned. Installing one is like installing a browser extension: low friction, high power, trust the source.

Two things worth knowing before you run someone else's agent:

- **`SOUL.md` and skills are active immediately.** Read them before your first chat if you did not build the profile.
- **Cron jobs ship paused** and never schedule themselves. Review with `hermes -p <name> cron list` and enable only what you trust.

Never included in a distribution: `auth.json`, `.env`, `memories/`, `sessions/`, `state.db`, logs, caches. The installer strips these even if an author ships them by mistake.

## Repository naming

Profiles follow `hermes-profile-<name>` so they group together and are recognisable next to the org's other `hermes-*` repos.

| Repo | What it is |
|---|---|
| `hermes-profile-seo-auditor` | SEO auditing agent |
| `profiles-distribution` | This catalogue |

## License

MIT