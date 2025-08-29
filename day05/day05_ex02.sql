CREATE INDEX idx_person_name ON person(UPPER(name));

SET enable_seqscan=false;
EXPLAIN ANALYZE
SELECT visit_date
FROM person_visits
JOIN person 
ON person.id = person_visits.person_id
WHERE UPPER(person.name) = 'Kate';
RESET enable_seqscan;