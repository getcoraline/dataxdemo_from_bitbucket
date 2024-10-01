select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      with relation_columns as (

        
        select
            cast('ID' as string) as relation_column,
            cast('STRING' as string) as relation_column_type
        union all
        
        select
            cast('CUSTOMER_ID' as string) as relation_column,
            cast('STRING' as string) as relation_column_type
        union all
        
        select
            cast('ORDERED_AT' as string) as relation_column,
            cast('TIMESTAMP' as string) as relation_column_type
        union all
        
        select
            cast('STORE_ID' as string) as relation_column,
            cast('STRING' as string) as relation_column_type
        union all
        
        select
            cast('SUBTOTAL' as string) as relation_column,
            cast('BIGINT' as string) as relation_column_type
        union all
        
        select
            cast('TAX_PAID' as string) as relation_column,
            cast('BIGINT' as string) as relation_column_type
        union all
        
        select
            cast('ORDER_TOTAL' as string) as relation_column,
            cast('BIGINT' as string) as relation_column_type
        
        
    ),
    test_data as (

        select
            *
        from
            relation_columns
        where
            relation_column = 'ID'
            and
            relation_column_type not in ('STRING')

    )
    select *
    from test_data
      
    ) dbt_internal_test