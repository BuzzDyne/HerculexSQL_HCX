USE sql_hcx;

ALTER TABLE hcxprocesssyncstatus_tm
ADD COLUMN access_token VARCHAR(32),
ADD COLUMN refresh_token VARCHAR(32),
ADD COLUMN refresh_token_expire_YYYYMMDD VARCHAR(32);

ALTER TABLE orderitem_tr
ADD COLUMN thumb_url VARCHAR(2000);

ALTER TABLE orderitem_tr
MODIFY ecom_order_id VARCHAR(100);

INSERT INTO hcxprocesssyncstatus_tm(platform_name)
SELECT "SHOPEE"
FROM dual
WHERE NOT EXISTS (SELECT * FROM hcxprocesssyncstatus_tm WHERE platform_name = "SHOPEE");
