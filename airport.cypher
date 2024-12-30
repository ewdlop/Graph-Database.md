LOAD CSV WITH HEADErS FROM "file:///airlines.csv" AS row
CREATE (a:Airport)
SET a = row
LOAD CSV WITH HEADErS FROM "file:///airports.csv" AS row
CREATE (l:Airline)
SET l = row
LOAD CSV WITH HEADErS FROM "file:///routes.csv" AS row
CREATE (r:Route)
SET r = row
LOAD CSV WITH HEADErS FROM "file:///countries.csv" AS row
CREATE (c:Country)
SET c = row
LOAD CSV WITH HEADErS FROM "file:///planes.csv" AS row
CREATE (p:Plane)
SET p = row

#Query Airpot Nodes(rows)
MATCH(a:Airport) Return a

#Creat Relationship based on Airport's ID(IATA)
MATCH(r:Route)
MATCH(a:Airport) WHERE a.IATA = r.Source airport
MATCH(b:Airport) WHERE b.IATA = r.Destination airport
Create (a)-[rel:fly]->(b) Return a,b

##Create (a)-[rel:relationshipname {cost:x}} ->(b) can be used for weighted edges

#Link the airpot and country
Match(a:Airport) Match(c:Country) where a.Country = c.name 
Create (a)-[rel:locate]->(c) Return a,c

#Find the shortest path with less or equal to 3 hops for the 3 following airport
#allShortestPath is a in-build function
MATCH (n:Airport) where n.Name IN ['Copenhagen Roskilde Airport','Birmingham International Airport','Mielec Airport']​
WITH collect(n) as nodes​
UNWIND nodes as n​
UNWIND nodes as m​
WITH * WHERE id(n) < id(m)​
MATCH path = allShortestPaths( (n)-[*..3]-(m) )​
RETURN path

#Addition Feature of the Neo4J
#Grabbing Json Dataset from Stackexchange.com
page,pagesize,order,sort in the url below are customlizable option 
#Put the url directly in any broswer also works

WITH "https://api.stackexchange.com/2.2/questions?page=1&pagesize=5&order=desc&sort=activity&site=stackoverflow" AS url
CALL apoc.load.json(url) YIELD value
UNWIND value.items AS items
RETURN itemse internet
