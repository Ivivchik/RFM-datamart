CREATE VIEW analysis.orders AS
    SELECT order_id, order_ts, "cost", status, user_id
    FROM production.orders
    WHERE extract(YEAR FROM order_ts) >= 2021;