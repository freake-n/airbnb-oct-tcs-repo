{{ config(materialized='view') }}

WITH reviews AS (
    SELECT
        listing_id,
        {{ sentiment_score('review_sentiment') }} AS sentiment_score
    FROM {{ ref('mart_fct_reviews') }}
)
SELECT
    listing_id,
    COUNT(*)                        AS total_reviews,
    ROUND(AVG(sentiment_score), 2)  AS avg_sentiment,
    SUM(sentiment_score)            AS net_sentiment
FROM reviews
GROUP BY listing_id
ORDER BY avg_sentiment DESC