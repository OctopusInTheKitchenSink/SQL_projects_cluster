CREATE TABLE nodes (
	point1 CHAR,
	point2 CHAR,
	cost INT
);

INSERT INTO nodes (point1, point2, cost) VALUES
('a', 'b', 10),
('b', 'a', 10),
('b', 'c', 35),
('c', 'b', 35),
('a', 'd', 20),
('d', 'a', 20),
('b', 'd', 25),
('d', 'b', 25),
('a', 'c', 15),
('c', 'a', 15),
('d', 'c', 30),
('c', 'd', 30);

WITH RECURSIVE r AS (
	SELECT (point1 || ',' || point2) AS text_tour, point1, point2, 
	cost, 1 AS depth FROM nodes WHERE point1 = 'a'

	UNION

	SELECT (text_tour || ',' || nodes.point2)
	AS text_tour, nodes.point1, nodes.point2, nodes.cost + r.cost, depth + 1
	FROM r
	JOIN nodes ON nodes.point1 = r.point2 WHERE r.text_tour NOT LIKE '%'||nodes.point2||'%'
),
nodes2 AS (SELECT * FROM nodes WHERE point2 = 'a'),
result AS (
	SELECT n2.cost + r.cost AS total_cost, ('{' || r.text_tour || ',' || n2.point2 || '}') AS tour
	FROM r
	JOIN
	nodes2 n2 ON n2.point1 = r.point2
	WHERE depth = 3
)

SELECT * FROM result WHERE
	total_cost = (SELECT min(total_cost) FROM result)
	OR
	total_cost = (SELECT max(total_cost) FROM result)
ORDER BY total_cost, tour;
