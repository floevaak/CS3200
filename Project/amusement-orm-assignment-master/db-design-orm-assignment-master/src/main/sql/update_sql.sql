ALTER TABLE passes
    ADD COLUMN description VARCHAR(45) AFTER id;

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

ALTER TABLE `amusement_design`.`passes`
    CHANGE COLUMN `food_pack` `food_pack` BIT(1) NOT NULL DEFAULT 0 ,
    CHANGE COLUMN `fast_pass` `fast_pass` BIT(1) NOT NULL DEFAULT 0 ;
