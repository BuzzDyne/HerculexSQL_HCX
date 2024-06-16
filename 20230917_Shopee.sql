USE sql_hcx;

ALTER TABLE hcxprocesssyncstatus_tm
ADD COLUMN access_token VARCHAR(32),
ADD COLUMN refresh_token VARCHAR(32),
ADD COLUMN refresh_token_expire_YYYYMMDD VARCHAR(32);

ALTER TABLE orderitem_tr
ADD COLUMN thumb_url VARCHAR(2000);

ALTER TABLE orderitem_tr
MODIFY ecom_order_id VARCHAR(100);

ALTER TABLE order_tm
MODIFY ecom_order_status VARCHAR(100);

ALTER TABLE order_tm
ADD internal_status_id VARCHAR(3);

ALTER TABLE order_tm
ADD pic_user_id INT;

INSERT INTO hcxprocesssyncstatus_tm(platform_name)
SELECT "SHOPEE"
FROM dual
WHERE NOT EXISTS (SELECT * FROM hcxprocesssyncstatus_tm WHERE platform_name = "SHOPEE");

INSERT INTO globalparam_tm (app_name, param_name1, param_value1)
SELECT "INTERNAL_ORDER_STATUS", "000", "New Order" UNION ALL
SELECT "INTERNAL_ORDER_STATUS", "100", "Waiting Design" UNION ALL
SELECT "INTERNAL_ORDER_STATUS", "200", "Pending Approval" UNION ALL
SELECT "INTERNAL_ORDER_STATUS", "300", "Printing" UNION ALL
SELECT "INTERNAL_ORDER_STATUS", "400", "Packing" UNION ALL
SELECT "INTERNAL_ORDER_STATUS", "999", "Complete";