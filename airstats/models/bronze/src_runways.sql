{{
    config(
        materialized = 'ephemeral'
    )
    }}
with src_runways as (

SELECT

id 	runway_id,
airport_ident ,
length_ft as	runway_length_ft,
width_ft  as	runway_width_ft,
surface  as	runway_surface,
lighted  as	runway_lighted,
closed 	as runway_closed
FROM {{ source('airstats', 'RUNAWAYS')}}
)

select 
*
 from src_runways