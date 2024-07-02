DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."tm_user_account"
        (
            id         BIGSERIAL NOT NULL PRIMARY KEY,
            tm_user_group_id BIGSERIAL NOT NULL,
            account    TEXT      NOT NULL,
            password   TEXT      NOT NULL,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL,
            CONSTRAINT FK_tm_user_group_id_user_account FOREIGN KEY (tm_user_group_id) REFERENCES public.tm_user_group (id)
        );

        COMMENT ON TABLE "tm_user_account" IS 'This is table for user account';

        COMMENT ON COLUMN tm_user_account.id IS 'This is the id of this table and it is unique';
        COMMENT ON COLUMN "tm_user_account".tm_user_group_id IS 'This is the user_group_id from tm_user_group table';
        COMMENT ON COLUMN "tm_user_account".account IS 'This is the account of the user';
        COMMENT ON COLUMN "tm_user_account".password IS 'The password of the user account';
    END
$$

