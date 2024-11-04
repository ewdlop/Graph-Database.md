MATCH (p:Person)-[:KNOWS]->(f:Friend)
RETURN p.name, f.name AS friendNames


MATCH (u:User)-[:FRIEND*1..3]-(friend)
RETURN DISTINCT friend

MATCH (u:User)-[:PURCHASED]->(p:Product)
WITH u, COUNT(p) AS purchaseCount
WHERE purchaseCount > 5
RETURN u
