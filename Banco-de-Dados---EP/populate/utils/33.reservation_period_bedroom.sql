/*
 não utilizar
*/
insert into reservation_period_bedroom (days, initial_date, bedroom_id, reservation_id)
select rps.total_days as days,
rps.initial_date,
b.bedroom_id,
rps.reservation_id
from reservation_parking_space rps 
inner join parking_space ps on ps.parking_id = rps.parking_id 
inner join hotel h on h.hotel_id = ps.hotel_id 
inner join bedroom b on b.hotel_id = h.hotel_id 