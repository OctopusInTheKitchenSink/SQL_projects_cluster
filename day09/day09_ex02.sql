CREATE FUNCTION fnc_trg_person_delete_audit() RETURNS trigger AS $$
BEGIN 
    DELETE FROM person WHERE id = OLD.id;
    INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
    VALUES(NOW(), 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE trigger trg_person_delete_audit AFTER DELETE ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;