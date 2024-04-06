DO
$$
    BEGIN
        ALTER TABLE tm_user_test
        ADD COLUMN passed BOOLEAN NOT NULL;
    END
$$