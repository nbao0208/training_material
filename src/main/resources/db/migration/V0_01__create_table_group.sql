DO
    $$
        BEGIN
        CREATE TABLE IF NOT EXISTS public.tm_group
        (
            id          BIGSERIAL                NOT NULL PRIMARY KEY,
            "role"      VARCHAR(10),
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL
            );

        COMMENT ON TABLE public."tm_group" IS 'tm_group table';

        COMMENT ON COLUMN "tm_group".id IS 'tm_group ID is a unique value';
        COMMENT ON COLUMN "tm_group".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_group".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_group".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_group".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_group".is_deleted IS 'Have this table been deleted';
        COMMENT ON COLUMN "tm_group".role IS 'Type of users teacher or just users';

--         INSERT INTO public."tm_group"(role, created, modified, created_by, modified_by, is_deleted)
--         VALUES ('student', NOW(), NOW(), 'bao nguyen', 'bao nguyen', false),
--                ('teacher', NOW(), NOW(), 'bao nguyen', 'bao nguyen', false);
        END
    $$