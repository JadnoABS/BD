# Selecionar todos os hoteis com 5 ou mais reservas ativas

SELECT COUNT(atv.reservation_id), hotel_id
FROM
(SELECT reservation_id FROM reservation
WHERE DATE(checkin) <= DATE(NOW()) AND checkout IS NULL) AS atv
JOIN reservation_period_bedroom AS rb ON atv.reservation_id=rb.reservation_id
JOIN bedroom as b ON rb.bedroom_id=b.bedroom_id
GROUP BY hotel_id
HAVING COUNT(atv.reservation_id) >= 5;
