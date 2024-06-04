SET @row_number = (select max(payment_id) from cash_outflow);

insert into cash_outflow (payment_form, tax, emission_date, cash_outflow_TYPE, payment_id,quantitity, value, responsible_cpf)
select 'ted' as payment_form,
30 as tax,
FROM_UNIXTIME(ROUND((RAND() * (1671128387 - 1608056387) + 1608056387))) as emission_date,
'salário' as cash_outflow_TYPE,
@row_number:=@row_number + 1 as payment_id,
1 as quantitity,
salary as value,
(
select cpf from employee e 
inner join department d on d.department_id = e.department_id 
where d.department_name = 'Recursos Humanos'
order by rand()
limit 1
) as responsible_cpf
from employee e 
order by e.cpf;

set @count = (select count(*) from employee e2);

insert into received_payment (employee_cpf, payment_id)
select cpf, @row_number - (@count := @count -1) from employee e 
order by cpf;
