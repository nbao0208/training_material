DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."user_lesson"
        (
            id          VARCHAR(10)              NOT NULL PRIMARY KEY,
            user_id     VARCHAR(10)              NOT NULL,
            lesson_id   VARCHAR(10)              NOT NULL,
            report_id   VARCHAR(10)              NOT NULL,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL,
            FOREIGN KEY (user_id) REFERENCES public."user" (id),
            FOREIGN KEY (lesson_id) REFERENCES public."lesson" (id),
            FOREIGN KEY (report_id) REFERENCES public."report" (id)
            );

        COMMENT ON TABLE public."user_lesson" IS 'User-Lesson table';

        COMMENT ON COLUMN "user_lesson".id IS 'The ID of user and lesson table, this is unique value';
        COMMENT ON COLUMN "user_lesson".user_id IS 'The user ID is a connective value to the user table';
        COMMENT ON COLUMN "user_lesson".lesson_id IS 'The lesson ID is a connective value to the lesson table';
        COMMENT ON COLUMN "user_lesson".report_id IS 'The report ID is a connective value to the report table';
        COMMENT ON COLUMN "user_lesson".created IS 'Have been created by who';
        COMMENT ON COLUMN "user_lesson".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "user_lesson".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "user_lesson".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "user_lesson".is_deleted IS 'Have this table been deleted';
    END
$$