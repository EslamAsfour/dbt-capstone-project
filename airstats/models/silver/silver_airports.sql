WITH src_airports as 
(
select * from {{ ref('src_airports')}}

)

SELECT * FROM src_airports