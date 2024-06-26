USE sql_hcx;

CREATE TABLE IF NOT EXISTS orderanku_item_tm (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    recipient_name      VARCHAR(100),
    recipient_phone     VARCHAR(20),
    recipient_provinsi  VARCHAR(50),
    recipient_kota_kab  VARCHAR(50),
    recipient_kecamatan VARCHAR(50),
    recipient_kelurahan VARCHAR(50),
    recipient_address   VARCHAR(200),
    order_details       VARCHAR(1000),
    order_bank          VARCHAR(100),
    order_total         DECIMAL,
    created_date		DATETIME,
    print_date          DATETIME,
    paid_date           DATETIME,
    seller_name         VARCHAR(100),
    seller_phone        VARCHAR(20),
    is_active           BIT DEFAULT 1
);

CREATE TABLE IF NOT EXISTS orderanku_seller_tr (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    seller_name         VARCHAR(100),
    seller_phone        VARCHAR(20)
);


-- Parameter
INSERT INTO orderanku_seller_tr (id, seller_name, seller_phone)
VALUES (1, 'Herculex', '08151912345') AS new
ON DUPLICATE KEY UPDATE
seller_name = new.seller_name,
seller_phone = new.seller_phone;
