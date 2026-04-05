{{
    config(
        materialized = 'ephemeral'
    )
    }}
WITH src_airports as (

SELECT
ident as	airport_ident,
type  as	airport_type,
name  as	airport_name,
latitude_deg as 	airport_lat,
longitude_deg as	airport_long,
continent 	, 
iso_country , 
iso_region 	,

FROM {{ source ('airstats','AIRPORTS')}}
)
select 
*
from src_airports