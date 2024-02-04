DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."user_optional_comment"
        (
            id          VARCHAR(10)              NOT NULL PRIMARY KEY,
            user_id     VARCHAR(10)              NOT NULL,
            comment     TEXT,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL,
            FOREIGN KEY (user_id) REFERENCES public."comment_rating" (user_id)
        );

        COMMENT ON TABLE public."user_optional_comment" IS 'The table of the optional comment of user in the end of the rating';

        COMMENT ON COLUMN "user_optional_comment".id IS 'The ID of this table and this is unique';
        COMMENT ON COLUMN "user_optional_comment".user_id IS 'The user ID from the comment_rating table because this user must have been rated';
        COMMENT ON COLUMN "user_optional_comment".comment IS 'The optional comment of the user';
        COMMENT ON COLUMN "user_optional_comment".created IS 'Have been created by who';
        COMMENT ON COLUMN "user_optional_comment".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "user_optional_comment".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "user_optional_comment".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "user_optional_comment".is_deleted IS 'Have this table been deleted';
    END
$$