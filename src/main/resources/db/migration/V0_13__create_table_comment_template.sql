DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."tm_comment_template"
        (
            id          BIGSERIAL                NOT NULL PRIMARY KEY,
            tm_rating_id BIGSERIAL               NOT NULL,
            comment     TEXT,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL,
            CONSTRAINT FK_tm_rating_id_tm_comment_template FOREIGN KEY(tm_rating_id) REFERENCES public."tm_rating" (id)
        );

        COMMENT ON TABLE public."tm_comment_template" IS 'tm_comment_template table';

        COMMENT ON COLUMN "tm_comment_template".id IS 'This is the ID of tm_comment_template table and it is unique, id zero is for optional comment';
        COMMENT ON COLUMN "tm_comment_template".tm_rating_id IS 'This is the ID of tm_rating table';
        COMMENT ON COLUMN "tm_comment_template".comment IS 'The default comment and the optional comment';
        COMMENT ON COLUMN "tm_comment_template".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_comment_template".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_comment_template".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_comment_template".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_comment_template".is_deleted IS 'Have this table been deleted';


-- INSERT INTO public.tm_comment_template (tm_rating_id, comment, created, modified, created_by, modified_by, is_deleted)
-- VALUES
--     (1, 'Thông tin không chính xác', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (1, 'Bài học quá dài', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (1, 'Nội dung khó hiểu', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (1, 'Trình bày không hấp dẫn', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (1, 'Không có tính ứng dụng', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (2, 'Thông tin không chính xác', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (2, 'Bài học quá dài', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (2, 'Nội dung khó hiểu', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (2, 'Trình bày không hấp dẫn', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (2, 'Không có tính ứng dụng', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (3, 'Thông tin không chính xác', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (3, 'Bài học quá dài', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (3, 'Nội dung khó hiểu', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (3, 'Trình bày không hấp dẫn', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (3, 'Không có tính ứng dụng', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (4, 'Thông tin hấp dẫn', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (4, 'Thời lượng hợp lý', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (4, 'Trình bày bắt mắt', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (4, 'Nội dung dễ hiểu', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (4, 'Tính ứng dụng cao', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (5, 'Thông tin hấp dẫn', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (5, 'Thời lượng hợp lý', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (5, 'Trình bày bắt mắt', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (5, 'Nội dung dễ hiểu', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--     (5, 'Tính ứng dụng cao', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false);

END
$$