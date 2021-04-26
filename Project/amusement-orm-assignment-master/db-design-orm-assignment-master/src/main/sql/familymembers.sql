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