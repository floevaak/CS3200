-- create rides table
DROP TABLE IF EXISTS `amusement_design`.`rides`;
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
                                                REFERENCES `amusement_design`.`factors` (`id`)
                                                ON DELETE CASCADE
                                                ON UPDATE CASCADE);