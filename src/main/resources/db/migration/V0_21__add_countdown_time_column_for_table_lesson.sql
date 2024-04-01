DO
$$
    BEGIN
        ALTER TABLE tm_lesson
        DROP COLUMN time_remaining;

        ALTER TABLE tm_lesson
        ADD time_remaining INTEGER;
    END
$$