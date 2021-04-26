-- create passes table
DROP TABLE IF EXISTS `amusement_design`.`passes`;
CREATE TABLE `amusement_design`.`passes` (
                                             `id` INT NOT NULL AUTO_INCREMENT,
                                             `price` INT NOT NULL,
                                             `start_date` DATE NULL,
                                             `end_date` DATE NULL,
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