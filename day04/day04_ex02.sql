CREATE VIEW v_generated_dates AS
SELECT DATE(dates) FROM generate_series('2022-01-01'::date, '2022-01-31'::date, '1 day') AS dates;