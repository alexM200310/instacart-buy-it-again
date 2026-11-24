/*File: 07_top_20_products_1000_min
 * 
 * Description: Ranks the top 20 eligible products by historical 
 * 		reorder rate using a minimum threshold of 1000 prior-order purchases.
 * 
 * Author: Morgan Kelehar (Data Lead)*/

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
limit 20;