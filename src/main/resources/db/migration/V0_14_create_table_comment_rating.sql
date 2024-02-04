DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."comment_rating"
        (
            id                  VARCHAR(10)              NOT NULL PRIMARY KEY,
            rating_id           VARCHAR(10)              NOT NULL,
            comment_template_id INT                      NOT NULL,
            user_id             VARCHAR(10)              NOT NULL,
            created             TIMESTAMP WITH TIME ZONE NOT NULL,
            modified            TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by          VARCHAR(30)              NOT NULL,
            modified_by         VARCHAR(30)              NOT NULL,
            is_deleted          BOOLEAN                  NOT NULL,
            FOREIGN KEY (rating_id) REFERENCES public."rating" (id),
            FOREIGN KEY (comment_template_id) REFERENCES public."comment_template" (id),
            FOREIGN KEY (user_id) REFERENCES public."user_lesson" (user_id)
        );

        COMMENT ON TABLE public."comment_rating" IS 'Comment and rating table';

        COMMENT ON COLUMN "comment_rating".id IS 'The ID of this table and it is unique';
        COMMENT ON COLUMN "comment_rating".rating_id IS 'A connective value to the rating table';
        COMMENT ON COLUMN "comment_rating".comment_template_id IS 'A connective value to the comment_template table';
        COMMENT ON COLUMN "comment_rating".user_id IS 'The user ID take from the user_lesson table because this user must have been learning the lesson';
        COMMENT ON COLUMN "comment_rating".created IS 'Have been created by who';
        COMMENT ON COLUMN "comment_rating".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "comment_rating".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "comment_rating".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "comment_rating".is_deleted IS 'Have this table been deleted';
    END
$$