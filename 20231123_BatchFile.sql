INSERT INTO globalparam_tm (app_name, param_name1, param_value1)
SELECT "INTERNAL_ORDER_STATUS", "250", "Pending BatchFile";


ALTER TABLE order_tm
ADD COLUMN batch_done_dt DATETIME,
ADD COLUMN batchfile_id INT;

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