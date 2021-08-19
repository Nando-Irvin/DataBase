/* you can create a function to insert a new value to the table or modify or delete a previous one*/

CREATE OR REPLACE FUNCTION movimientos()
RETURNS trigger as $movimi$
BEGIN
  IF (TG_OP = 'DELETE') THEN
    INSERT INTO movimientos (tabla, movimiento, dato_original, nuevo_dato, fecha_hora)
           VALUES (TG_TABLE_NAME, 'Eliminado', OLD, NULL, now());
    RETURN OLD;
  ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO movimientos (tabla, movimiento, dato_original, nuevo_dato, fecha_hora)
           VALUES (TG_TABLE_NAME, 'Actualizado', OLD, NEW, now());
    RETURN NEW;
  ELSIF (TG_OP = 'INSERT') THEN
    INSERT INTO movimientos (tabla, movimiento, dato_original, nuevo_dato, fecha_hora)
           VALUES (TG_TABLE_NAME, 'Insertado', NULL, NEW, now());
    RETURN NEW;
  END IF;
  RETURN NULL;
END;
$movimi$ language plpgsql;

/*Then you create and execute the  trigger*/

CREATE TRIGGER movicar AFTER INSERT OR UPDATE OR DELETE
ON carros FOR EACH ROW EXECUTE PROCEDURE movimientos();
