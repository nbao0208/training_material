DO
    $$
        BEGIN
            CREATE TABLE IF NOT EXISTS public.group
            (
                id          VARCHAR(10)              NOT NULL PRIMARY KEY,
                created     TIMESTAMP WITH TIME ZONE NOT NULL,
                modified    TIMESTAMP WITH TIME ZONE NOT NULL,
                created_by  VARCHAR(30)              NOT NULL,
                modified_by VARCHAR(30)              NOT NULL,
                is_deleted  BOOLEAN                  NOT NULL,
                role        VARCHAR(10),
                user_id     VARCHAR(10)              NOT NULL,
                FOREIGN KEY (user_id) REFERENCES public.user (id)
    );


            COMMENT ON TABLE public."group" IS 'group table';

            COMMENT ON COLUMN "group".id IS 'Group ID is a unique value';
            COMMENT ON COLUMN "group".created IS 'Have been created by who';
            COMMENT ON COLUMN "group".modified IS 'Have been modified by who';
            COMMENT ON COLUMN "group".created_by IS 'Who have been create this table';
            COMMENT ON COLUMN "group".modified_by IS 'Who have been modify this table';
            COMMENT ON COLUMN "group".is_deleted IS 'Have this table been deleted';
            COMMENT ON COLUMN "group".user_id IS 'User ID is connective value to user table';
            COMMENT ON COLUMN "group".role IS 'Type of user teacher or just user';
        END
    $$