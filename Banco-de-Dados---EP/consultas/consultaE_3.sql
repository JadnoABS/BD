# Descobrir as vagas que estao alocadas para a reserva 3

SELECT * FROM parking_space
WHERE parking_id IN (
  SELECT parking_id FROM reservation_parking_space
  WHERE reservation_id = 3
);
