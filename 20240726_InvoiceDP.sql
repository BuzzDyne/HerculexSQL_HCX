ALTER TABLE orderdocument_tm
ADD COLUMN down_payment DECIMAL;

UPDATE orderdocument_tm
SET down_payment = 0
WHERE down_payment IS NULL;