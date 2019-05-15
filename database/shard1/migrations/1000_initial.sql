CREATE TABLE IF NOT EXISTS `foo`.`users` (
  `id` int(11) NOT NULL auto_increment,
  `first_name` VARCHAR(18) NOT NULL,
  `last_name` VARCHAR(32) NOT NULL
  PRIMARY KEY (`id`));