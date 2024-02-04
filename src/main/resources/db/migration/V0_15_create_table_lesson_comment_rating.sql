DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."lesson_comment_rating"
        (
            id                VARCHAR(10)              NOT NULL PRIMARY KEY,
            comment_rating_id VARCHAR(10)              NOT NULL,
            lesson_id         VARCHAR(10)              NOT NULL,
            created           TIMESTAMP WITH TIME ZONE NOT NULL,
            modified          TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by        VARCHAR(30)              NOT NULL,
            modified_by       VARCHAR(30)              NOT NULL,
            is_deleted        BOOLEAN                  NOT NULL,
            FOREIGN KEY (comment_rating_id) REFERENCES public."comment_rating" (id),
            FOREIGN KEY (lesson_id) REFERENCES public."lesson" (id)
        );

        COMMENT ON TABLE public."lesson_comment_rating" IS 'The table between comment_rating table and lesson table';

        COMMENT ON COLUMN "lesson_comment_rating".id IS 'The ID of this table and it is unique';
        COMMENT ON COLUMN "lesson_comment_rating".comment_rating_id IS 'The connective value to the comment_rating table';
        COMMENT ON COLUMN "lesson_comment_rating".lesson_id IS 'The connective value to the lesson table';
        COMMENT ON COLUMN "lesson_comment_rating".created IS 'Have been created by who';
        COMMENT ON COLUMN "lesson_comment_rating".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "lesson_comment_rating".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "lesson_comment_rating".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "lesson_comment_rating".is_deleted IS 'Have this table been deleted';
    END
$$