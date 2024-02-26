
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
            ecom_order_id	    VARCHAR(100),
            ecom_order_status   VARCHAR(100),
            internal_status_id  VARCHAR(3),
            pic_user_id         INT,
            batchfile_id        INT,
            cust_phone_no       VARCHAR(50),
            feeding_dt          DATETIME,
            buyer_id            VARCHAR(50),
            invoice_ref         VARCHAR(50),
            last_updated_ts     DATETIME,
            user_deadline_prd   VARCHAR(8),
            pltf_deadline_dt    DATETIME,
            initial_input_dt    DATETIME,
            design_acc_dt       DATETIME,
            design_sub_dt       DATETIME,
            batch_done_dt       DATETIME,
            print_done_dt       DATETIME,
            packing_done_dt     DATETIME,
            shipped_dt          DATETIME,
            google_folder_url   VARCHAR(2000),
            google_file_url     VARCHAR(2000),
            thumb_url           VARCHAR(2000)
        )  ENGINE=INNODB;

    -- orderitem_tr
        CREATE TABLE IF NOT EXISTS orderitem_tr (
            id              INT AUTO_INCREMENT PRIMARY KEY,
            ecom_order_id   VARCHAR(100) NOT NULL,
            ecom_product_id VARCHAR(200),
            product_name    VARCHAR(200),
            quantity        INT,
            product_price   DECIMAL,
            thumb_url       VARCHAR(2000)
        )  ENGINE=INNODB;

    -- ordertracking_th
        CREATE TABLE IF NOT EXISTS ordertracking_th (
            id              INT AUTO_INCREMENT PRIMARY KEY,
            order_id        INT NOT NULL, -- Order.id
            activity_date   DATETIME DEFAULT CURRENT_TIMESTAMP,
            activity_msg    TEXT,
            user_id         INT
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

    -- orderbatchfile_tm
        CREATE TABLE IF NOT EXISTS orderbatchfile_tm (
            id                  INT AUTO_INCREMENT PRIMARY KEY,
            batch_name          VARCHAR(10),
            remarks             TEXT,
            create_dt           DATETIME,
            printed_dt          DATETIME,
            designer_user_id    INT,
            printer_user_id     INT
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
            initial_sync        BIGINT,
            last_synced         BIGINT,
            access_token        VARCHAR(32),
            refresh_token       VARCHAR(32),
            refresh_token_expire_YYYYMMDD VARCHAR(32)
        )  ENGINE=INNODB;


    -- ordercomment_th
        CREATE TABLE IF NOT EXISTS ordercomment_th (
            id              INT AUTO_INCREMENT PRIMARY KEY,
            creator_id      INT NOT NULL,
            order_id        INT NOT NULL,
            comment_text    TEXT,
            comment_date    DATETIME DEFAULT CURRENT_TIMESTAMP
        ) ENGINE=INNODB;

-- Param
	insert into hcxprocesssyncstatus_tm(platform_name, initial_sync)
	select "TOKOPEDIA", "1691107200"
	from dual
    WHERE NOT EXISTS (SELECT * FROM hcxprocesssyncstatus_tm WHERE platform_name = "TOKOPEDIA");
    
    INSERT INTO hcxprocesssyncstatus_tm(platform_name)
    SELECT "SHOPEE"
    FROM dual
    WHERE NOT EXISTS (SELECT * FROM hcxprocesssyncstatus_tm WHERE platform_name = "SHOPEE");

	insert into role_tm(role_name)
	select "admin" 		UNION ALL
    select "designer" 	UNION ALL
    select "printer" 	UNION ALL
    select "packer"
    from dual
    WHERE NOT EXISTS (SELECT * FROM role_tm);

    insert into user_tm(created_dt, role_id, username, password)
    select now(), NULL, 'System', NULL UNION ALL
    select now(), 1,    'admin', '$2a$12$mrrY0mbxb8L35bVkKBMIVeUuWdiqcbDiYjtR5qucxh3y2v50ZqGKu';

    INSERT INTO globalparam_tm (app_name, param_name1, param_value1)
    SELECT "INTERNAL_ORDER_STATUS", "000", "New Order"          UNION ALL
    SELECT "INTERNAL_ORDER_STATUS", "100", "Waiting Design"     UNION ALL
    SELECT "INTERNAL_ORDER_STATUS", "200", "Pending Approval"   UNION ALL
    SELECT "INTERNAL_ORDER_STATUS", "250", "Pending BatchFile"  UNION ALL
    SELECT "INTERNAL_ORDER_STATUS", "300", "Printing"           UNION ALL
    SELECT "INTERNAL_ORDER_STATUS", "400", "Packing"            UNION ALL
    SELECT "INTERNAL_ORDER_STATUS", "999", "Complete";