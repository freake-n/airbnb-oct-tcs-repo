SELECT
    *
FROM
    {{ ref('mart_listings_w_hosts') }}
WHERE minimum_nights < 1
LIMIT 10