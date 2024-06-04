# Descobrir todos os produtos que tem "barra" no nome e os restaurantes que o vendem

SELECT p.name, p.description, p.sell_value, r.name, r.type, r.location FROM restaurant_product AS rp
JOIN restaurant AS r ON rp.restaurant_id=r.restaurant_id
RIGHT JOIN product AS p ON rp.product_id=p.product_id
WHERE p.name LIKE '%barra%';
