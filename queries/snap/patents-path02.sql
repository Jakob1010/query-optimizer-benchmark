select MIN(p1.tonode) 
from 
postgresql('localhost:5432', 'snap', 'patents', 'snap', 'snap', 'public') p1,
postgresql('localhost:5432', 'snap', 'patents', 'snap', 'snap', 'public') p2,
postgresql('localhost:5432', 'snap', 'patents', 'snap', 'snap', 'public') p3
where p1.tonode = p2.fromnode AND p2.tonode = p3.fromnode

