CREATE VIEW analysis.order_status_log AS
    SELECT order_id, status_id, dttm
    FROM production.orderstatuslog;