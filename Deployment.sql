
-- Deployment
    -- user_tm
        CREATE TABLE IF NOT EXISTS user_tm (
            id              INT AUTO_INCREMENT PRIMARY KEY,
            created_dt      DATETIME,
            last_login_dt   DATETIME,
            role_id         INT,
            username        VARCHAR(20),
            password        VARCHAR(60)
        )  ENGINE=INNODB;
    
    -- role_tm
		    CREATE TABLE IF NOT EXISTS role_tm (
            id              INT AUTO_INCREMENT PRIMARY KEY,
			      role_name		    VARCHAR(20)
        )  ENGINE=INNODB;

    -- order_tm
        CREATE TABLE IF NOT EXISTS order_tm (
            id                  INT AUTO_INCREMENT PRIMARY KEY,
            ecommerce_code    	VARCHAR(1),
            cust_phone_no       VARCHAR(50),
            feeding_dt          DATETIME,
            last_updated_ts     DATETIME,
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
        CREATE TABLE IF NOT EXISTS globallogging_th (
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

-- Param
	insert into hcxprocesssyncstatus_tm(platform_name, initial_sync)
	select "TOKOPEDIA", "2023-03-10"
	from dual
    WHERE NOT EXISTS (SELECT * FROM hcxprocesssyncstatus_tm WHERE platform_name = "TOKOPEDIA");
    
	insert into role_tm(role_name)
	select "admin" 		UNION ALL
    select "designer" 	UNION ALL
    select "printer" 	UNION ALL
    select "packer"
    from dual
    WHERE NOT EXISTS (SELECT * FROM role_tm);

    insert into user_tm(created_dt, role_id, username, password)
    select now(), 1, 'admin', '$2a$12$mrrY0mbxb8L35bVkKBMIVeUuWdiqcbDiYjtR5qucxh3y2v50ZqGKu';