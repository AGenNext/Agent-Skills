# Agent-Skills

Agent-Skills is the reusable skill and capability catalog for AGenNext agents and agent teams.

## Decision

Agent-Skills owns reusable skill definitions.

Agent-Team composes skills into full agent products.

## Boundary

| Component | Responsibility |
|---|---|
| Agent-Skills | Reusable skills/capability definitions |
| Agent-Team | Composed agent teams/products |
| Agent-Blueprint | Planning contracts and blueprint outputs |
| Agent-Runtime | Executes workflows and actions |
| AgentKube | Kubernetes operations implementation |
| Agent-Security | Security checks and hardening gates |

## Agent-Skills owns

- skill catalog
- skill metadata
- skill input/output contracts
- required permissions
- required secrets
- risk classification
- approval requirements
- dependency declarations
- runtime compatibility

Agent-Skills does not own:

- full agent team composition
- runtime execution
- provider SDK implementations
- UI
- deployment automation

## Cloud skills

Initial cloud-agent skills:

```txt
cloud.inspect_server
linux.harden_node
k3s.install
kubernetes.deploy_manifest
surrealdb.deploy
security.preflight
compliance.collect_evidence
lifecycle.update_state
```

## Relationship

```txt
Agent-Skills defines reusable capabilities
  ↓
Agent-Blueprint selects skills for a plan
  ↓
Agent-Team composes skills into an agent product
  ↓
Agent-Runtime executes the generated workflow
```
