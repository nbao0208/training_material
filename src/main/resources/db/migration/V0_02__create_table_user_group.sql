DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.tm_user_group
        (
            id          BIGSERIAL                NOT NULL PRIMARY KEY,
            tm_user_id    BIGSERIAL                NOT NULL,
            tm_group_id   BIGSERIAL                NOT NULL,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL,
            CONSTRAINT FK_tm_user_id_tm_user_group FOREIGN KEY (tm_user_id) REFERENCES public.tm_user (id),
            CONSTRAINT FK_tm_group_id_tm_user_group FOREIGN KEY (tm_group_id) REFERENCES public.tm_group (id)
            );

        COMMENT ON TABLE public."tm_user_group" IS 'tm_user_group table';

        COMMENT ON COLUMN "tm_user_group".id IS 'tm_user_group ID is a unique value';
        COMMENT ON COLUMN "tm_user_group".tm_user_id IS 'tm_user ID is a connective value to tm_user table';
        COMMENT ON COLUMN "tm_user_group".tm_group_id IS 'tm_group ID is a connective value to tm_group table';
        COMMENT ON COLUMN "tm_user_group".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_user_group".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_user_group".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_user_group".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_user_group".is_deleted IS 'Have this table been deleted';

--         INSERT INTO public.tm_user_group (tm_user_id, tm_group_id, created, modified, created_by, modified_by, is_deleted)
--         SELECT u.id, g.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false
--         FROM public.tm_user u
--                  CROSS JOIN (SELECT id
--                              FROM public.tm_group
--                              WHERE role IN ('student', 'teacher')) g
--         WHERE u.first_name IN
--               ('John', 'Jane', 'Michael', 'Alice', 'Robert', 'Emily', 'William', 'Mary', 'David', 'Jennifer', 'James', 'Linda',
--                'Charles', 'Patricia', 'Daniel', 'Elizabeth', 'Matthew', 'Karen', 'Christopher', 'Sarah', 'Andrew', 'Nancy',
--                'James', 'Margaret', 'Robert', 'Susan', 'Michael', 'Karen', 'David', 'Lisa', 'Richard', 'Karen', 'Betty',
--                'Matthew', 'Linda', 'Anthony', 'Dorothy', 'Charles', 'Ashley', 'Jessica', 'George', 'Daniel', 'Sarah')
--           AND (
--             u.first_name IN ('John', 'Jane', 'Michael', 'Alice', 'Robert') OR
--             g.id IN (SELECT id FROM public.tm_group WHERE role = 'student')
--             );
    END
$$