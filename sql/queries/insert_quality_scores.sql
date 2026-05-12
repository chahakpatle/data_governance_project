USE data_governance_db;

INSERT INTO quality_scores (
    dataset_id,
    quality_score,
    total_rules_checked,
    total_rules_passed,
    total_rules_failed
)
VALUES

(
    1,
    75.00,
    4,
    3,
    1
),

(
    2,
    66.67,
    3,
    2,
    1
);