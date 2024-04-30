DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."tm_user_optional_comment"
        (
            id          BIGSERIAL                NOT NULL PRIMARY KEY,
            tm_comment_rating_id    BIGSERIAL                NOT NULL,
            comment     TEXT,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL,
            CONSTRAINT FK_tm_comment_rating_id_tm_user_optional_comment FOREIGN KEY (tm_comment_rating_id) REFERENCES public."tm_comment_rating" (id)
        );

        COMMENT ON TABLE public."tm_user_optional_comment" IS 'The table of the optional comment of users in the end of the rating';

        COMMENT ON COLUMN "tm_user_optional_comment".id IS 'The ID of this table and this is unique';
        COMMENT ON COLUMN "tm_user_optional_comment".tm_comment_rating_id IS 'The ID from the comment_rating table because this users must have been rated';
        COMMENT ON COLUMN "tm_user_optional_comment".comment IS 'The optional comment of the users';
        COMMENT ON COLUMN "tm_user_optional_comment".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_user_optional_comment".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_user_optional_comment".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_user_optional_comment".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_user_optional_comment".is_deleted IS 'Have this table been deleted';

--         INSERT INTO public.tm_user_optional_comment (tm_user_id, comment, created, modified, created_by, modified_by, is_deleted)
--         SELECT
--             cr.tm_user_id,
--             'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi.' AS comment,
--             CURRENT_TIMESTAMP AS created,
--             CURRENT_TIMESTAMP AS modified,
--             'bao nguyen' AS created_by,
--             'bao nguyen' AS modified_by,
--             false AS is_deleted
--         FROM
--             public.tm_comment_rating cr;
    END
$$