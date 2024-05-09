SELECT MIN(t.title) AS complete_downey_ironman_movie
FROM 
postgresql('localhost:5432', 'imdb', 'complete_cast', 'imdb', 'imdb', 'public') AS cc,
postgresql('localhost:5432', 'imdb', 'comp_cast_type', 'imdb', 'imdb', 'public') AS cct1,
postgresql('localhost:5432', 'imdb', 'comp_cast_type', 'imdb', 'imdb', 'public') AS cct2,
postgresql('localhost:5432', 'imdb', 'char_name', 'imdb', 'imdb', 'public') AS chn,
postgresql('localhost:5432', 'imdb', 'cast_info', 'imdb', 'imdb', 'public') AS ci,
postgresql('localhost:5432', 'imdb', 'keyword', 'imdb', 'imdb', 'public') AS k,
postgresql('localhost:5432', 'imdb', 'kind_type', 'imdb', 'imdb', 'public') AS kt,
postgresql('localhost:5432', 'imdb', 'movie_keyword', 'imdb', 'imdb', 'public') AS mk,
postgresql('localhost:5432', 'imdb', 'name', 'imdb', 'imdb', 'public') AS n,
postgresql('localhost:5432', 'imdb', 'title', 'imdb', 'imdb', 'public') AS t
WHERE cct1.kind = 'cast'
  AND cct2.kind LIKE '%complete%'
  AND chn.name NOT LIKE '%Sherlock%'
  AND (chn.name LIKE '%Tony%Stark%'
       OR chn.name LIKE '%Iron%Man%')
  AND k.keyword IN ('superhero',
                    'sequel',
                    'second-part',
                    'marvel-comics',
                    'based-on-comic',
                    'tv-special',
                    'fight',
                    'violence')
  AND kt.kind = 'movie'
  AND t.production_year > 1950
  AND kt.id = t.kind_id
  AND t.id = mk.movie_id
  AND t.id = ci.movie_id
  AND t.id = cc.movie_id
  AND mk.movie_id = ci.movie_id
  AND mk.movie_id = cc.movie_id
  AND ci.movie_id = cc.movie_id
  AND chn.id = ci.person_role_id
  AND n.id = ci.person_id
  AND k.id = mk.keyword_id
  AND cct1.id = cc.subject_id
  AND cct2.id = cc.status_id

