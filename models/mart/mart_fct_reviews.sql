{{ config(
    materialized='incremental',
    on_schema_change='fail'
) }}

WITH resultset  AS (

    SELECT *
    FROM {{ ref('stg_reviews') }}

)

SELECT
{{ dbt_utils.generate_surrogate_key(['listing_id','review_date','reviewer_name','review_text'])}}
    AS review_id,
    listing_id,
    review_date,
    reviewer_name,
    review_text,
    review_sentiment

FROM resultset

WHERE review_text IS NOT NULL

{% if is_incremental() %}

    AND review_date > (
        SELECT MAX(review_date)
        FROM {{ this }}
    )

{% endif %}