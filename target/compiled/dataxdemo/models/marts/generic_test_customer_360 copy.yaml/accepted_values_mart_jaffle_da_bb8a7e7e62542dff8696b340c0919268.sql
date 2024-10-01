
    
    

with all_values as (

    select
        is_loyal_customer as value_field,
        count(*) as n_records

    from `catalog_main`.`default`.`mart_jaffle_data__customer_360`
    group by is_loyal_customer

)

select *
from all_values
where value_field not in (
    'true','false'
)


