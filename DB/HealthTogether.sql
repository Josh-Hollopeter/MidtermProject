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
  `photo` VARCHAR(5000) NULL,
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
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `active`, `role`, `birth_date`, `email`, `gender`, `photo`, `create_date`) VALUES (6, 'Apollo', 'Apollo', 'Apollo', 'Creed', 1, 'USER', NULL, NULL, NULL, NULL, NULL);
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
INSERT INTO `activity` (`id`, `title`, `description`, `image`) VALUES (3, 'Yoga', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5PZtrm5OjgVC2YgYY617AyZ5MlzXMDFNNrpQhYm1qn-QfLZ0d&s');
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

