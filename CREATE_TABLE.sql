
-- Deployment
    -- User_TM
        CREATE TABLE IF NOT EXISTS User_TM (
            id              INT AUTO_INCREMENT PRIMARY KEY,
            created_dt      DATETIME,
            last_login_dt   DATETIME,
            role            VARCHAR(20),
            username        VARCHAR(20),
            password        CHAR(40)
        )  ENGINE=INNODB;

    -- Order_TM
        CREATE TABLE IF NOT EXISTS Order_TM (
            id                  INT AUTO_INCREMENT PRIMARY KEY,
            ecommerce_source    VARCHAR(10),
            internal_label      VARCHAR(50),
            cust_phone_no       VARCHAR(50),
            feeding_dt          DATETIME,
            deadline_dt         DATETIME,
            design_acc_dt       DATETIME,
            print_done_dt       DATETIME,

            buyer_id            VARCHAR(50),
            invoice_ref         VARCHAR(50),
            order_status        VARCHAR(3)
        )  ENGINE=INNODB;

    -- OrderItem_TR
        CREATE TABLE IF NOT EXISTS OrderItem_TR (
            id              INT AUTO_INCREMENT PRIMARY KEY,
            order_id        INT NOT NULL, -- Order.id
            product_id      VARCHAR(200), -- Dari eCommerce
            product_name    VARCHAR(200),
            quantity        INT,
            product_price   DECIMAL
        )  ENGINE=INNODB;

    -- OrderThumbnail_TR
        CREATE TABLE IF NOT EXISTS OrderThumbnail_TR (
            id              INT AUTO_INCREMENT PRIMARY KEY,
            order_id        INT NOT NULL, -- Order.id
            url             VARCHAR(200),
            description     VARCHAR(200),
            created_dt      DATETIME
        )  ENGINE=INNODB;

    -- OrderActivity_TR
        CREATE TABLE IF NOT EXISTS OrderActivity_TR (
            id              INT AUTO_INCREMENT PRIMARY KEY,
            order_id        INT NOT NULL, -- Order.id
            creator_id      INT NOT NULL, -- User.id
            message         TEXT,
            created_dt      DATETIME
        )  ENGINE=INNODB;

    -- GlobalParam_TM
        CREATE TABLE IF NOT EXISTS GlobalParam_TM (
            id              INT AUTO_INCREMENT PRIMARY KEY,
            app_name        VARCHAR(200),
            param_name1      VARCHAR(200),
            param_value1     VARCHAR(200),
            param_name2      VARCHAR(200),
            param_value2     VARCHAR(200),
            param_name3      VARCHAR(200),
            param_value3     VARCHAR(200)
        )  ENGINE=INNODB;
    
    -- GlobalLogging_TH
        CREATE TABLE IF NOT EXISTS GlobalLogging_TH (
            id                  INT AUTO_INCREMENT PRIMARY KEY,
            application_name    VARCHAR(50),
            activity_date       DATETIME,
            activity_type       VARCHAR(50),
            description         VARCHAR(255)
        )

    -- HCXProcessSyncStatus_TM
        CREATE TABLE IF NOT EXISTS HCXProcessSyncStatus_TM (
            id                  INT AUTO_INCREMENT PRIMARY KEY,
            platform_name       VARCHAR(50),
            initial_sync        DATETIME,
            last_synced         DATETIME
        )
