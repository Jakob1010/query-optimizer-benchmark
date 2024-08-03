# Query-Optimizer-Benchmark
  
This repo provides a test setup in order to evaluate a query optimizer implemented into the databse system [ClickHouse](https://clickhouse.com/).

## How it works
- Deploy a datasource from section **Datasources**
- Run the jupyter-notebook ``clickhouse-eval.ipynb``

## Datasources

### imdb
  - clone repo from https://github.com/metabrainz/musicbrainz-docker#publish-ports-of-all-services
  - publish ports of all services
  - run test queries such as:
	> select * from postgresql('localhost:5432', 'musicbrainz_db', 'artist', 'musicbrainz', 'musicbrainz', 'musicbrainz') limit 10;
