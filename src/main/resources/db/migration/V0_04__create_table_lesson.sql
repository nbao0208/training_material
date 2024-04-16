DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.tm_lesson
        (
            id           BIGSERIAL                NOT NULL PRIMARY KEY,
            tm_category_id  BIGSERIAL                NOT NULL,
            content_link VARCHAR(100)             NOT NULL,
            title        TEXT                     NOT NULL,
            intro        TEXT                     NOT NULL,
            time_remaining INTEGER                NOT NULL,
            created      TIMESTAMP WITH TIME ZONE NOT NULL,
            modified     TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by   VARCHAR(30)              NOT NULL,
            modified_by  VARCHAR(30)              NOT NULL,
            is_deleted   BOOLEAN                  NOT NULL,
            CONSTRAINT FK_tm_category_id_tm_lesson FOREIGN KEY (tm_category_id) REFERENCES public."tm_category" (id)
            );

        COMMENT ON TABLE public."tm_lesson" IS 'tm_lesson table';

        COMMENT ON COLUMN "tm_lesson".id IS 'tm_lesson ID is a unique value';
        COMMENT ON COLUMN "tm_lesson".content_link IS 'The link to the pdf document or a video';
        COMMENT ON COLUMN "tm_lesson".title IS 'A title of the tm_lesson';
        COMMENT ON COLUMN "tm_lesson".intro IS 'A script of introduction about the tm_lessons';
        COMMENT ON COLUMN "tm_lesson".tm_category_id IS 'tm_category ID is a connective value to tm_category table';
        COMMENT ON COLUMN "tm_lesson".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_lesson".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_lesson".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_lesson".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_lesson".is_deleted IS 'Have this table been deleted';

-- INSERT INTO public.tm_lesson (tm_category_id, content_link, title, intro, time_remaining, created, modified, created_by, modified_by, is_deleted)
-- SELECT
--     (random() * 4 + 1)::int,
--         'http://example.com/lesson' || generate_series(1, 10) || '.html',
--     'Bài học ' || generate_series(1, 10),
--     'Nội dung giới thiệu cho bài học ' || generate_series(1, 10),
--     (random() * 120)::int,
--         CURRENT_TIMESTAMP,
--     CURRENT_TIMESTAMP,
--     'bao nguyen',
--     'bao nguyen',
--     false
-- FROM generate_series(1, 10);
    END
$$