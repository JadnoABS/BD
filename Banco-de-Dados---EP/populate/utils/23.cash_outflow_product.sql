
SET @row_number = (select max(payment_id) from cash_outflow)
set @product_id = 0;
insert into cash_outflow (payment_form, tax, emission_date, payment_id, quantitity,value, cash_outflow_TYPE, responsible_cpf)
with random_product as (
select sell_value, 
@product_id:=product_id as product_id  from product p 
order by rand()
limit 1)
select ELT(0.5 + RAND() * 4, 'pix', 'ted', 'cartão', 'dinheiro') as payment_form, 
round(RAND() * (40 - 5 + 1) + 5, 2) as tax,
FROM_UNIXTIME(ROUND((RAND() * (1671548583 - 1669906983) + 1669906983))) as emission_date,
@row_number:=@row_number + 1 as payment_id,
round(rand() * (10 - 1) + 1) as quantitity,
(select sell_value from random_product) * (select quantitity) + (select @product_id:= product_id from random_product) * 0 as value,
'produto' as cash_outflow_TYPE,
(
select cpf from employee e 
inner join department d on d.department_id = e.department_id 
where d.department_name = 'Financeiro'
order by rand()
limit 1
) as responsible_cpf;

select @product_id;

insert into cash_outflow_product (product_id, payment_id)
select @product_id,
max(payment_id) from cash_outflow 
