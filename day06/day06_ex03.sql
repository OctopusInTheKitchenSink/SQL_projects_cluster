CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id);

-- DROP INDEX idx_person_discounts_unique;

SET enable_seqscan=false;
EXPLAIN ANALYZE
SELECT * FROM person_discounts
WHERE person_id = 2 AND pizzeria_id = 2;
RESET enable_seqscan;