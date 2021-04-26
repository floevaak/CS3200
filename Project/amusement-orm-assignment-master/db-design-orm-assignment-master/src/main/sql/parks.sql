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