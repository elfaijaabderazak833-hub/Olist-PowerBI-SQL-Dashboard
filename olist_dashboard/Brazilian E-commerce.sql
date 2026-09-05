select count(order_id) total_orders
from olist_orders_dataset

select count(*) total_customers
from olist_customers_dataset

select count(*) total_products
from olist_products_dataset

select count(*) total_sellers
from olist_sellers_dataset

select  order_status ,count(*) as total_status
from olist_orders_dataset
group by order_status
order by total_status;

select round(sum(payment_value),2) as total_revenue
from olist_order_payments_dataset
order by total_revenue;

select payment_type,
round(sum(payment_value),2) as total_revenue,
round(avg(payment_value),2) as avg_revenue
from olist_order_payments_dataset
group by payment_type
order by total_revenue desc;


select top 10 
c.customer_city, 
round(sum(p.payment_value),2) total_revenue
from olist_orders_dataset o
join olist_customers_dataset c
     on o.customer_id=c.customer_id
join olist_order_payments_dataset p
    on o.order_id=p.order_id
group by c.customer_city
order by total_revenue desc;

select top 10
product_id,
COUNT(*) as total_sold
from olist_order_items_dataset
group by product_id
order by total_sold desc;

select top 10
product_id, 
round(sum(price),2) as total_revenue
from olist_order_items_dataset
group by product_id
order by total_revenue desc;

select p.product_category_name,
count(*) as total_sold,
round(sum(oi.price),2) as total_revenue
from olist_order_items_dataset oi
join olist_products_dataset p
    on oi.product_id=p.product_id
group by product_category_name
order by total_revenue desc;




