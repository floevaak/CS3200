-- create users table
DROP TABLE IF EXISTS `amusement_design`.`users`;
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