
-- to product space remove 

UPDATE IGNORE `products`
SET `product_id` = REPLACE(`product_id`, ' ', '');


UPDATE IGNORE `online_order_details`
SET `product_id` = REPLACE(`product_id`, ' ', '');


UPDATE IGNORE `sale` SET `product_id` = REPLACE(`product_id`, ' ', '');


UPDATE `products`
SET `product_id` = REPLACE(`product_id`, ' ', '')


-- to product space remove 



-- 1. Add a new temporary column to store the cleaned product_id values
ALTER TABLE products ADD COLUMN temp_product_id VARCHAR(255);

-- 2. Update the temporary column with the cleaned product_id values
UPDATE products
SET temp_product_id = REPLACE(TRIM(product_id), ' ', '');

-- 3. Identify and delete duplicates, keeping one record for each temp_product_id
DELETE p1 FROM products p1
INNER JOIN products p2 
WHERE 
    p1.id > p2.id AND 
    p1.temp_product_id = p2.temp_product_id;

-- 4. Update the original product_id column with the cleaned values
UPDATE products
SET product_id = temp_product_id;

-- 5. Drop the temporary column
ALTER TABLE products DROP COLUMN temp_product_id;


-- to product space remove



UPDATE brand SET shop_id = '2' WHERE 1;
UPDATE supplier SET shop_id = '2' WHERE 1;
UPDATE category SET shop_id = '2' WHERE 1;
UPDATE sub_category SET shop_id = '2' WHERE 1;
UPDATE products SET shop_id = '2' WHERE 1;

-- to product update 

UPDATE products
SET product_id = TRIM(product_id);
 
-- to product space remove







✅ ফাইনাল SQL Query (with sale.date_time as payment.date_time):
Sale টেবিল থেকে payment টেবিলে ডেটা ইনসার্ট করার জন্য নিচের SQL কোডটি ব্যবহার করুন। এখানে sale টেবিলের date_time ফিল্ডকে payment টেবিলের date_time ফিল্ডে ব্যবহার করা হয়েছে।
```
INSERT INTO payment (
    customer_id,
    date_time,
    emi_discount_amount,
    amount,
    collected,
    fund_id,
    inv_no,
    note,
    previous_payment_collection,
    previous_payment_date,
    branch_id,
    user_id,
    status,
    created
)
SELECT
    s.customer_id,
    MAX(s.date_time),               -- এখানেই sale টেবিলের তারিখ বসানো হলো
    0.00,
    SUM(s.quantity * s.rate),
    SUM(s.quantity * s.rate),
    '1',
    s.inv_no,
    'Auto inserted from sale',
    0,
    NULL,
    MAX(s.branch_id),
    MAX(s.user_id),
    1,
    NOW()
FROM sale s
LEFT JOIN payment p ON s.inv_no = p.inv_no
WHERE p.inv_no IS NULL
GROUP BY s.inv_no, s.customer_id;

```