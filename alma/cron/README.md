# Alma Cron Jobs

Scheduled tasks that run automatically.

## Active Jobs

### daily-prospection
- **Schedule:** Weekdays at 9:00 AM
- **Task:** Run daily prospection routine for assigned leads
- **Output:** Updates CRM with new leads, sends summary to team

### email-triage
- **Schedule:** Every 4 hours
- **Task:** Triage inbox and prioritize urgent threads
- **Output:** Tags emails, drafts responses for review

## Adding Cron Jobs

Add to `distribution.yaml`:

```yaml
cron:
  - name: my-job
    schedule: "0 9 * * 1-5"  # Cron syntax
    task: "Description of what to do"
```

See [cron documentation](https://hermes-agent.nousresearch.com/docs/user-guide/cron) for syntax.
