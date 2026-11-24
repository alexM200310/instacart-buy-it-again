/*File: 09_top_20_avg_reorder_1000_min
 * 
 * Description: Calculates the unweighted mean reorder rate across the top 20 products
 * 		under a minimum threshold of 1000 prior-order purchases.
 * 
 * Author: Morgan Kelehar (Data Lead)*/

with top_20 as (
	select
		p.product_id
		,p.product_name
		,d.department
		,count(*) as total_orders
		,sum(opp.reordered) as n_reordered
		,round(avg(opp.reordered::numeric) * 100,2) as reorder_rate -- converting to a % from a decimal
	from instacart.products p join instacart.order_products_prior opp 
		on p.product_id = opp.product_id
		join instacart.departments d 
			on p.department_id = d.department_id
	where p.department_id <> 21 -- excludes 'missing' department (21)
		and p.aisle_id <> 100 -- excludes 'missing' aisle (100)
	group by p.product_id, p.product_name, d.department_id
	having count(*) >= 1000
	order by reorder_rate desc
	limit 20
)
select round(avg(reorder_rate),2) as avg_reorder_rate
from top_20;