-- QUE 1
-- Retrieve the total number of orders placed.

select count(order_id) as total_orders from orders;

-- QUE 2
-- Calculate the total revenue generated from pizza sales.

select round(sum(d.quantity*p.price),2) as total_sales
from order_details d
join pizzas p
on p.pizza_id = d.pizza_id;

-- QUE 3
-- Identify the highest-priced pizza.

select pt.name, pz.price 
from pizza_types pt
join pizzas pz
on pz.pizza_type_id = pt.pizza_type_id
order by pz.price desc
limit 1;

-- QUE 4
-- Identify the most common pizza size ordered.

select pizzas.size, count(order_details.order_details_id) as order_count
from pizzas join order_details
on pizzas.pizza_id = order_details.pizza_id
group by pizzas.size order by order_count desc;

-- QUE 5
-- List the top 5 most ordered pizza types along with their quantities.

select pizza_types.name,
sum(order_details.quantity) as quantity
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name
order by quantity desc
limit 5;