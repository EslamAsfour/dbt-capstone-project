{{
    config(
        materialized = 'ephemeral'
    )
    }}

WITH src_airport_comments AS 
(
SELECT
id as	comment_id,
airport_ident ,
to_timestamp(date)    as	comment_timestamp,
member_nickname ,
subject as 	comment_subject,
body as 	comment_body,
FROM    {{ source('airstats', 'COMMENTS') }}

)

SELECT
*
FROM src_airport_comments