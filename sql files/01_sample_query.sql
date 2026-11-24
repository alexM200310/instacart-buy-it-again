/* File: 01_sample_query
 * 
 * [This query was generated to include in our project proposal to ensure the functionality and accessibility]
 * Description: This query finds all orders and items from customer 1.
 * 
 * Author: Morgan Kelehar (Data Lead)*/

select 
    o.order_id, opp.add_to_cart_order, opp.reordered, p.product_name,
    a.aisle, d.department, o.days_since_prior_order
from instacart.orders o join instacart.order_products_prior opp on o.order_id = opp.order_id
	join instacart.products p on opp.product_id = p.product_id
	join instacart.aisles a on p.aisle_id = a.aisle_id
	join instacart.departments d on p.department_id = d.department_id
where o.user_id = 1
order by o.days_since_prior_order desc;