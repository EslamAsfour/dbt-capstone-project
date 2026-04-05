SELECT AIRPORT_IDENT 
FROM   {{ref('silver_airports') }}
where substr(iso_region,0,2) !=  iso_country 