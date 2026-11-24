# SQL Data Pulls

This folder contains the PostgreSQL queries used to extract, validate, and summarize product reorder metrics for the **Instacart "Buy It Again" Pilot** (BAN 5003 — MAAP Consulting).

All queries except 01_sample_query exclude uncategorized items (`department_id <> 21` and `aisle_id <> 100`) and compute historical reorder rates from `instacart.order_products_prior`.

File Name 
    Description

01_sample_query
    This query finds all orders and items from customer 1.
    [This query was generated to include in our project proposal to ensure the functionality and accessibility]

02_eligible_products_list_500_min
    Returns the full population of eligible products with a minimum of 500 purchases and each products reorder rate.
    
03_eligible_products_list_1000_min
    Returns the full population of eligible products with a minimum of 1000 purchases and each products reorder rate.

04_eligible_products_summary_500_min
    Calculates the total count of eligible products with a minimum of 500 orders and the overall baseline unweighted average reorder rate.

05_eligible_products_summary_1000_min
    Calculates the total count of eligible products with a minimum of 1000 orders and the overall baseline unweighted average reorder rate.

06_top_20_products_500_min
    Ranks the top 20 eligible products by historical reorder rate using a minimum threshold of 500 prior-order purchases.

07_top_20_products_1000_min
    Ranks the top 20 eligible products by historical reorder rate using a minimum threshold of 1000 prior-order purchases.

08_top_20_avg_reorder_500_min
    Calculates the unweighted mean reorder rate across the top 20 products under a minimum threshold of 500 prior-order purchases.

09_top_20_avg_reorder_1000_min
    Calculates the unweighted mean reorder rate across the top 20 products under a minimum threshold of 1000 prior-order purchases.
