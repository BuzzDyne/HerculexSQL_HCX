CREATE TABLE IF NOT EXISTS orderdocument_tm (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    order_id            INT,
    doc_number          VARCHAR(100),
    doc_type            VARCHAR(1),
    cust_name           VARCHAR(30),
    cust_addr_1         VARCHAR(45),
    cust_addr_2         VARCHAR(45),
    cust_addr_3         VARCHAR(45),
    cust_addr_4         VARCHAR(45),
    cust_phone          VARCHAR(30),
    cust_fax            VARCHAR(30),
    due_date            VARCHAR(30),
    discount            DECIMAL,
    generated_date		DATETIME
);

CREATE TABLE IF NOT EXISTS orderdocumentitem_tr (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    order_doc_id        INT,
    item_name           VARCHAR(60),
    item_price          DECIMAL,
    item_qty            INT
)
