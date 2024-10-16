DO
$$
    BEGIN
        CREATE TABLE a_company."tm_a_user"
        (
            id          BIGSERIAL PRIMARY KEY,
            user_id     BIGSERIAL NOT NULL,
            full_name   TEXT,
            citizen_id  TEXT,
            address     TEXT,
            dob         DATE,
            position    TEXT,
            start_day   DATE,
            created     TIMESTAMP WITH TIME ZONE,
            modified    TIMESTAMP WITH TIME ZONE,
            created_by  VARCHAR(50)    DEFAULT 'Bao Nguyen',
            modified_by VARCHAR(50)    DEFAULT 'Bao Nguyen',
            is_deleted  BOOLEAN DEFAULT FALSE,
            CONSTRAINT FK_user_id_tm_a_user_tm_user FOREIGN KEY (user_id) REFERENCES public."tm_user"(id)
        );

        COMMENT ON TABLE a_company."tm_a_user" IS 'This is the table for storing user information';

        COMMENT ON COLUMN a_company."tm_a_user".id IS 'This is the unique identifier for the user';
        COMMENT ON COLUMN a_company."tm_a_user".user_id IS 'The id of this user in user core table';
        COMMENT ON COLUMN a_company."tm_a_user".full_name IS 'This is the full name of the user';
        COMMENT ON COLUMN a_company."tm_a_user".citizen_id IS 'This is the citizen ID of the user';
        COMMENT ON COLUMN a_company."tm_a_user".address IS 'This is the address of the user';
        COMMENT ON COLUMN a_company."tm_a_user".dob IS 'This is the date of birth of the user';
        COMMENT ON COLUMN a_company."tm_a_user".position IS 'This is the job position of the user';
        COMMENT ON COLUMN a_company."tm_a_user".start_day IS 'This is the start date of the user in the company';
        COMMENT ON COLUMN a_company."tm_a_user".created IS 'This is the timestamp when the record was created';
        COMMENT ON COLUMN a_company."tm_a_user".modified IS 'This is the timestamp when the record was last modified';
        COMMENT ON COLUMN a_company."tm_a_user".created_by IS 'This indicates who created the record';
        COMMENT ON COLUMN a_company."tm_a_user".modified_by IS 'This indicates who last modified the record';
        COMMENT ON COLUMN a_company."tm_a_user".is_deleted IS 'This indicates whether the record is deleted (soft delete)';
    END
$$

