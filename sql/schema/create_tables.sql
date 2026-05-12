USE data_governance_db;

CREATE TABLE datasets (
    dataset_id INT PRIMARY KEY AUTO_INCREMENT,
    dataset_name VARCHAR(100) NOT NULL,
    dataset_description TEXT,
    data_owner VARCHAR(100),
    source_system VARCHAR(100),
    update_frequency VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE columns_metadata (
    column_id INT PRIMARY KEY AUTO_INCREMENT,
    dataset_id INT,
    column_name VARCHAR(100) NOT NULL,
    data_type VARCHAR(50),
    is_nullable BOOLEAN,
    sensitivity_level VARCHAR(50),
    business_definition TEXT,

    FOREIGN KEY (dataset_id)
    REFERENCES datasets(dataset_id)
);

CREATE TABLE data_quality_rules (
    rule_id INT PRIMARY KEY AUTO_INCREMENT,
    dataset_id INT,
    column_id INT,
    rule_name VARCHAR(100) NOT NULL,
    rule_description TEXT,
    rule_type VARCHAR(50),
    validation_condition TEXT,
    severity_level VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (dataset_id)
    REFERENCES datasets(dataset_id),

    FOREIGN KEY (column_id)
    REFERENCES columns_metadata(column_id)
);

CREATE TABLE data_quality_issues (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    rule_id INT,
    dataset_id INT,
    issue_description TEXT,
    affected_record_count INT,
    issue_status VARCHAR(50),
    detected_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resolved_at TIMESTAMP NULL,

    FOREIGN KEY (rule_id)
    REFERENCES data_quality_rules(rule_id),

    FOREIGN KEY (dataset_id)
    REFERENCES datasets(dataset_id)
);

CREATE TABLE quality_scores (
    score_id INT PRIMARY KEY AUTO_INCREMENT,
    dataset_id INT,
    quality_score DECIMAL(5,2),
    total_rules_checked INT,
    total_rules_passed INT,
    total_rules_failed INT,
    evaluation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (dataset_id)
    REFERENCES datasets(dataset_id)
);