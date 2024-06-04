insert into reservation_parking_space (initial_date, total_days, reservation_id, parking_id)
select 
checkin as initial_date,
datediff(checkout, checkin) as total_days,
r.reservation_id,
r.reservation_id
from reservation r 