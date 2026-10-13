SELECT * FROM {{ ref('int_listings_cleansed') }} l
INNER JOIN {{ ref('mart_fct_reviews') }} r
USING (listing_id)
WHERE l.created_at >= r.review_date