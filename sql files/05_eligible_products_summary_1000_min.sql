/*File: 05_eligible_products_summary_1000_min
 * 
 * Description: Calculates the total count of eligible products 
 * 		with a minimum of 1000 orders and the overall baseline 
 * 		unweighted average reorder rate.
 * 
 * Author: Morgan Kelehar (Data Lead)*/

with eligible_products as (
	select 
		opp.product_id,
		p.product_name,
		round(avg(opp.reordered::numeric)*100,2) as reorder_rate
	from instacart.products p join instacart.order_products_prior opp
		on p.product_id = opp.product_id 
	where p.department_id <> 21 -- excludes 'missing' department (21)
		and p.aisle_id <> 100 -- excludes 'missing' aisle (100)
	group by opp.product_id, p.product_name
	having count(*) >= 1000
)
select 
	count(*) as total_eligible_products,
	round(avg(reorder_rate),2) as avg_order_rate
from eligible_products;