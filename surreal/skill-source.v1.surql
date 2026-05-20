-- AGenNext Skill Source Records v1
-- Skills are native SurrealDB records.
-- YAML/JSON skill files are authoring/import representations only.
-- Agent-Skills owns the skill source record shape.
-- Agent-Grammar owns validation rules and acceptance checks.

DEFINE TABLE skill_source_v1 SCHEMAFULL;

DEFINE FIELD context ON TABLE skill_source_v1 TYPE record<grammar_context> ASSERT $value.allowed_for_source = true AND $value.owner = "Agent-Graph";
DEFINE FIELD type ON TABLE skill_source_v1 TYPE string ASSERT $value INSIDE ["ag:Skill", "Skill"];

DEFINE FIELD skill_id ON TABLE skill_source_v1 TYPE string ASSERT string::matches($value, "^[a-z0-9]+(\\.[a-z0-9_]+)+$");
DEFINE FIELD name ON TABLE skill_source_v1 TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD version ON TABLE skill_source_v1 TYPE string ASSERT string::matches($value, "^[0-9]+\\.[0-9]+\\.[0-9]+(-[A-Za-z0-9.-]+)?$");
DEFINE FIELD lifecycle_status ON TABLE skill_source_v1 TYPE string ASSERT $value INSIDE ["draft", "reviewed", "approved", "published", "deprecated"];

DEFINE FIELD category ON TABLE skill_source_v1 TYPE string ASSERT string::matches($value, "^[a-z0-9]+(-[a-z0-9]+)*$");
DEFINE FIELD risk ON TABLE skill_source_v1 TYPE string ASSERT $value INSIDE ["low", "medium", "high", "critical"];
DEFINE FIELD description ON TABLE skill_source_v1 TYPE option<string>;
DEFINE FIELD creator ON TABLE skill_source_v1 TYPE option<any>;
DEFINE FIELD publisher ON TABLE skill_source_v1 TYPE option<any>;

DEFINE FIELD runtime_profiles ON TABLE skill_source_v1 TYPE array<string>;
DEFINE FIELD required_tools ON TABLE skill_source_v1 TYPE array<string>;
DEFINE FIELD required_secrets ON TABLE skill_source_v1 TYPE option<array<string>>;
DEFINE FIELD approval_required ON TABLE skill_source_v1 TYPE bool DEFAULT false;

DEFINE FIELD inputs ON TABLE skill_source_v1 TYPE object;
DEFINE FIELD outputs ON TABLE skill_source_v1 TYPE object;

DEFINE FIELD graph_context_owner ON TABLE skill_source_v1 TYPE string ASSERT $value = "Agent-Graph";
DEFINE FIELD semantic_class ON TABLE skill_source_v1 TYPE string ASSERT $value = "CreativeWork";
DEFINE FIELD graph_ownership ON TABLE skill_source_v1 TYPE string ASSERT $value = "Agent-Graph";
DEFINE FIELD does_not_define_graph_schema ON TABLE skill_source_v1 TYPE bool ASSERT $value = true;
DEFINE FIELD published_structured_data_context ON TABLE skill_source_v1 TYPE option<record<grammar_context>> ASSERT $value = NONE OR $value.usage = "published_export";

DEFINE FIELD source_repository ON TABLE skill_source_v1 TYPE option<string>;
DEFINE FIELD source_path ON TABLE skill_source_v1 TYPE option<string>;
DEFINE FIELD source_format ON TABLE skill_source_v1 TYPE option<string> ASSERT $value = NONE OR $value INSIDE ["yaml", "json", "markdown", "html", "text"];
DEFINE FIELD source_commit_sha ON TABLE skill_source_v1 TYPE option<string>;
DEFINE FIELD source_hash ON TABLE skill_source_v1 TYPE option<string>;

DEFINE FIELD date_created ON TABLE skill_source_v1 TYPE option<datetime>;
DEFINE FIELD date_modified ON TABLE skill_source_v1 TYPE option<datetime>;
DEFINE FIELD created_at ON TABLE skill_source_v1 TYPE datetime DEFAULT time::now();
DEFINE FIELD updated_at ON TABLE skill_source_v1 TYPE datetime DEFAULT time::now();

DEFINE INDEX skill_source_v1_skill_id_version ON TABLE skill_source_v1 FIELDS skill_id, version UNIQUE;
DEFINE INDEX skill_source_v1_name ON TABLE skill_source_v1 FIELDS name;
DEFINE INDEX skill_source_v1_category ON TABLE skill_source_v1 FIELDS category;
DEFINE INDEX skill_source_v1_risk ON TABLE skill_source_v1 FIELDS risk;
DEFINE INDEX skill_source_v1_lifecycle_status ON TABLE skill_source_v1 FIELDS lifecycle_status;
DEFINE INDEX skill_source_v1_source_hash ON TABLE skill_source_v1 FIELDS source_hash;

-- updated_at is set by import/update pipelines to avoid event recursion.
