DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."comment_template"
        (
            id          INT                      NOT NULL PRIMARY KEY,
            comment     TEXT,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL
        );

        COMMENT ON TABLE public."comment_template" IS 'Comment_Template table';

        COMMENT ON COLUMN "comment_template".id IS 'This is the ID of Comment_Template table and it is unique, id zero is for optional comment';
        COMMENT ON COLUMN "comment_template".comment IS 'The default comment and the optional comment';
        COMMENT ON COLUMN "comment_template".created IS 'Have been created by who';
        COMMENT ON COLUMN "comment_template".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "comment_template".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "comment_template".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "comment_template".is_deleted IS 'Have this table been deleted';
    END
$$