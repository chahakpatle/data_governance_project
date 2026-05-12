USE data_governance_db;

-- ============================================
-- DATASET QUALITY SCORE REPORT
-- ============================================

SELECT
    d.dataset_name,
    q.quality_score,
    q.total_rules_checked,
    q.total_rules_passed,
    q.total_rules_failed,
    q.evaluation_date
FROM quality_scores q
JOIN datasets d
ON q.dataset_id = d.dataset_id;



-- ============================================
-- OPEN DATA QUALITY ISSUES REPORT
-- ============================================

SELECT
    d.dataset_name,
    i.issue_description,
    i.affected_record_count,
    i.issue_status,
    i.detected_at
FROM data_quality_issues i
JOIN datasets d
ON i.dataset_id = d.dataset_id
WHERE i.issue_status = 'Open';



-- ============================================
-- SENSITIVE COLUMNS REPORT
-- ============================================

SELECT
    d.dataset_name,
    c.column_name,
    c.sensitivity_level,
    c.business_definition
FROM columns_metadata c
JOIN datasets d
ON c.dataset_id = d.dataset_id
WHERE c.sensitivity_level IN ('Sensitive', 'Confidential');



-- ============================================
-- CRITICAL QUALITY RULES REPORT
-- ============================================

SELECT
    d.dataset_name,
    r.rule_name,
    r.rule_type,
    r.severity_level
FROM data_quality_rules r
JOIN datasets d
ON r.dataset_id = d.dataset_id
WHERE r.severity_level = 'Critical';



-- ============================================
-- DATASET OWNERSHIP REPORT
-- ============================================

SELECT
    dataset_name,
    data_owner,
    source_system,
    update_frequency
FROM datasets;