
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from `catalog_main`.`default`.`mart_jaffle_data__customer_360`
where customer_id is not null
group by customer_id
having count(*) > 1


