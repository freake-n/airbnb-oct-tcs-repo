WITH raw_listings AS (
    SELECT
        *
    FROM
        {{ source('airbnb', 'listings') }}
)
SELECT
    id AS airbnb_property_id,
    name AS airbnb_property_name,
    listing_url,
    room_type,
    minimum_nights,
FROM
    raw_listings