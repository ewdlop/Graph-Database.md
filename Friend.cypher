MATCH (p:Person)-[:KNOWS]->(f:Friend)
RETURN p.name, f.name AS friendNames
