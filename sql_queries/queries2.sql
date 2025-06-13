SELECT 
	DATE_FORMAT(date, '%Y-%m') AS month,
    tran.product_id,
    p.product_name,
    SUM(CASE 
    WHEN quantity >0 THEN quantity
    ELSE 0
    END) AS total_incoming,
    SUM(CASE 
	WHEN quantity <0 THEN ABS(quantity)
    ELSE 0
    END) AS total_outgoing
FROM 
	inventory_project.inventory_transactions AS tran
    JOIN `inventory_project`.`products` AS p
    ON tran.product_id = p.product_id
GROUP BY month, tran.product_id
ORDER BY month
;