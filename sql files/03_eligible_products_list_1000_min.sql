/*File: 03_eligible_products_list_1000_min
 * 
 * Description: Returns the full population of eligible products
 * 		with a minimum of 1000 purchases and each products reorder rate.
 * 
 * Author: Morgan Kelehar (Data Lead)*/

select 
	opp.product_id,
	p.product_name,
	round(avg(opp.reordered::numeric)*100,2) as reorder_rate
from instacart.products p join instacart.order_products_prior opp
	on p.product_id = opp.product_id 
where p.department_id <> 21 -- excludes 'missing' department (21)
	and p.aisle_id <> 100 -- excludes 'missing' aisle (100)
group by opp.product_id, p.product_name
having count(*) >= 1000;