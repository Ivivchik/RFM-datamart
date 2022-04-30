CREATE OR REPLACE VIEW analysis.orders AS
    SELECT o.order_id, order_ts, "cost", asfo.status_id AS status, user_id
    FROM production.orders AS o
    INNER JOIN (
            SELECT order_id, status_id
            FROM (
                SELECT
                    order_id,
                    ROW_NUMBER() OVER(PARTITION BY order_id ORDER BY dttm DESC) AS rn,
                    status_id
                FROM analysis.order_status_log
            ) AS t
            WHERE rn = 1
        ) asfo ON asfo.order_id = o.order_id
    WHERE extract(YEAR FROM order_ts) >= 2021;