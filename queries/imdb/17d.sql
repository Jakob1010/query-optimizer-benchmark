SELECT MIN(n.name) AS member_in_charnamed_movie
FROM 
postgresql('localhost:5432', 'imdb', 'cast_info', 'imdb', 'imdb', 'public') AS ci,
postgresql('localhost:5432', 'imdb', 'company_name', 'imdb', 'imdb', 'public') AS cn,
postgresql('localhost:5432', 'imdb', 'keyword', 'imdb', 'imdb', 'public') AS k,
postgresql('localhost:5432', 'imdb', 'movie_companies', 'imdb', 'imdb', 'public') AS mc,
postgresql('localhost:5432', 'imdb', 'movie_keyword', 'imdb', 'imdb', 'public') AS mk,
postgresql('localhost:5432', 'imdb', 'name', 'imdb', 'imdb', 'public') AS n,
postgresql('localhost:5432', 'imdb', 'title', 'imdb', 'imdb', 'public') AS t
WHERE k.keyword ='character-name-in-title'
  AND n.name LIKE '%Bert%'
  AND n.id = ci.person_id
  AND ci.movie_id = t.id
  AND t.id = mk.movie_id
  AND mk.keyword_id = k.id
  AND t.id = mc.movie_id
  AND mc.company_id = cn.id
  AND ci.movie_id = mc.movie_id
  AND ci.movie_id = mk.movie_id
  AND mc.movie_id = mk.movie_id

