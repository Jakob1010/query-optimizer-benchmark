SELECT MIN(t.title) AS typical_european_movie
FROM postgresql('localhost:5432', 'imdb', 'company_type', 'imdb', 'imdb', 'public') AS ct,
     postgresql('localhost:5432', 'imdb', 'info_type', 'imdb', 'imdb', 'public') AS it,
     postgresql('localhost:5432', 'imdb', 'movie_companies', 'imdb', 'imdb', 'public') AS mc,
     postgresql('localhost:5432', 'imdb', 'movie_info', 'imdb', 'imdb', 'public') AS mi,
     postgresql('localhost:5432', 'imdb', 'title', 'imdb', 'imdb', 'public') AS t
WHERE ct.kind = 'production companies'
  AND mc.note LIKE '%(theatrical)%'
  AND mc.note LIKE '%(France)%'
  AND mi.info IN ('Sweden',
                  'Norway',
                  'Germany',
                  'Denmark',
                  'Swedish',
                  'Denish',
                  'Norwegian',
                  'German')
  AND t.production_year > 2005
  AND t.id = mi.movie_id
  AND t.id = mc.movie_id
  AND mc.movie_id = mi.movie_id
  AND ct.id = mc.company_type_id
  AND it.id = mi.info_type_id
