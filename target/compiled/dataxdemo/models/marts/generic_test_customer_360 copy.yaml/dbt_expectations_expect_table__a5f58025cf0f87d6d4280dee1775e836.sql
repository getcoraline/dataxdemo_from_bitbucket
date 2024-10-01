with relation_columns as (

        
        select
            1 as relation_column_idx,
            cast('CUSTOMER_ID' as string) as relation_column
        union all
        
        select
            2 as relation_column_idx,
            cast('CUSTOMER_NAME' as string) as relation_column
        union all
        
        select
            3 as relation_column_idx,
            cast('TOTAL_ORDERS' as string) as relation_column
        union all
        
        select
            4 as relation_column_idx,
            cast('TOTAL_SPENT' as string) as relation_column
        union all
        
        select
            5 as relation_column_idx,
            cast('AVG_ORDER_VALUE' as string) as relation_column
        union all
        
        select
            6 as relation_column_idx,
            cast('FIRST_ORDER_DATE' as string) as relation_column
        union all
        
        select
            7 as relation_column_idx,
            cast('LAST_ORDER_DATE' as string) as relation_column
        union all
        
        select
            8 as relation_column_idx,
            cast('CUSTOMER_LIFETIME_DAYS' as string) as relation_column
        union all
        
        select
            9 as relation_column_idx,
            cast('CUSTOMER_SEGMENT' as string) as relation_column
        union all
        
        select
            10 as relation_column_idx,
            cast('PRODUCT_TYPES_PURCHASED' as string) as relation_column
        union all
        
        select
            11 as relation_column_idx,
            cast('UNIQUE_PRODUCT_TYPES_COUNT' as string) as relation_column
        union all
        
        select
            12 as relation_column_idx,
            cast('VISITED_STORE_IDS' as string) as relation_column
        union all
        
        select
            13 as relation_column_idx,
            cast('UNIQUE_STORES_VISITED' as string) as relation_column
        union all
        
        select
            14 as relation_column_idx,
            cast('IS_LOYAL_CUSTOMER' as string) as relation_column
        
        
    ),
    input_columns as (

        
        select
            1 as input_column_idx,
            cast('CUSTOMER_ID' as string) as input_column
        union all
        
        select
            2 as input_column_idx,
            cast('CUSTOMER_NAME' as string) as input_column
        union all
        
        select
            3 as input_column_idx,
            cast('TOTAL_ORDERS' as string) as input_column
        union all
        
        select
            4 as input_column_idx,
            cast('TOTAL_SPENT' as string) as input_column
        union all
        
        select
            5 as input_column_idx,
            cast('AVG_ORDER_VALUE' as string) as input_column
        union all
        
        select
            6 as input_column_idx,
            cast('FIRST_ORDER_DATE' as string) as input_column
        union all
        
        select
            7 as input_column_idx,
            cast('LAST_ORDER_DATE' as string) as input_column
        union all
        
        select
            8 as input_column_idx,
            cast('CUSTOMER_LIFETIME_DAYS' as string) as input_column
        union all
        
        select
            9 as input_column_idx,
            cast('CUSTOMER_SEGMENT' as string) as input_column
        union all
        
        select
            10 as input_column_idx,
            cast('PRODUCT_TYPES_PURCHASED' as string) as input_column
        union all
        
        select
            11 as input_column_idx,
            cast('UNIQUE_PRODUCT_TYPES_COUNT' as string) as input_column
        union all
        
        select
            12 as input_column_idx,
            cast('VISITED_STORE_IDS' as string) as input_column
        union all
        
        select
            13 as input_column_idx,
            cast('UNIQUE_STORES_VISITED' as string) as input_column
        union all
        
        select
            14 as input_column_idx,
            cast('IS_LOYAL_CUSTOMER' as string) as input_column
        
        
    )
    select *
    from
        relation_columns r
        full outer join
        input_columns i on r.relation_column = i.input_column and r.relation_column_idx = i.input_column_idx
    where
        -- catch any column in input list that is not in the sequence of table columns
        -- or any table column that is not in the input sequence
        r.relation_column is null or
        i.input_column is null