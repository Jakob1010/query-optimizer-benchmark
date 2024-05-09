select MIN(p1.tonode) 
from 
postgresql('localhost:5432', 'snap', 'patents', 'snap', 'snap', 'public') p1,
postgresql('localhost:5432', 'snap', 'patents', 'snap', 'snap', 'public') p2,
postgresql('localhost:5432', 'snap', 'patents', 'snap', 'snap', 'public') p3,
postgresql('localhost:5432', 'snap', 'patents', 'snap', 'snap', 'public') p4,
postgresql('localhost:5432', 'snap', 'patents', 'snap', 'snap', 'public') p5
where p1.tonode = p2.fromnode AND p2.tonode = p3.fromnode AND p3.tonode = p4.fromnode AND p4.tonode = p5.fromnode

