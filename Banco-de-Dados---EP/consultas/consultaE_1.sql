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
