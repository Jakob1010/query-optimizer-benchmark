SELECT COUNT(t.id)
FROM title t
WHERE EXISTS (
    SELECT 1
    FROM movie_companies mc
    LEFT JOIN company_name cn ON mc.company_id = cn.id
    WHERE EXISTS (
        SELECT 1
        FROM movie_keyword mk
        LEFT JOIN keyword k ON k.id = mk.keyword_id
        WHERE k.keyword = 'character-name-in-title'
        AND mk.movie_id = mc.movie_id
    )
    AND mc.movie_id = t.id
    AND cn.country_code = '[de]'
)