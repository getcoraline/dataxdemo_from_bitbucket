
    
    

select
    sku as unique_field,
    count(*) as n_records

from `catalog_main`.`default`.`stg_jaffle_data__products`
where sku is not null
group by sku
having count(*) > 1


