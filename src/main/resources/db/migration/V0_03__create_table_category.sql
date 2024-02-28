DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.tm_category
        (
            id            BIGSERIAL                NOT NULL PRIMARY KEY,
            tm_category_name VARCHAR(40)              NOT NULL,
            created       TIMESTAMP WITH TIME ZONE NOT NULL,
            modified      TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by    VARCHAR(30)              NOT NULL,
            modified_by   VARCHAR(30)              NOT NULL,
            is_deleted    BOOLEAN                  NOT NULL
            );

        COMMENT ON TABLE public."tm_category" IS 'tm_category table';

        COMMENT ON COLUMN "tm_category".id IS 'tm_category ID is a unique value';
        COMMENT ON COLUMN "tm_category".tm_category_name IS 'The genus of tm_category same like type';
        COMMENT ON COLUMN "tm_category".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_category".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_category".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_category".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_category".is_deleted IS 'Have this table been deleted';

--         INSERT INTO public.tm_category (tm_category_name, created, modified, created_by, modified_by, is_deleted)
--         VALUES ('dành cho người mới', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--                ('hiểu về sản phẩm', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--                ('hướng dẫn thao tác', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--                ('kỹ năng bán hàng', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--                ('tài liệu tham khảo', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false);
    END
$$