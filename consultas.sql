
# Descobrir o valor total gasto pela reserva 9
SELECT reservation_id, SUM(value)
FROM (
  SELECT reservation_id, value
  FROM reservation WHERE reservation_id=9
  UNION
  SELECT reservation_id, sell_price AS value
  FROM reservation_product JOIN product
  WHERE reservation_id=9
  UNION
  SELECT reservation_id, price_day AS value
  FROM reservation_parking JOIN parking_space
  WHERE reservation_id=9
  UNION
  SELECT reservation_id, value
  FROM restaurant_room
  WHERE reservation_id=9
)
GROUP BY ID;


# Descobrir os hoteis que possuem itens que precisam ser estocados e esses itens
SELECT * FROM hotel_product
WHERE stock < 1
JOIN
SELECT hotel_id, fantasy_name, cep FROM hotel
JOIN
SELECT product_id, name, description, sell_price FROM product;


# Descobrir todos os pratos que tem "carne" no nome
SELECT * FROM dishes
WHERE name LIKE '%carne%';


# Descobrir as vagas que estao alocadas para a reserva 3
SELECT * FROM parking_space
WHERE parkin_id IN (
  SELECT parking_id FROM reservation_parking
  WHERE reservation_id = 3
);

# Selecionar todos os hoteis com mais de 20 reservas ativas
SELECT COUNT(reservation_id), hotel_id
FROM
(SELECT reservation_id FROM reservation
WHERE DATE(checkin) < DATE(NOW()) AND checkout IS NULL) AS atv
JOIN room_reservation
JOIN room
GROUP BY hotel_id
HAVING COUNT(reservation_id) > 20;
