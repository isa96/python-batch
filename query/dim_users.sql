SELECT 	u.user_id,
		u.user_first_name AS first_name,
		u.user_last_name AS last_name,
		u.user_gender AS gender,
		u.user_address AS address,
		u.user_birthday AS birth_date,
		u.user_join AS join_date,
		count(o.order_id) AS total_order,
		sum(o.order_total) AS total_spend,
		avg(r.rating_level) AS mean_rating
FROM tb_users AS u
LEFT JOIN tb_orders AS o ON u.user_id = o.user_id 
LEFT JOIN tb_ratings AS r ON o.rating_id = r.rating_id
GROUP BY u.user_id;