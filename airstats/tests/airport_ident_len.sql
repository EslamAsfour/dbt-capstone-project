SELECT  airport_ident 
FROM   {{ ref('silver_airport_comments')}} 
where length(airport_ident) < 2