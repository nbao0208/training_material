DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.user_group
        (
            id          VARCHAR(10)              NOT NULL PRIMARY KEY,
            user_id     VARCHAR(10)              NOT NULL,
            group_id    VARCHAR(10)              NOT NULL,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL,
            FOREIGN KEY (user_id) REFERENCES public.user (id),
            FOREIGN KEY (group_id) REFERENCES public.group (id)
        );

        COMMENT ON TABLE public."user_group" IS 'User_Group table';

        COMMENT ON COLUMN "user_group".id IS 'User_Group ID is a unique value';
        COMMENT ON COLUMN "user_group".user_id IS 'User ID is a connective value to user table';
        COMMENT ON COLUMN "user_group".group_id IS 'Group ID is a connective value to group table';
        COMMENT ON COLUMN "user_group".created IS 'Have been created by who';
        COMMENT ON COLUMN "user_group".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "user_group".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "user_group".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "user_group".is_deleted IS 'Have this table been deleted';
    END
$$