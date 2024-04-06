DO
$$
    BEGIN
        ALTER TABLE tm_user_test
        DROP COLUMN score;

        ALTER TABLE tm_user_test
        ADD COLUMN score FLOAT CHECK ( score>=0 );
    END
$$