WITH resultset AS (
    SELECT *
    FROM {{ ref('stg_hosts') }}
)
SELECT
    host_id,
    COALESCE(
        host_name,
        'Anonymous'
    ) AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM resultset