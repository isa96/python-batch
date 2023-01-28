SELECT 	o.order_id,
		o.order_date,
		oi.order_item_quantity AS quantity,
		u.user_first_name AS first_name,
		u.user_last_name AS last_name, 
		p.payment_name AS payment,
		s.shipper_name AS shipping,
		o.order_price AS list_price,
		o.order_discount AS discount,
		v.voucher_price AS voucher,
		o.order_total AS net_price,
		r.rating_level AS rating
FROM tb_orders o
	LEFT JOIN tb_users u ON o.user_id = u.user_id
	LEFT JOIN tb_payments p ON o.payment_id = p.payment_id
	LEFT JOIN tb_shippers s ON o.shipper_id = s.shipper_id 
	LEFT JOIN tb_vouchers v ON o.voucher_id = v.voucher_id
	LEFT JOIN tb_ratings r ON o.rating_id = r.rating_id
	LEFT JOIN tb_order_items oi ON o.order_id = oi.order_id;