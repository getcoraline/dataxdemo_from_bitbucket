
    
    

select
    id as unique_field,
    count(*) as n_records

from `catalog_develop`.`default`.`stg_jaffle_data__customers`
where id is not null
group by id
having count(*) > 1


