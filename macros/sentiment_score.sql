{% macro sentiment_score(column_name) %}
    CASE WHEN {{ column_name }} = 'positive' THEN  1
         WHEN {{ column_name }} = 'negative' THEN -1
         ELSE 0 END
{% endmacro %}