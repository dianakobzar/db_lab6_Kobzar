-- Процедура, яка видає ціну авто відповідно до введеного model_id
DROP PROCEDURE IF EXISTS get_price(integer);
CREATE OR REPLACE PROCEDURE get_price(modelID_arg integer)
LANGUAGE plpgsql
AS $$
DECLARE
    record_price numeric;
BEGIN
    BEGIN
        SELECT price INTO record_price
        FROM mercedes
        WHERE model_id = modelID_arg;

        RAISE INFO 'Price for model_id %: %', modelID_arg, record_price;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE INFO 'Car with model_id % not found', modelID_arg;
        WHEN OTHERS THEN
            RAISE INFO 'Error retrieving price';
    END;
END;
$$;
