SELECT MIN(t.title) AS american_movie
FROM postgresql('localhost:5432', 'imdb', 'company_type', 'imdb', 'imdb', 'public') AS ct,
     postgresql('localhost:5432', 'imdb', 'info_type', 'imdb', 'imdb', 'public') AS it,
     postgresql('localhost:5432', 'imdb', 'movie_companies', 'imdb', 'imdb', 'public') AS mc,
     postgresql('localhost:5432', 'imdb', 'movie_info', 'imdb', 'imdb', 'public') AS mi,
     postgresql('localhost:5432', 'imdb', 'title', 'imdb', 'imdb', 'public') AS t
WHERE ct.kind = 'production companies'
  AND mc.note NOT LIKE '%(TV)%'
  AND mc.note LIKE '%(USA)%'
  AND mi.info IN ('Sweden',
                  'Norway',
                  'Germany',
                  'Denmark',
                  'Swedish',
                  'Denish',
                  'Norwegian',
                  'German',
                  'USA',
                  'American')
  AND t.production_year > 1990
  AND t.id = mi.movie_id
  AND t.id = mc.movie_id
  AND mc.movie_id = mi.movie_id
  AND ct.id = mc.company_type_id
  AND it.id = mi.info_type_id

