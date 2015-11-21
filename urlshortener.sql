SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `stats` (
`id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  `clickdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(100) NOT NULL,
  `referer` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `urls` (
`id` int(11) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `segment` varchar(15) NOT NULL,
  `datetime_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(25) NOT NULL,
  `num_of_clicks` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `stats`
 ADD PRIMARY KEY (`id`), ADD KEY `url_id` (`url_id`);

ALTER TABLE `urls`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `segment` (`segment`);

ALTER TABLE `stats`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `urls`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `stats`
ADD CONSTRAINT `stats_ibfk_1` FOREIGN KEY (`url_id`) REFERENCES `urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;