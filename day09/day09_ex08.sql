CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10) 
RETURNS TABLE (fib_res integer[]) AS $$
DECLARE 
    fib integer[] := ARRAY[]::integer[];
    i integer := 1;
    t integer := 0;
    k integer := 3;
    tmp integer;
BEGIN
    IF pstop > 0 THEN 
        fib := fib || t;
        IF pstop > 1 THEN 
            fib := fib || i;
            IF pstop > 2 THEN
                LOOP
                    tmp := fib[k - 1] + fib[k - 2];
                    EXIT WHEN tmp >= pstop;
                    fib := fib || tmp;
                    k := k + 1;
                END LOOP;
            END IF;
        END IF;
    END IF;
    fib_res := fib;
    RETURN NEXT;
END;
$$ LANGUAGE plpgsql;