--purchase gender wise 
select gender, sum(purchase_amount) from customer
group by gender;

-- used discount but amt more than average purchase_amount

select customer_id,purchase_amount from customer
where discount_applied='Yes' and purchase_amount > (select avg(purchase_amount)from customer);

-- top 5 products with highest average review_rating

select item_purchased, avg(review_rating) from customer
group by item_purchased
order by avg(review_rating) desc limit 5;

-- compare between shipping_type

select shipping_type, round(avg(purchase_amount),2)
from customer
where shipping_type in ('Express','Standard')
group by shipping_type;

-- compare subscribers , non subscribers
select subscription_status,count(subscription_status), round(avg(purchase_amount),2), sum(purchase_amount)
from customer
group by subscription_status;


-- 5 products with highest % of pruchase with discount_applied

SELECT
    item_purchased,
    (ROUND(100* 
         SUM(CASE
            WHEN discount_applied = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ))AS discount_rate
FROM customer
GROUP BY item_purchased
LIMIT 5;


-- customer type

SELECT
    CASE
        WHEN previous_purchases <= 1 THEN 'new'
        WHEN previous_purchases BETWEEN 2 AND 10 THEN 'returning'
        ELSE 'loyal'
    END AS customer_category,
    COUNT(customer_id) AS customer_count
FROM customer
GROUP BY customer_category;


-- top 3 purchased within each category
--Q8. What are the top 3 most purchased products within each category? 
WITH item_counts AS (
    SELECT category,
           item_purchased,
           COUNT(customer_id) AS total_orders,
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY COUNT(customer_id) DESC) AS item_rank
    FROM customer
    GROUP BY category, item_purchased
)
SELECT item_rank,category, item_purchased, total_orders
FROM item_counts
WHERE item_rank <=3;
 
--Q9. Are customers who are repeat buyers (more than 5 previous purchases) also likely to subscribe?
SELECT subscription_status,
       COUNT(customer_id) AS repeat_buyers
FROM customer
WHERE previous_purchases > 5
GROUP BY subscription_status;

--Q10. What is the revenue contribution of each age group? 
SELECT 
    age_group,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY age_group
ORDER BY total_revenue desc;


SELECT COUNT(*) AS total_rows
FROM public.customer;