
SELECT * FROM `tbl_raw_material` WHERE `raw_material_id` = 36; 
SELECT * FROM `tbl_purchase_details` WHERE `raw_material_id` = 36
SELECT * FROM `tbl_stock_transfer_details` WHERE `raw_material_id` = 36
SELECT * FROM `tbl_stock_adjustment_log` WHERE `raw_material_id`=36;
SELECT * FROM `tbl_stock_raw_material` WHERE `raw_material_id` = 36



-- to total stock of a raw material



TRUNCATE `tbl_purchase`;
TRUNCATE `tbl_purchase_details`;
TRUNCATE `tbl_purchase_payment`;
TRUNCATE `tbl_stock_adjustment_log`;
TRUNCATE `tbl_stock_raw_material`;
TRUNCATE `tbl_stock_transfer`;
TRUNCATE `tbl_stock_transfer_details`;
TRUNCATE `tbl_stock_transfer_pivot`;
TRUNCATE `tbl_wastage`;

-- to delete all data in the tables



-- For RES POS Update Data unit cost from old unitcost Same ID 

UPDATE tbl_stock_raw_material AS t1
JOIN (
    SELECT raw_material_id, MAX(unit_cost) AS max_unit_cost
    FROM tbl_stock_raw_material
    WHERE unit_cost > 0
    GROUP BY raw_material_id
) AS t2 ON t1.raw_material_id = t2.raw_material_id
SET t1.unit_cost = t2.max_unit_cost
WHERE t1.unit_cost = 0;


UPDATE `tbl_sales` SET `sale_status` = '1' WHERE `user_id` = 102 AND `sale_status` = 0;



