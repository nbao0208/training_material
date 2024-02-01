 DO
 $$
    BEGIN
         CREATE TABLE IF NOT EXISTS public.user
        (
            id          VARCHAR(10)              NOT NULL PRIMARY KEY,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            first_name  VARCHAR(30)              NOT NULL,
            middle_name VARCHAR(10)              NOT NULL,
            last_name   VARCHAR(10)              NOT NULL,
            national_id VARCHAR(12),
            address     VARCHAR(30),
            dob         DATE                     NOT NULL
        );

        COMMENT ON TABLE public."user" IS ' user table ';

        COMMENT ON COLUMN "user".id IS ' ID ';
        COMMENT ON COLUMN "user".created IS ' When have been created ';
        COMMENT ON COLUMN "user".modified IS ' When have been modified ';
        COMMENT ON COLUMN "user".created_by IS ' Have been created by who ';
        COMMENT ON COLUMN "user".modified_by IS ' Have been modified by who ';
        COMMENT ON COLUMN "user".first_name IS ' First name of user ';
        COMMENT ON COLUMN "user".middle_name IS 'Middle name of user';
        COMMENT ON COLUMN "user".last_name IS ' Last name of user ';
        COMMENT ON COLUMN "user".dob IS ' Day of birth of user ';
        COMMENT ON COLUMN "user".address IS 'Home address of user';
        COMMENT ON COLUMN "user".national_id IS 'National ID of user';
    END
$$;
