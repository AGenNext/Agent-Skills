# Theory of Mind Skill

The Theory of Mind skill enables agents to reason about the beliefs, intentions, knowledge states, capabilities, permissions, trust levels, and uncertainties of humans, agents, teams, systems, and organizations.

This skill is designed for enterprise-grade agent systems where human-agent and multi-agent collaboration require more than task execution.

## Why this skill exists

Most agent systems evaluate whether an agent can complete a task.

This skill evaluates whether an agent understands:

- what the user wants,
- what another agent knows,
- what another agent does not know,
- whether a handoff is safe,
- whether assumptions are being made,
- whether trust is justified,
- whether clarification is required.

## Core capabilities

- Intent inference
- Belief modeling
- Knowledge attribution
- Capability modeling
- Trust calibration
- Perspective adaptation
- Uncertainty detection
- Handoff readiness evaluation

## Runtime usage

The skill should run:

- before planning,
- before handoff,
- before high-risk tool use,
- before final response generation.

## Benchmark

This skill is evaluated through Agent-ToMBench.

Benchmark scenarios include:

- false belief tasks,
- intent recovery tasks,
- knowledge attribution tasks,
- trust calibration tasks,
- handoff readiness tasks.

## Governance

The skill can block or warn when:

- intent confidence is low,
- shared knowledge is assumed,
- handoff readiness is insufficient,
- a receiving agent lacks required context,
- high-risk uncertainty exists,
- trust level is too low for delegation.

## Status

Draft skill package.
