CREATE FUNCTION func_minimum(arr NUMERIC[]) RETURNS numeric
AS $$
DECLARE min_ar NUMERIC;
BEGIN 
    SELECT MIN(arr[i]) INTO min_ar
    FROM generate_subscripts(arr, 1) AS g(i);
    RETURN min_ar;
END;
$$ LANGUAGE plpgsql;

-- DROP FUNCTION func_minimum(VARIADIC NUMERIC[]);