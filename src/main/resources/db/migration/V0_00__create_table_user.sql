 DO
 $$
    BEGIN
         CREATE TABLE IF NOT EXISTS public.tm_user
         (
             id          BIGSERIAL                NOT NULL PRIMARY KEY,
             first_name  VARCHAR(30)              NOT NULL,
             middle_name VARCHAR(10)              NOT NULL,
             last_name   VARCHAR(10)              NOT NULL,
             national_id VARCHAR(12),
             address     VARCHAR(30),
             dob         DATE                     NOT NULL,
             created     TIMESTAMP WITH TIME ZONE NOT NULL,
             modified    TIMESTAMP WITH TIME ZONE NOT NULL,
             created_by  VARCHAR(30)              NOT NULL,
             modified_by VARCHAR(30)              NOT NULL,
             is_deleted  BOOLEAN                  NOT NULL
             );

        COMMENT ON TABLE public."tm_user" IS ' tm_user table ';

        COMMENT ON COLUMN "tm_user".id IS ' tm_user ID is a unique value ';
        COMMENT ON COLUMN "tm_user".created IS ' When have been created ';
        COMMENT ON COLUMN "tm_user".modified IS ' When have been modified ';
        COMMENT ON COLUMN "tm_user".created_by IS ' Have been created by who ';
        COMMENT ON COLUMN "tm_user".modified_by IS ' Have been modified by who ';
        COMMENT ON COLUMN "tm_user".is_deleted IS 'Have this table been deleted';
        COMMENT ON COLUMN "tm_user".first_name IS ' First name of tm_user ';
        COMMENT ON COLUMN "tm_user".middle_name IS 'Middle name of tm_user';
        COMMENT ON COLUMN "tm_user".last_name IS ' Last name of tm_user ';
        COMMENT ON COLUMN "tm_user".dob IS ' Day of birth of tm_user ';
        COMMENT ON COLUMN "tm_user".address IS 'Home address of tm_user';
        COMMENT ON COLUMN "tm_user".national_id IS 'National ID of tm_user';

--          INSERT INTO public.tm_user (first_name, middle_name, last_name, national_id, address, dob, created, modified, created_by,
--                                    modified_by, is_deleted)
--          VALUES ('John', 'A', 'Doe', '1234567890', '123 Main St', '1985-05-10', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Jane', 'B', 'Smith', '0987654321', '456 Oak Ave', '1990-12-15', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Michael', 'C', 'Johnson', '5678901234', '789 Elm St', '1978-09-20', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Alice', 'D', 'Williams', '3456789012', '321 Pine St', '1982-03-25', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Robert', 'E', 'Brown', '4567890123', '654 Birch Ave', '1995-07-30', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Emily', 'F', 'Jones', '7890123456', '987 Cedar St', '1987-11-05', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('William', 'G', 'Davis', '8901234567', '753 Maple St', '1992-02-18', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Mary', 'H', 'Miller', '9012345678', '852 Walnut Ave', '1980-08-12', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('David', 'I', 'Wilson', '2345678901', '369 Oak St', '1975-06-23', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Jennifer', 'J', 'Taylor', '3456789012', '963 Elm Ave', '1993-04-17', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('James', 'K', 'Anderson', '4567890123', '852 Pine St', '1988-10-29', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Linda', 'L', 'Thomas', '5678901234', '741 Birch Ave', '1977-12-08', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Charles', 'M', 'Harris', '6789012345', '159 Cedar St', '1996-01-14', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Patricia', 'N', 'Clark', '7890123456', '357 Maple St', '1984-07-07', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Daniel', 'O', 'Lewis', '8901234567', '258 Walnut Ave', '1981-09-03', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Elizabeth', 'P', 'Lee', '9012345678', '963 Oak St', '1976-11-19', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Matthew', 'Q', 'Walker', '0123456789', '852 Elm Ave', '1994-05-26', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Karen', 'R', 'Perez', '1234567890', '741 Pine St', '1983-03-09', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Christopher', 'S', 'Hall', '2345678901', '369 Birch Ave', '1979-02-13', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Sarah', 'T', 'Young', '3456789012', '159 Cedar St', '1997-08-27', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Andrew', 'U', 'Allen', '4567890123', '357 Maple St', '1986-12-21', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Nancy', 'V', 'King', '5678901234', '258 Walnut Ave', '1989-06-04', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('James', 'W', 'Wright', '6789012345', '963 Oak St', '1980-04-30', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Margaret', 'X', 'Lopez', '7890123456', '852 Elm Ave', '1995-10-12', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Robert', 'Y', 'Hill', '8901234567', '741 Pine St', '1974-01-07', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Susan', 'Z', 'Scott', '9012345678', '369 Birch Ave', '1991-07-22', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Michael', 'AA', 'Green', '0123456789', '159 Cedar St', '1987-09-14', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Karen', 'BB', 'Adams', '1234567890', '357 Maple St', '1973-02-08', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('David', 'CC', 'Baker', '2345678901', '258 Walnut Ave', '1998-06-01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Lisa', 'DD', 'Gonzalez', '3456789012', '963 Oak St', '1981-04-25', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Richard', 'EE', 'Nelson', '4567890123', '852 Elm Ave', '1996-11-10', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Karen', 'FF', 'Carter', '5678901234', '741 Pine St', '1978-08-16', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Betty', 'GG', 'Roberts', '6789012345', '369 Birch Ave', '1983-05-03', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Matthew', 'HH', 'Turner', '7890123456', '159 Cedar St', '1990-03-19', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Linda', 'II', 'Phillips', '8901234567', '357 Maple St', '1976-12-02', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Anthony', 'JJ', 'Campbell', '9012345678', '258 Walnut Ave', '1989-10-27', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Dorothy', 'KK', 'Evans', '0123456789', '963 Oak St', '1984-07-13', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Charles', 'LL', 'Murphy', '1234567890', '852 Elm Ave', '1977-02-28', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Ashley', 'MM', 'Ortiz', '2345678901', '741 Pine St', '1992-06-22', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Jessica', 'NN', 'Gutierrez', '3456789012', '369 Birch Ave', '1986-04-15', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('George', 'OO', 'Sullivan', '4567890123', '159 Cedar St', '1995-12-09', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Daniel', 'PP', 'Romero', '5678901234', '357 Maple St', '1981-09-03', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false),
--                 ('Sarah', 'QQ', 'Pierce', '6789012345', '258 Walnut Ave', '1998-03-28', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
--                  'bao nguyen', 'bao nguyen', false);
    END
$$;
