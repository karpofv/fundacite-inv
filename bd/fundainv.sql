-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.16-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para fundainv
CREATE DATABASE IF NOT EXISTS `fundainv` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `fundainv`;


-- Volcando estructura para tabla fundainv.componente
CREATE TABLE IF NOT EXISTS `componente` (
  `comp_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `comp_fechain` datetime DEFAULT CURRENT_TIMESTAMP,
  `comp_nombre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `comp_descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `comp_marca` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `comp_modelo` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `comp_serial` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `comp_biennac` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `comp_estado` int(2) DEFAULT NULL,
  PRIMARY KEY (`comp_codigo`),
  UNIQUE KEY `comp_serial` (`comp_serial`),
  UNIQUE KEY `comp_biennac` (`comp_biennac`),
  KEY `FK_componente_tools_estatus` (`comp_estado`),
  CONSTRAINT `FK_componente_tools_estatus` FOREIGN KEY (`comp_estado`) REFERENCES `tools_estatus` (`est_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla fundainv.movimientos
CREATE TABLE IF NOT EXISTS `movimientos` (
  `mov_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `mov_fecha` date NOT NULL,
  `mov_compcodigo` int(11) DEFAULT NULL,
  `mov_solicitante` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `mov_solresp` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `mov_motivo` text COLLATE utf8_bin,
  `mov_fechadev` date DEFAULT NULL,
  `mov_respdep` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `mov_perresp` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `mov_entrada` date DEFAULT NULL,
  `mov_salida` date DEFAULT NULL,
  PRIMARY KEY (`mov_codigo`),
  KEY `FK_movimientos_componente` (`mov_compcodigo`),
  CONSTRAINT `FK_movimientos_componente` FOREIGN KEY (`mov_compcodigo`) REFERENCES `componente` (`comp_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla fundainv.m_menu_emp_menj
CREATE TABLE IF NOT EXISTS `m_menu_emp_menj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ConexMenuMaster` int(11) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `menu` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conex` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `funcion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Imagen` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `ancho` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alto` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nivel` text COLLATE utf8_unicode_ci,
  `CA` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CAdmin` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orden` (`orden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla fundainv.m_menu_emp_sub_menj
CREATE TABLE IF NOT EXISTS `m_menu_emp_sub_menj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enlace` int(11) NOT NULL DEFAULT '0',
  `enlacesub` char(3) DEFAULT NULL,
  `Act` char(1) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `menu` varchar(250) DEFAULT NULL,
  `conex` varchar(250) DEFAULT NULL,
  `Url_1` varchar(100) NOT NULL,
  `Url_2` varchar(100) NOT NULL,
  `Url_3` varchar(100) NOT NULL,
  `Url_4` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Url_5` varchar(100) NOT NULL,
  `Url_6` varchar(100) DEFAULT NULL,
  `Url_7` varchar(100) DEFAULT NULL,
  `Url_8` varchar(100) DEFAULT NULL,
  `Url_9` varchar(100) DEFAULT NULL,
  `Url_10` varchar(100) DEFAULT NULL,
  `Inserte` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Updated` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Deleted` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Acciones` varchar(80) NOT NULL,
  `Ejecutar` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `conexd` varchar(200) DEFAULT NULL,
  `funcion` varchar(100) DEFAULT NULL,
  `nivel` text,
  `CA` char(2) DEFAULT NULL,
  `CAdmin` int(1) DEFAULT NULL,
  `CssColor` varchar(50) NOT NULL,
  `CssImagen` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enlace` (`enlace`),
  CONSTRAINT `m_menu_emp_sub_menj_ibfk_1` FOREIGN KEY (`enlace`) REFERENCES `m_menu_emp_menj` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla fundainv.perfiles
CREATE TABLE IF NOT EXISTS `perfiles` (
  `CodPerfil` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CodPerfil`),
  UNIQUE KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla fundainv.perfiles_det
CREATE TABLE IF NOT EXISTS `perfiles_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IdPerfil` int(11) NOT NULL DEFAULT '0',
  `Submenu` int(11) NOT NULL DEFAULT '0',
  `Menu` int(11) NOT NULL DEFAULT '0',
  `S` tinyint(4) NOT NULL,
  `U` tinyint(4) NOT NULL,
  `D` tinyint(4) NOT NULL,
  `I` tinyint(4) NOT NULL,
  `P` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IdPerfil_2` (`IdPerfil`,`Submenu`,`Menu`),
  KEY `IdPerfil` (`IdPerfil`),
  KEY `Submenu` (`Submenu`),
  KEY `Menu` (`Menu`),
  CONSTRAINT `FK_perfiles_det_perfiles` FOREIGN KEY (`IdPerfil`) REFERENCES `perfiles` (`CodPerfil`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `perfiles_det_ibfk_2` FOREIGN KEY (`Menu`) REFERENCES `m_menu_emp_menj` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `perfiles_det_ibfk_3` FOREIGN KEY (`Submenu`) REFERENCES `m_menu_emp_sub_menj` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla fundainv.recargar
CREATE TABLE IF NOT EXISTS `recargar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `actd` int(1) NOT NULL,
  `Accion` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla fundainv.registrados
CREATE TABLE IF NOT EXISTS `registrados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nacionalidad` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Usuario` int(11) NOT NULL,
  `cedula` int(11) NOT NULL DEFAULT '0',
  `Nombres` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Apellidos` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sexo` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `correo` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`),
  CONSTRAINT `FK_registrados_usuarios` FOREIGN KEY (`cedula`) REFERENCES `usuarios` (`Cedula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla fundainv.reparacion
CREATE TABLE IF NOT EXISTS `reparacion` (
  `rep_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `rep_fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `rep_equipo` int(11) DEFAULT NULL,
  `rep_motivo` text COLLATE utf8_bin,
  `rep_respuesta` text COLLATE utf8_bin,
  `rep_fecresp` date DEFAULT NULL,
  `rep_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`rep_codigo`),
  KEY `FK_reparacion_componente` (`rep_equipo`),
  CONSTRAINT `FK_reparacion_componente` FOREIGN KEY (`rep_equipo`) REFERENCES `componente` (`comp_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla fundainv.sexo
CREATE TABLE IF NOT EXISTS `sexo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Sexo';

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla fundainv.tools_estatus
CREATE TABLE IF NOT EXISTS `tools_estatus` (
  `est_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `est_descripcion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`est_codigo`),
  UNIQUE KEY `est_descripcion` (`est_descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla fundainv.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Cedula` int(11) NOT NULL DEFAULT '0',
  `Usuario` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contrasena` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Tipo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Nivel` int(11) DEFAULT NULL,
  `Codigo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Registro` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fecha` datetime NOT NULL,
  `Observacion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Usuario` (`Usuario`),
  UNIQUE KEY `Cedula_2` (`Tipo`,`Cedula`),
  KEY `Tipo` (`Cedula`,`Tipo`,`Usuario`),
  KEY `Cedula` (`Codigo`,`Usuario`,`Cedula`),
  KEY `Nivel` (`Nivel`),
  CONSTRAINT `FK_usuarios_perfiles` FOREIGN KEY (`Nivel`) REFERENCES `perfiles` (`CodPerfil`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
