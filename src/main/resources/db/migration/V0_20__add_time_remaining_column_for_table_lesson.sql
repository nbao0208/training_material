DO
$$
    BEGIN
        ALTER TABLE tm_lesson
        ADD COLUMN time_remaining TIME;
    END
$$

