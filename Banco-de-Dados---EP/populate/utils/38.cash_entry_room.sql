select datediff(final_date, initial_date) div 30 as months,
(datediff(final_date, initial_date) % 30) div 7 as weeks,
(select months) * r.mensal_rent + (select weeks) * r.weekly_rent as total,
r.room_id,
r.initial_date 
from room r 