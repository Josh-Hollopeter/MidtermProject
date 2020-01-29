-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema healthtogetherdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `healthtogetherdb` ;

-- -----------------------------------------------------
-- Schema healthtogetherdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `healthtogetherdb` DEFAULT CHARACTER SET utf8 ;
USE `healthtogetherdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `active` TINYINT(4) NOT NULL DEFAULT '1',
  `role` VARCHAR(45) NULL DEFAULT NULL,
  `birth_date` DATE NULL,
  `email` VARCHAR(100) NULL,
  `gender` VARCHAR(45) NULL,
  `photo` TEXT NULL,
  `create_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip_code` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_location_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_location_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity` ;

CREATE TABLE IF NOT EXISTS `activity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `image` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `workout`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `workout` ;

CREATE TABLE IF NOT EXISTS `workout` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `creator_id` INT NOT NULL,
  `workout_date` DATE NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `workout_time` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `post_date` DATETIME NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  `activity_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_workout_activity1_idx` (`activity_id` ASC),
  CONSTRAINT `fk_workout_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_activity1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_workout`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_workout` ;

CREATE TABLE IF NOT EXISTS `user_workout` (
  `user_id` INT(11) NOT NULL,
  `workout_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `workout_id`),
  INDEX `fk_user_has_workout_workout1_idx` (`workout_id` ASC),
  INDEX `fk_user_has_workout_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_workout_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_workout_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `workout_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `workout_comment` ;

CREATE TABLE IF NOT EXISTS `workout_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` TEXT NULL,
  `post_date` DATETIME NULL,
  `user_id` INT NOT NULL,
  `workout_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_workout_comment_workout1_idx` (`workout_id` ASC),
  INDEX `fk_workout_comment_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_workout_comment_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_comment_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS healthappuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'healthappuser'@'localhost' IDENTIFIED BY 'healthappuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'healthappuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `healthtogetherdb`;
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `active`, `role`, `birth_date`, `email`, `gender`, `photo`, `create_date`) VALUES (1, 'admin', 'admin', NULL, NULL, 1, 'ADMIN', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `active`, `role`, `birth_date`, `email`, `gender`, `photo`, `create_date`) VALUES (2, 'Mike', 'Mike', 'Mike', 'Tyson', 1, 'USER', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `active`, `role`, `birth_date`, `email`, `gender`, `photo`, `create_date`) VALUES (3, 'Ivan', 'Ivan', 'Ivan', 'Drago', 1, 'USER', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `active`, `role`, `birth_date`, `email`, `gender`, `photo`, `create_date`) VALUES (4, 'Rocky', 'Rocky', 'Rocky', 'Balboa', 1, 'USER', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `active`, `role`, `birth_date`, `email`, `gender`, `photo`, `create_date`) VALUES (5, 'Tommy', 'Tommy', 'Tommy', 'Guns', 1, 'USER', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `active`, `role`, `birth_date`, `email`, `gender`, `photo`, `create_date`) VALUES (6, 'Apollo', 'Apollo', 'Apollo', 'Creed', 1, 'USER', NULL, NULL, NULL, 'data:image/jpeg;base64,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', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `active`, `role`, `birth_date`, `email`, `gender`, `photo`, `create_date`) VALUES (7, 'Clubber', 'Clubber', 'Clubber', 'Lang', 1, 'USER', NULL, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `healthtogetherdb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (1, 'Boxing Way', 'Boxsylvania', 'Colorado', 35353);

COMMIT;


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `healthtogetherdb`;
INSERT INTO `location` (`id`, `name`, `address_id`) VALUES (1, 'The Boxing Gym', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `healthtogetherdb`;
INSERT INTO `activity` (`id`, `title`, `description`, `image`) VALUES (1, 'Boxing', NULL, 'https://media.gettyimages.com/photos/mike-tyson-stands-in-the-ring-during-the-fight-with-carl-williams-at-picture-id51763505');
INSERT INTO `activity` (`id`, `title`, `description`, `image`) VALUES (2, 'Running', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZeXwYvR57vFLvyzzhajY8-4GjQidZmakwdsqe2VQHxbtrzggG&s');
INSERT INTO `activity` (`id`, `title`, `description`, `image`) VALUES (3, 'Yoga', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTulJO7K3niMul1CKE2Ay6Y8yxCA7L6ZEXqICWV7QoyVrTmoPhQ&s');
INSERT INTO `activity` (`id`, `title`, `description`, `image`) VALUES (4, 'Weight Lifting', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDQCQdzMaeX9ArfHfbeOQdj8hCvHOb05atvgTa7vPO4wQAeIqXKw&s');
INSERT INTO `activity` (`id`, `title`, `description`, `image`) VALUES (5, 'Hiking', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlzr4K_RBhWqfWTriyc8AeDqfe2fJ1VeBAnE_KBXxqOBy8mXjEKA&s');
INSERT INTO `activity` (`id`, `title`, `description`, `image`) VALUES (6, 'Snowboarding', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkCgAUUFbe9dEVpjqEoG49DS6bcIzP0pKIN51MZhoc2bj8FvCV&s');
INSERT INTO `activity` (`id`, `title`, `description`, `image`) VALUES (7, 'Roller Blading', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThAfec1ml3Ij41cS3eyzGzINNZmA-1LV-PGZqTPGRW6a4-wAJx&s');
INSERT INTO `activity` (`id`, `title`, `description`, `image`) VALUES (8, 'Ice Skating', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_WuUcBGdHnyGBB5T4JmqInb-EQ8VPCTTgZc2bef06V5Ewuowd&s');
INSERT INTO `activity` (`id`, `title`, `description`, `image`) VALUES (9, 'Tai Chi', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsECKbNiC5LjJNG-qVa_J6r_0ThhdjoLOCL0qg77RWklPl6f1m&s');

COMMIT;


-- -----------------------------------------------------
-- Data for table `workout`
-- -----------------------------------------------------
START TRANSACTION;
USE `healthtogetherdb`;
INSERT INTO `workout` (`id`, `creator_id`, `workout_date`, `title`, `workout_time`, `description`, `post_date`, `active`, `activity_id`, `location_id`) VALUES (1, 2, '2020-11-11', 'Boxing with friends', NULL, 'Freinds punching each other in the face. Is fun?', NULL, 1, 1, 1);
INSERT INTO `workout` (`id`, `creator_id`, `workout_date`, `title`, `workout_time`, `description`, `post_date`, `active`, `activity_id`, `location_id`) VALUES (2, 3, '2020-11-11', 'I Will Break You', NULL, 'Calling Rocky out!', NULL, 1, 1, 1);
INSERT INTO `workout` (`id`, `creator_id`, `workout_date`, `title`, `workout_time`, `description`, `post_date`, `active`, `activity_id`, `location_id`) VALUES (3, 4, '2020-11-11', 'Tiger Eye', NULL, 'Bahmp Bahmp Bahmp', NULL, 1, 1, 1);
INSERT INTO `workout` (`id`, `creator_id`, `workout_date`, `title`, `workout_time`, `description`, `post_date`, `active`, `activity_id`, `location_id`) VALUES (4, 5, '2020-11-11', 'Tommy in the Streets', NULL, 'Suzie in the Sheets', NULL, 1, 1, 1);
INSERT INTO `workout` (`id`, `creator_id`, `workout_date`, `title`, `workout_time`, `description`, `post_date`, `active`, `activity_id`, `location_id`) VALUES (5, 6, '2020-11-11', 'There is no Tomorrow', NULL, 'I\'ve been running down beaches all week in prep', NULL, 1, 1, 1);
INSERT INTO `workout` (`id`, `creator_id`, `workout_date`, `title`, `workout_time`, `description`, `post_date`, `active`, `activity_id`, `location_id`) VALUES (6, 7, '2020-11-11', 'I pity the Foo', NULL, 'Roller Derby King ', NULL, 1, 7, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `workout_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `healthtogetherdb`;
INSERT INTO `workout_comment` (`id`, `comment`, `post_date`, `user_id`, `workout_id`) VALUES (1, 'Words about stuff', NULL, 2, 1);
INSERT INTO `workout_comment` (`id`, `comment`, `post_date`, `user_id`, `workout_id`) VALUES (2, 'Words about more stuff', NULL, 3, 3);

COMMIT;

