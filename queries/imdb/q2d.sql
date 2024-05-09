SELECT MIN(t.title) AS movie_title
FROM 
    postgresql('localhost:5432', 'imdb', 'company_name', 'imdb', 'imdb', 'public') AS cn,
    postgresql('localhost:5432', 'imdb', 'keyword', 'imdb', 'imdb', 'public') AS k,
    postgresql('localhost:5432', 'imdb', 'movie_companies', 'imdb', 'imdb', 'public') AS mc,
    postgresql('localhost:5432', 'imdb', 'movie_keyword', 'imdb', 'imdb', 'public') AS mk,
    postgresql('localhost:5432', 'imdb', 'title', 'imdb', 'imdb', 'public') AS t
WHERE cn.country_code ='[us]'
  AND k.keyword ='character-name-in-title'
  AND cn.id = mc.company_id
  AND mc.movie_id = t.id
  AND t.id = mk.movie_id
  AND mk.keyword_id = k.id
  AND mc.movie_id = mk.movie_id
