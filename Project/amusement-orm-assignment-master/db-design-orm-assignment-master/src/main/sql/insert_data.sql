
DROP TABLE IF EXISTS `amusement_design`.`levels`;
DROP TABLE IF EXISTS `amusement_design`.`rides`;

DROP TABLE IF EXISTS `amusement_design`.`passes`;
DROP TABLE IF EXISTS `amusement_design`.`parks`;
DROP TABLE IF EXISTS `amusement_design`.`familymembers`;
DROP TABLE IF EXISTS `amusement_design`.`users`;



-- create users table
CREATE TABLE `amusement_design`.`users` (
                                            `id` INT NOT NULL AUTO_INCREMENT,
                                            `first_name` VARCHAR(45) NULL,
                                            `last_name` VARCHAR(45) NULL,
                                            `username` VARCHAR(45) NOT NULL,
                                            `password` VARCHAR(45) NOT NULL,
                                            `email` VARCHAR(45) NULL,
                                            `dob` DATE NULL,
                                            `created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
                                            `updated` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
                                                ON UPDATE CURRENT_TIMESTAMP,
                                            PRIMARY KEY (`id`));

SELECT * FROM users;

-- insert anirudh’s data
INSERT INTO users (first_name,last_name,username,password,email)
VALUES ('Anirudh','Ramanathan','anirudh.r','Astro03!','anirudh.ram1003@gmail.com');

-- insert vrushali’s data
INSERT INTO users (first_name, last_name, username, password, email)
VALUES ('Vrushali','Tarte','tarte.v','P@ssW0rd','tarte.v@northeastern.edu');

-- insert roy’s data
INSERT INTO users (first_name, last_name, username, password, email)
VALUES ('Roy','Wang','wang.ro','abcde@2','wang.ro@northeastern.edu');

-- insert christopher’s data
INSERT INTO users (first_name, last_name, username, password, email)
VALUES ('Christopher','Burke','burke.chr','MySQL@P4SS','burke.chr@northeastern.edu');
-- create parks table
DROP TABLE IF EXISTS `amusement_design`.`parks`;
CREATE TABLE `amusement_design`.`parks` (
                                            `id` INT NOT NULL AUTO_INCREMENT,
                                            `name` VARCHAR(45) NOT NULL,
                                            `food_num` INT NOT NULL,
                                            `size_sqm` INT NOT NULL,
                                            `revenue` INT NOT NULL,
                                            `lights` BIT NOT NULL,
                                            `created` DATETIME NULL
                                                DEFAULT CURRENT_TIMESTAMP,
                                            `updated` DATETIME NULL
                                                DEFAULT CURRENT_TIMESTAMP
                                                ON UPDATE CURRENT_TIMESTAMP,
                                            PRIMARY KEY (`id`));

SELECT * FROM parks;

-- (size in acres, revenue in millions)
-- insert Boston Adventure (ID 1)
INSERT INTO parks (name, food_num, size_sqm, revenue, lights)
VALUES  ('Boston Adventure', 15, 50, 25, 1);

-- insert Magic Mountain (ID 2)
INSERT INTO parks (name, food_num, size_sqm, revenue, lights)
VALUES ('Magic Mountain', 140, 260, 120, 1);

-- insert Husky (ID 3)
INSERT INTO parks (name, food_num, size_sqm, revenue, lights)
VALUES ('Husky', 35, 100, 450, 1);


-- create levels portable enumeration
CREATE TABLE `amusement_design`.`levels`(
                                            `id` INT NOT NULL AUTO_INCREMENT,
                                            `name` VARCHAR(45) NOT NULL,
                                            PRIMARY KEY (`id`));

SELECT * FROM levels;

-- insert tame level (1)
INSERT INTO levels (name)
VALUES ('Tame');

-- insert traditional level (2)
INSERT INTO levels (name)
VALUES ('Traditional');

-- insert thrilling level (3)
INSERT INTO levels (name)
VALUES ('Thrilling');

-- insert intense level (4)
INSERT INTO levels (name)
VALUES ('Intense');

-- insert extreme level (5)
INSERT INTO levels (name)
VALUES ('Extreme');

-- create rides table

CREATE TABLE `amusement_design`.`rides` (
                                            `id` INT NOT NULL AUTO_INCREMENT,
                                            `name` VARCHAR(45) NOT NULL,
                                            `height_rq` INT NOT NULL,
                                            `capacity_per_ride` INT NOT NULL,
                                            `operation_status` BIT NOT NULL,
                                            `park_id` INT NOT NULL,
                                            `thrill_id` INT NOT NULL,
                                            `created` DATETIME NULL
                                                DEFAULT CURRENT_TIMESTAMP,
                                            `updated` DATETIME NULL
                                                DEFAULT CURRENT_TIMESTAMP
                                                ON UPDATE CURRENT_TIMESTAMP,
                                            PRIMARY KEY (`id`),
                                            FOREIGN KEY (`park_id`)
                                                REFERENCES `amusement_design`.`parks` (`id`)
                                                ON DELETE CASCADE
                                                ON UPDATE CASCADE,
                                            FOREIGN KEY (`thrill_id`)
                                                REFERENCES `amusement_design`.`levels` (`id`)
                                                ON DELETE CASCADE
                                                ON UPDATE CASCADE);

SELECT * FROM rides;

-- (height req in inches)
-- insert ride Flight Sim into Boston Adventure
INSERT INTO rides (name, height_rq, capacity_per_ride, operation_status, park_id, thrill_id, created, updated)
VALUES ('Flight Sim', 54, 24, 1, 1, 5, '2021-04-16', '2021-04-17');

-- insert ride Coaster Express into Boston Adventure
INSERT INTO rides (name, height_rq, capacity_per_ride, operation_status, park_id, thrill_id, created, updated)
VALUES ('Coaster Express', 46, 15, 0, 1, 3, '2021-04-16', '2021-04-17');

-- insert ride Animal Carousel into Boston Adventure
INSERT INTO rides (name, height_rq, capacity_per_ride, operation_status, park_id, thrill_id)
VALUES ('Animal Carousel', 36, 40, 1, 1, 1);

-- insert ride Goliath into Magic Mountain
INSERT INTO rides (name, height_rq, capacity_per_ride, operation_status, park_id, thrill_id)
VALUES ('Goliath', 60, 24, 1, 2, 5);

-- insert ride Defiance into Magic Mountain
INSERT INTO rides (name, height_rq, capacity_per_ride, operation_status, park_id, thrill_id)
VALUES ('Defiance', 48, 40, 1, 2, 4);

-- insert ride Lazy River into Magic Mountain
INSERT INTO rides (name, height_rq, capacity_per_ride, operation_status, park_id, thrill_id)
VALUES ('Lazy River', 0, 80, 1, 2, 2);

-- insert ride Krentzman into Husky
INSERT INTO rides (name, height_rq, capacity_per_ride, operation_status, park_id, thrill_id)
VALUES ('Krentzman', 36, 35, 0, 3, 2);

-- insert ride Huntington into Husky
INSERT INTO rides (name, height_rq, capacity_per_ride, operation_status, park_id, thrill_id)
VALUES ('Huntington', 48, 25, 1, 3, 4 );

-- insert ride Hockey into Husky
INSERT INTO rides (name, height_rq, capacity_per_ride, operation_status, park_id, thrill_id)
VALUES ('Hockey', 36, 30, 1, 3, 3 );

-- create familymembers table
DROP TABLE IF EXISTS `amusement_design`.`familymembers`;
CREATE TABLE `amusement_design`. `familymembers`(
                                                    `id` INT NOT NULL AUTO_INCREMENT,
                                                    `first_name` VARCHAR(45) NOT NULL,
                                                    `last_name` VARCHAR(45) NOT NULL,
                                                    `dob` DATE NOT NULL,
                                                    `account_id` INT NOT NULL,
                                                    PRIMARY KEY (`id`),
                                                    FOREIGN KEY (`account_id`)
                                                        REFERENCES `amusement_design`.`users` (`id`)
                                                        ON DELETE CASCADE
                                                        ON UPDATE CASCADE);

SELECT * FROM familymembers;

-- insert vrushali (ID 2) account
INSERT INTO familymembers (first_name, last_name, dob, account_id)
VALUES ('Brother', 'Tarte', '2009-03-03', 2);

-- insert anirudh (ID 1) account
INSERT INTO familymembers (first_name, last_name, dob, account_id)
VALUES ('Jon', 'Brown', '2000-08-24', 1);

-- insert anirudh (ID 1) account
INSERT INTO familymembers(first_name, last_name, dob, account_id)
VALUES ('Bob', 'Saget', '2005-05-29', 1);

-- insert anirudh (ID 1) account
INSERT INTO familymembers (first_name, last_name, dob, account_id)
VALUES ('Ben', 'Simmons', '1941-03-05', 1);

-- insert roy (ID 3) account
INSERT INTO familymembers (first_name, last_name, dob, account_id)
VALUES ('Li', 'Wang', '2003-12-30', 3);

-- insert roy (ID 3) account
INSERT INTO familymembers (first_name, last_name, dob, account_id)
VALUES ('Alice', 'Wang', '1963-7-14', 3);

-- insert roy (ID 3) account
INSERT INTO familymembers (first_name, last_name, dob, account_id)
VALUES ('Benjamin', 'Wang', '1961-2-27', 3);


-- create passes table

CREATE TABLE `amusement_design`.`passes` (
                                             `id` INT NOT NULL AUTO_INCREMENT,
                                             `price` INT NOT NULL,
                                            `description` VARCHAR(45) NULL,
                                             `start_date` DATE NOT NULL,
                                             `end_date` DATE NOT NULL,
                                             `food_pack` BIT NOT NULL,
                                             `fast_pass` BIT NOT NULL,
                                             `user_id` INT NOT NULL,
                                             `park_id` INT NOT NULL,
                                             `created` DATETIME NULL
                                                 DEFAULT CURRENT_TIMESTAMP,
                                             `updated` DATETIME NULL
                                                 DEFAULT CURRENT_TIMESTAMP
                                                 ON UPDATE CURRENT_TIMESTAMP,
                                             PRIMARY KEY (`id`),
                                             FOREIGN KEY (`user_id`)
                                                 REFERENCES `amusement_design`.`users` (`id`)
                                                 ON DELETE CASCADE
                                                 ON UPDATE CASCADE,
                                             FOREIGN KEY (`park_id`)
                                                 REFERENCES `amusement_design`.`parks` (`id`)
                                                 ON DELETE CASCADE
                                                 ON UPDATE CASCADE);

-- check to see created, empty passes table
SELECT * FROM passes;

-- insert passes into passes table
-- insert vrushali (ID 2) account
INSERT INTO passes (price, start_date, end_date, food_pack, fast_pass, user_id, park_id)
VALUES (35, '2021-04-30', '2021-11-21', 1, 0, 3, 1);

INSERT INTO passes (price, start_date, end_date, food_pack, fast_pass, user_id, park_id)
VALUES (35, '2021-04-30', '2021-11-21', 1, 1, 4, 1);

INSERT INTO passes (price, start_date, end_date, food_pack, fast_pass, user_id, park_id)
VALUES (35, '2021-04-30', '2021-11-21', 1, 1, 2, 1);

-- insert roy (ID 3) account
INSERT INTO passes (price, start_date, end_date, food_pack, fast_pass, user_id, park_id)
VALUES (49, '2021-01-01', '2021-06-30', 1, 1, 1, 2);


UPDATE passes
SET user_id = 3
WHERE id = 2;

UPDATE passes
SET description = "Anirudh Pass"
WHERE user_id = 1;

UPDATE passes
SET description = "Vrushali Pass"
WHERE user_id = 2;

UPDATE passes
SET description = "Roy Pass"
WHERE user_id = 3;

UPDATE passes
SET description = "Christopher Pass"
WHERE user_id = 4;