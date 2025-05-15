USE safedelivery_courierdb;

TRUNCATE TABLE delivery_branch_transfers;
TRUNCATE TABLE delivery_branch_transfer_details;

TRUNCATE TABLE parcels;
TRUNCATE TABLE parcel_logs;
TRUNCATE TABLE parcel_delivery_payments;
TRUNCATE TABLE parcel_delivery_payment_details;
TRUNCATE TABLE parcel_merchant_delivery_payments;
TRUNCATE TABLE parcel_merchant_delivery_payment_details;

TRUNCATE TABLE parcel_payment_requests;
TRUNCATE TABLE parcel_pickup_requests;

TRUNCATE TABLE return_branch_transfers;
TRUNCATE TABLE return_branch_transfer_details;

TRUNCATE TABLE rider_payments;
TRUNCATE TABLE rider_runs;
TRUNCATE TABLE rider_run_details;



-- to delete all data in the tables



SELECT merchant_id, COUNT(*) AS occurrence_count
FROM merchant_service_area_return_charges
GROUP BY merchant_id
HAVING COUNT(*) > 3;

-- to merchant_id, COUNT(*) AS occurrence_count



DELETE merchants, merchant_shops
FROM merchants
LEFT JOIN merchant_shops ON merchants.id = merchant_shops.merchant_id
WHERE merchants.m_id = 'M-0304';

-- to delete all data in the tables

DELETE m, ms
FROM merchants m
LEFT JOIN merchant_shops ms ON m.id = ms.merchant_id
WHERE m.m_id = 'M-0132';
-- to delete all data in the tables

 DELETE ms, m FROM merchants m JOIN merchant_shops ms ON m.id = ms.merchant_id WHERE m.m_id ='M-0243'; 
-- to delete all data in the tables


UPDATE `parcels` SET `return_charge` = '0' WHERE `return_charge` != 0 AND `delivery_type` IN (1,2);
-- to update all data in the tables


SET @time := NOW();

UPDATE merchants
SET created_at = (@time := DATE_ADD(@time, INTERVAL 1 SECOND))
ORDER BY id ASC;

-- For Time Update



UPDATE riders
SET contact_number = CONCAT('0', contact_number);

-- to update all data in the tables


INSERT INTO merchant_shops (shop_name, shop_address, merchant_id, branch_id, district_id, area_id, contact_number, status, is_default, created_at, updated_at)
SELECT
    company_name, 
    address, 
    id AS merchant_id, 
    branch_id, 
    district_id, 
    area_id, 
    contact_number, 
    1 AS status, 
    1 AS is_default, 
    NOW() AS created_at, 
    NOW() AS updated_at
FROM merchants;

-- TO Insart merchant Shop 




UPDATE parcels
SET parcel_code = FLOOR(1000 + RAND() * 8000)
WHERE status IN (14, 24);

-- UPDATE parcels



SELECT * FROM parcel_merchant_delivery_payments WHERE total_payment_amount != 0 AND total_payment_received_amount = 0 AND status = 2

-- Merchant Payment Check

SELECT p.id
FROM parcels p
JOIN parcel_merchant_delivery_payment_details pd
    ON p.id = pd.parcel_id
WHERE p.merchant_id = 444
  AND p.payment_type != 5;




  UPDATE rider_run_details
SET 
    complete_note = 'Out Of Coverage',
    collected_amount = 0,
    status = 7,
    delivery_type = 4
WHERE rider_run_id = 15071;

-- to update all data in the tables



UPDATE `rider_run_details`
SET 
    `complete_note` = 'Out Of Coverage',
    `collected_amount` = 0,
    `status` = 7,
    `delivery_type` = 4
WHERE `rider_run_id` = 15071;

-- to update all data in the tables

UPDATE `parcels` SET 
 `status` = '24'
 WHERE `parcel_invoice` IN (

);


UPDATE parcels
SET cod_charge = 0, cod_percent = 0
WHERE merchant_id = 345 AND cod_percent = 1;
-- to update all data in the tables



UPDATE parcels
SET total_charge = total_charge - cod_charge
WHERE merchant_id = 345;
-- to update all data in the tables



ALTER TABLE merchant_shops CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO merchant_shops (shop_name, shop_address, merchant_id, branch_id, district_id, area_id, contact_number, status, is_default, created_at, updated_at)
SELECT 
    company_name AS shop_name, 
    address AS shop_address, 
    id AS merchant_id, 
    branch_id, 
    district_id, 
    area_id, 
    contact_number, 
    1 AS status, 
    1 AS is_default,
    NOW() AS created_at,
    NOW() AS updated_at
FROM 
    merchants;

-- This query will insert new records into the `merchant_shops` table by selecting data from the `merchants` table and transforming it as needed.


TRUNCATE TABLE jzcourier_db.delivery_branch_transfers;
TRUNCATE TABLE jzcourier_db.delivery_branch_transfer_details;

TRUNCATE TABLE jzcourier_db.parcels;
TRUNCATE TABLE jzcourier_db.parcel_logs;
TRUNCATE TABLE jzcourier_db.parcel_delivery_payments;
TRUNCATE TABLE jzcourier_db.parcel_delivery_payment_details;
TRUNCATE TABLE jzcourier_db.parcel_merchant_delivery_payments;
TRUNCATE TABLE jzcourier_db.parcel_merchant_delivery_payment_details;

TRUNCATE TABLE jzcourier_db.parcel_payment_requests;
TRUNCATE TABLE jzcourier_db.parcel_pickup_requests;

TRUNCATE TABLE jzcourier_db.return_branch_transfers;
TRUNCATE TABLE jzcourier_db.return_branch_transfer_details;

TRUNCATE TABLE jzcourier_db.rider_payments;
TRUNCATE TABLE jzcourier_db.rider_runs;
TRUNCATE TABLE jzcourier_db.rider_run_details;

-- to delete all data in the tables






