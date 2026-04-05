{{
  config(
    materialized = 'incremental',
    on_schema_change='fail'
    )
}}

WITH src_airport_comments AS 
(
SELECT * FROM  {{ ref('src_airport_comments')}}
)
SELECT 
    comment_id,
    airport_ident,
    comment_timestamp,
    IFNULL(member_nickname,'__UNKNOWN__') AS  member_nickname,
    comment_subject,
    comment_body,
    current_timestamp() AS loaded_at
FROM src_airport_comments
WHERE comment_body is not null
{% if is_incremental() %}
  AND comment_id > (select max(comment_id) from {{ this }})
{% endif %}
