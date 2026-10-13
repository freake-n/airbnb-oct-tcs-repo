WITH resultset AS (

    SELECT *
    FROM {{ ref('stg_listings') }}

)

SELECT
    listing_id,
    listing_name,
    listing_url,
    room_type,

    CASE
        WHEN minimum_nights = 0 THEN 1
        ELSE minimum_nights
    END AS minimum_nights,

    host_id,
    price,
    created_at,
    updated_at

FROM resultset