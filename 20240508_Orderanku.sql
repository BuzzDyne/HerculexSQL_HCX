USE sql_hcx;

CREATE TABLE IF NOT EXISTS orderanku_item_tm (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    creation_data       DATETIME,
    recipient_name      VARCHAR(100),
    recipient_provinsi  VARCHAR(50),
    recipient_kota_kab  VARCHAR(50),
    recipient_kecamatan VARCHAR(50),
    recipient_kelurahan VARCHAR(50),
    recipient_address   VARCHAR(200),
    order_details       VARCHAR(1000),
    order_total         DECIMAL,
    created_date		DATETIME,
    print_date          DATETIME,
    paid_date           DATETIME,
    seller_id           INT    
);

CREATE TABLE IF NOT EXISTS orderanku_seller_tr (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    seller_name         VARCHAR(100),
    seller_phone        VARCHAR(20)
)

