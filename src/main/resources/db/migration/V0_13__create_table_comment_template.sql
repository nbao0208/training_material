DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."tm_comment_template"
        (
            id          BIGSERIAL                NOT NULL PRIMARY KEY,
            comment     TEXT,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL
            );

        COMMENT ON TABLE public."tm_comment_template" IS 'tm_comment_template table';

        COMMENT ON COLUMN "tm_comment_template".id IS 'This is the ID of tm_comment_template table and it is unique, id zero is for optional comment';
        COMMENT ON COLUMN "tm_comment_template".comment IS 'The default comment and the optional comment';
        COMMENT ON COLUMN "tm_comment_template".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_comment_template".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_comment_template".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_comment_template".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_comment_template".is_deleted IS 'Have this table been deleted';

--         INSERT INTO public.tm_comment_template (comment, created, modified, created_by, modified_by, is_deleted)
--         VALUES
--             ('Thông tin hấp dẫn', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             ('Thời lượng hợp lý', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             ('Trình bày bắt mắt', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             ('Nội dung dễ hiểu', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             ('Tính ứng dụng cao', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false);

END
$$