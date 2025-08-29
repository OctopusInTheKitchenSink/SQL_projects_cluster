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

WITH RECURSIVE way(last_city, tour, total_cost) AS(
    SELECT point1,
    CAST(ARRAY[point1] AS VARCHAR[]),
    0
    FROM nodes WHERE point1 = 'a'
    UNION
    SELECT nodes.point2 AS last_city,
    way.tour || ARRAY[nodes.point2] AS tour,
    way.total_cost + nodes.cost
    FROM way
    JOIN nodes
    ON way.last_city = nodes.point1
    WHERE NOT nodes.point2 = ANY(way.tour[2:5])
)
SELECT total_cost, tour FROM way
WHERE way.tour[5] = 'a' AND 
total_cost = (SELECT MIN(total_cost) FROM way WHERE way.tour[5] = 'a')
ORDER BY total_cost, tour;