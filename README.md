# Unitalk AI — Profile Distributions

A collection of ready-to-use [Hermes Agent](https://github.com/NousResearch/hermes-agent) profiles, packaged as git distributions.

## What's in here

Each folder is a self-contained profile distribution — personality, skills, config, cron jobs, and MCP connections. Install one with a single command and you get a fully configured agent.

| Profile | Description | Install |
|---------|-------------|---------|
| [`alma`](./alma/) | Unitalk AI collaborator — autonomous prospection, calls, emails, admin tasks | `hermes profile install github.com/unitalkai/profiles-distribution#alma` |

## Install

```bash
# Install a specific profile
hermes profile install github.com/unitalkai/profiles-distribution#alma

# Or clone and install locally
git clone https://github.com/unitalkai/profiles-distribution.git
cd profiles-distribution
hermes profile install ./alma --alias alma
```

## Update

```bash
hermes profile update alma
```

Your memories, sessions, and API keys are preserved on update.

## Credentials

Each profile ships a `.env.EXAMPLE` with the required environment variables. Copy it to `.env` and fill in your own keys:

```bash
cd ~/.hermes/profiles/alma
cp .env.EXAMPLE .env
# Edit .env with your API keys
```

## Structure

```
profiles-distribution/
├── README.md              # This file
├── alma/                  # Profile distribution
│   ├── distribution.yaml  # Manifest (name, version, env requirements)
│   ├── SOUL.md            # Agent personality / system prompt
│   ├── config.yaml        # Model, temperature, tool defaults
│   ├── .env.EXAMPLE       # Required environment variables
│   ├── skills/            # Bundled skills
│   ├── cron/              # Scheduled tasks
│   └── mcp.json           # MCP server connections
└── <next-profile>/
    └── ...
```

## License

MIT
