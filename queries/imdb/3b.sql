SELECT MIN(t.title) AS movie_title
FROM     
	postgresql('localhost:5432', 'imdb', 'keyword', 'imdb', 'imdb', 'public') AS k,
     postgresql('localhost:5432', 'imdb', 'movie_info', 'imdb', 'imdb', 'public') AS mi,
    postgresql('localhost:5432', 'imdb', 'movie_keyword', 'imdb', 'imdb', 'public') AS mk,
    postgresql('localhost:5432', 'imdb', 'title', 'imdb', 'imdb', 'public') AS t
WHERE k.keyword LIKE '%sequel%'
  AND mi.info IN ('Bulgaria')
  AND t.production_year > 2010
  AND t.id = mi.movie_id
  AND t.id = mk.movie_id
  AND mk.movie_id = mi.movie_id
  AND k.id = mk.keyword_id
