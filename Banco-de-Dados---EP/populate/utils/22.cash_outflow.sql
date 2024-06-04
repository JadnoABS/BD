SET @row_number = 0;

insert into cash_outflow (payment_form, tax, emission_date, payment_id, value, quantitity, cash_outflow_TYPE, responsible_cpf)
select ELT(0.5 + RAND() * 4, 'pix', 'ted', 'cartão', 'dinheiro') as payment_form, 
round(RAND() * (40 - 5 + 1) + 5, 2) as tax,
FROM_UNIXTIME(ROUND((RAND() * (1671548583 - 1669906983) + 1669906983))) as emission_date,
@row_number:=@row_number + 1 as payment_id,
round(rand() * (1000 - 50) + 50, 2) as value,
round(rand() * (10 - 1) + 1) as quantitity,
'produto' as cash_outflow_TYPE,
(
select cpf from employee e 
inner join department d on d.department_id = e.department_id 
where d.department_name = 'Financeiro'
order by rand()
limit 1
) as responsible_cpf

