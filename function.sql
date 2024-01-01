-- Функція, що видаляє машини з таблиць engine і mercedes, в яких розмір мотору менший за 3
DROP FUNCTION IF EXISTS remove_machine();
CREATE OR REPLACE FUNCTION remove_machine() RETURNS void
LANGUAGE 'plpgsql'
AS $$
BEGIN 
    DELETE FROM mercedes
    WHERE enginesize_id IN (SELECT enginesize_id FROM engine WHERE enginesize < 3.0);

    -- Видаляємо машини з таблиці engine, де розмір мотору менший за 3
    DELETE FROM engine
    WHERE enginesize < 3.0;
END;
$$;
