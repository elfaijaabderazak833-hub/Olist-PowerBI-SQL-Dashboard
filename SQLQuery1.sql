
select top 10 s.seller_city,
round(sum(payment_value), 2) city_revenues,
round(avg(payment_value), 2) avg_revenues
from olist_order_items_dataset o
join olist_sellers_dataset s
    on o.seller_id=s.seller_id
join olist_orders_dataset ot
    on o.order_id=ot.order_id
join olist_order_payments_dataset olt
    on o.order_id= olt.order_id
where order_status= 'delivered'
group by s.seller_city
order by city_revenues desc;

select top 10 c.customer_city,
round(sum(payment_value),2) total_revenues,
round(avg(payment_value), 2) avg_revenues
from olist_order_payments_dataset p
join olist_orders_dataset o
    on p.order_id=p.order_id
join olist_customers_dataset c
    on o.customer_id=c.customer_id 
where order_status= 'delivered'
group by c.customer_city
order by total_revenues desc;