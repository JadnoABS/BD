
# Descobrir o valor total gasto pelo cliente da reserva 3
SELECT reservation_id, SUM(value)
FROM (
  SELECT reservation_id, value
  FROM reservation WHERE reservation_id=3
  UNION
  SELECT reservation_id, sell_value AS value
  FROM reservation_product AS r JOIN product as p ON r.product_id=p.product_id
  WHERE reservation_id=3
  UNION
  SELECT reservation_id, daily_rate AS value
  FROM reservation_parking_space AS r JOIN parking_space AS p ON r.parking_id=p.parking_id
  WHERE reservation_id=3
  UNION
  SELECT NULL as reservation_id, value FROM petshop_client_payment
  WHERE cpf IN (
    SELECT client_cpf as cpf FROM reservation WHERE reservation_id=3
  )
) AS expenses
GROUP BY reservation_id;


# Descobrir todos os produtos que tem "barra" no nome e os restaurantes que o vendem
SELECT p.name, p.description, p.sell_value, r.name, r.type, r.location FROM restaurant_product AS rp
JOIN restaurant AS r ON rp.restaurant_id=r.restaurant_id
RIGHT JOIN product AS p ON rp.product_id=p.product_id
WHERE p.name LIKE '%barra%';

# Descobrir as vagas que estao alocadas para a reserva 3
SELECT * FROM parking_space
WHERE parking_id IN (
  SELECT parking_id FROM reservation_parking_space
  WHERE reservation_id = 3
);

# Selecionar todos os hoteis com 5 ou mais reservas ativas
SELECT COUNT(atv.reservation_id), hotel_id
FROM
(SELECT reservation_id FROM reservation
WHERE DATE(checkin) <= DATE(NOW()) AND checkout IS NULL) AS atv
JOIN reservation_period_bedroom AS rb ON atv.reservation_id=rb.reservation_id
JOIN bedroom as b ON rb.bedroom_id=b.bedroom_id
GROUP BY hotel_id
HAVING COUNT(atv.reservation_id) >= 5;

# Calcular total do aluguel das salas
SELECT DATEDIFF(final_date, initial_date) DIV 30 as months,
(datediff(final_date, initial_date) % 30) DIV 7 as weeks,
(SELECT months) * r.mensal_rent + (SELECT weeks) * r.weekly_rent as total
FROM room r 
