CREATE TABLE analysis.dm_rfm_segments(
    user_id INTEGER PRIMARY KEY,
    recency SMALLINT
        CHECK (recency IS NOT NULL AND recency BETWEEN 1 AND 5),
    frequency SMALLINT
        CHECK (frequency IS NOT NULL AND frequency BETWEEN 1 AND 5),
    monetary_value SMALLINT
        CHECK (monetary_value IS NOT NULL AND monetary_value BETWEEN 1 AND 5)
);