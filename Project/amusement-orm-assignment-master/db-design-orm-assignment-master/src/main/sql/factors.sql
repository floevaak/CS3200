-- create factors portable enumeration
DROP TABLE IF EXISTS `amusement_design`.`factors`;
CREATE TABLE `amusement_design`.`factors`(
                                             `id` INT NOT NULL AUTO_INCREMENT,
                                             `name` VARCHAR(45) NOT NULL,
                                             PRIMARY KEY (`id`));