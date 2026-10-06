# Alma Skills

This directory contains skills bundled with the Alma profile.

Skills are loaded automatically when Alma starts. Each skill is a self-contained procedure that Alma can invoke.

## Bundled Skills

Skills are installed from the distribution manifest (`distribution.yaml`). To add custom skills:

1. Create a skill folder: `skills/my-skill/SKILL.md`
2. Add frontmatter:
   ```yaml
   ---
   name: my-skill
   description: What this skill does
   ---
   ```
3. Write the skill body in markdown

See the [Hermes skills documentation](https://hermes-agent.nousresearch.com/docs/user-guide/skills) for details.
