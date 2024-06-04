# Calcular total do aluguel das salas

SELECT DATEDIFF(final_date, initial_date) DIV 30 as months,
(datediff(final_date, initial_date) % 30) DIV 7 as weeks,
(SELECT months) * r.mensal_rent + (SELECT weeks) * r.weekly_rent as total
FROM room r 
