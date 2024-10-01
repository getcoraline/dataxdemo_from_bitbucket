
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from `catalog_develop`.`default`.`int_jaffle_data__customer_order_history`
where customer_id is not null
group by customer_id
having count(*) > 1


