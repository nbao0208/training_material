DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."tm_user_answer"
        (
            id          BIGSERIAL                NOT NULL PRIMARY KEY,
            tm_user_id    BIGSERIAL                NOT NULL,
            tm_answer_id   BIGSERIAL                NOT NULL,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL,
            CONSTRAINT FK_tm_user_id_tm_user_answer FOREIGN KEY (tm_user_id) REFERENCES public."tm_user_test" (tm_user_id),
            CONSTRAINT FK_tm_answer_id_tm_user_answer FOREIGN KEY (tm_answer_id) REFERENCES public."tm_answer" (id)
        );

        COMMENT ON TABLE public."tm_user_answer" IS 'The table of users and those answers';

        COMMENT ON COLUMN "tm_user_answer".id IS 'The ID of this table and this is unique';
        COMMENT ON COLUMN "tm_user_answer".tm_user_id IS 'This users ID is take from the users_test table because the users have answer must have been doing test';
        COMMENT ON COLUMN "tm_user_answer".tm_answer_id IS 'This is the answer ID from the answer table';
        COMMENT ON COLUMN "tm_user_answer".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_user_answer".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_user_answer".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_user_answer".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_user_answer".is_deleted IS 'Have this table been deleted';

--         INSERT INTO public.tm_user_answer (tm_user_id, tm_answer_id, created, modified, created_by, modified_by, is_deleted)
--         SELECT
--             ut.tm_user_id,
--             a.id AS tm_answer_id,
--             CURRENT_TIMESTAMP AS created,
--             CURRENT_TIMESTAMP AS modified,
--             'bao nguyen' AS created_by,
--             'bao nguyen' AS modified_by,
--             false AS is_deleted
--         FROM
--             public.tm_user_test ut
--                 CROSS JOIN
--             public.tm_answer a;
    END
$$