with relation_columns as (

        
        select
            1 as relation_column_idx,
            cast('SKU' as string) as relation_column
        union all
        
        select
            2 as relation_column_idx,
            cast('NAME' as string) as relation_column
        union all
        
        select
            3 as relation_column_idx,
            cast('TYPE' as string) as relation_column
        union all
        
        select
            4 as relation_column_idx,
            cast('PRICE' as string) as relation_column
        union all
        
        select
            5 as relation_column_idx,
            cast('DESCRIPTION' as string) as relation_column
        
        
    ),
    input_columns as (

        
        select
            1 as input_column_idx,
            cast('SKU' as string) as input_column
        union all
        
        select
            2 as input_column_idx,
            cast('NAME' as string) as input_column
        union all
        
        select
            3 as input_column_idx,
            cast('TYPE' as string) as input_column
        union all
        
        select
            4 as input_column_idx,
            cast('PRICE' as string) as input_column
        union all
        
        select
            5 as input_column_idx,
            cast('DESCRIPTION' as string) as input_column
        
        
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