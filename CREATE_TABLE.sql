
-- Deployment
    -- user_tm
        CREATE TABLE IF NOT EXISTS user_tm (
            id              INT AUTO_INCREMENT PRIMARY KEY,
            created_dt      DATETIME,
            last_login_dt   DATETIME,
            role            VARCHAR(20),
            username        VARCHAR(20),
            password        CHAR(40)
        )  ENGINE=INNODB;

    -- order_tm
        CREATE TABLE IF NOT EXISTS order_tm (
            id                  INT AUTO_INCREMENT PRIMARY KEY,
            ecommerce_code    	VARCHAR(1),
            cust_phone_no       VARCHAR(50),
            feeding_dt          DATETIME,
            user_deadline_dt    DATETIME,
            pltf_deadline_dt    DATETIME,
            design_acc_dt       DATETIME,
            print_done_dt       DATETIME,

            buyer_id            VARCHAR(50),
            ecom_order_id	    VARCHAR(100),
            ecom_order_status	VARCHAR(10),
            invoice_ref         VARCHAR(50)
        )  ENGINE=INNODB;

    -- orderitem_tr
        CREATE TABLE IF NOT EXISTS orderitem_tr (
            id              INT AUTO_INCREMENT PRIMARY KEY,
            ecom_order_id   INT NOT NULL, -- Order.id
            ecom_product_id VARCHAR(200), -- Dari eCommerce
            product_name    VARCHAR(200),
            quantity        INT,
            product_price   DECIMAL
        )  ENGINE=INNODB;

    -- orderthumbnail_tr
        CREATE TABLE IF NOT EXISTS orderthumbnail_tr (
            id              INT AUTO_INCREMENT PRIMARY KEY,
            order_id        INT NOT NULL, -- Order.id
            url             VARCHAR(200),
            description     VARCHAR(200),
            created_dt      DATETIME
        )  ENGINE=INNODB;

    -- orderactivity_tr
        CREATE TABLE IF NOT EXISTS orderactivity_tr (
            id              INT AUTO_INCREMENT PRIMARY KEY,
            order_id        INT NOT NULL, -- Order.id
            creator_id      INT NOT NULL, -- User.id
            message         TEXT,
            created_dt      DATETIME
        )  ENGINE=INNODB;

    -- globalparam_tm
        CREATE TABLE IF NOT EXISTS globalparam_tm (
            id              INT AUTO_INCREMENT PRIMARY KEY,
            app_name        VARCHAR(200),
            param_name1      VARCHAR(200),
            param_value1     VARCHAR(200),
            param_name2      VARCHAR(200),
            param_value2     VARCHAR(200),
            param_name3      VARCHAR(200),
            param_value3     VARCHAR(200)
        )  ENGINE=INNODB;
    
    -- globallogging_TH
        CREATE TABLE IF NOT EXISTS globallogging_TH (
            id                  INT AUTO_INCREMENT PRIMARY KEY,
            application_name    VARCHAR(50),
            activity_date       DATETIME,
            activity_type       VARCHAR(50),
            description         VARCHAR(255)
        )  ENGINE=INNODB;

    -- hcxprocesssyncstatus_tm
        CREATE TABLE IF NOT EXISTS hcxprocesssyncstatus_tm (
            id                  INT AUTO_INCREMENT PRIMARY KEY,
            platform_name       VARCHAR(50),
            initial_sync        DATETIME,
            last_synced         DATETIME
        )  ENGINE=INNODB;
