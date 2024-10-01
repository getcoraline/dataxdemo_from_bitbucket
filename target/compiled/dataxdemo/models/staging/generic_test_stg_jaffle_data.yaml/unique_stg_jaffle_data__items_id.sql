
    
    

select
    id as unique_field,
    count(*) as n_records

from `catalog_main`.`default`.`stg_jaffle_data__items`
where id is not null
group by id
having count(*) > 1


