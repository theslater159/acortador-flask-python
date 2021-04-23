-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para dbflask
CREATE DATABASE IF NOT EXISTS `dbflask` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbflask`;

-- Volcando estructura para tabla dbflask.urls_sht
CREATE TABLE IF NOT EXISTS `urls_sht` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url_shorten` varchar(5) DEFAULT NULL,
  `url_to_shorten` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idurls_sht_UNIQUE` (`id`),
  KEY `user_idx` (`user_id`),
  CONSTRAINT `urls` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbflask.urls_sht: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `urls_sht` DISABLE KEYS */;
INSERT INTO `urls_sht` (`id`, `url_shorten`, `url_to_shorten`, `user_id`) VALUES
	(4, 'u49Wk', 'https://uniwebsidad.com/libros/django-1-0/capitulo-1/el-patron-de-diseno-mvc', NULL),
	(5, 'FlOH7', 'https://ubunlog.com/ubuntu-vs-mac-que-sistema-operativo-es-mejor/', NULL),
	(6, 'hJ1Tc', 'https://www.youtube.com/watch?v=_SpBVILoQoE', 1),
	(7, 'B6z8x', 'https://github.com/uber/h3-py', NULL),
	(8, 'Hvf9J', 'https://www.youtube.com/watch?v=YtKTyFNbE58', 2),
	(9, 'xSDQJ', 'https://codigofacilito.com/articulos/por-que-flask', 1),
	(10, 'zchWv', 'https://github.com/uber/h3-py', NULL);
/*!40000 ALTER TABLE `urls_sht` ENABLE KEYS */;

-- Volcando estructura para tabla dbflask.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idusers_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin2;

-- Volcando datos para la tabla dbflask.users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `user`, `email`, `password`) VALUES
	(1, 'brayanrojas', 'brs1996201@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(2, 'brayanrojas2', 'brs1996202@gmail.com', 'fcea920f7412b5da7be0cf42b8c93759');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
