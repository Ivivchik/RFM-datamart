WITH t AS (
    SELECT
        user_id,
        COUNT(
            CASE 
            WHEN STATUS = 4 THEN order_id 
            END
        ) AS quantity_of_orders,
        SUM(
            CASE
            WHEN STATUS = 4 THEN "cost" 
            ELSE 0
            END
        ) AS sum_of_orders,
        MAX(
            CASE
            WHEN STATUS  = 4 THEN order_ts
            ELSE '1970-01-01 00:00:00.000'
            END
        ) AS time_last_order
    FROM analysis.orders
    GROUP BY user_id
)

INSERT INTO analysis.dm_rfm_segments
    SELECT
        user_id,
        NTILE(5) OVER (ORDER BY time_last_order) AS recency,
        NTILE(5) OVER (ORDER BY quantity_of_orders) AS frequency,
        NTILE(5) OVER (ORDER BY sum_of_orders) AS monetary_value
    FROM t;