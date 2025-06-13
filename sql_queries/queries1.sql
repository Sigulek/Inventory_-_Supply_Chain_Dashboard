SELECT
	p.product_id, 
    p.product_name,
    SUM(quantity) AS stock_lvl
FROM 
	inventory_project.products AS p
    JOIN inventory_project.inventory_transactions as t
    ON p.product_id = t.product_id
GROUP BY p.product_id 
ORDER BY stock_lvl
;

SELECT
	p.product_id, 
    p.product_name,
    p.reorder_point,
    SUM(quantity) AS stock_lvl
FROM 
	inventory_project.products AS p
    JOIN inventory_project.inventory_transactions as t
    ON p.product_id = t.product_id 
GROUP BY p.product_id, p.product_name, p.reorder_point
HAVING p.reorder_point > stock_lvl
ORDER BY stock_lvl  
;

SELECT 
	supplier_name,
    AVG(DATEDIFF(delivery_date, order_date)) AS average_delivery_days,
    COUNT(*) AS total_deliveries
FROM 
	`inventory_project`.`supplier_deliveries` AS del
GROUP BY supplier_name
ORDER BY average_delivery_days
;

