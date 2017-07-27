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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1;

-- Volcando datos para la tabla fundainv.componente: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `componente` DISABLE KEYS */;
INSERT INTO `componente` (`comp_codigo`, `comp_fechain`, `comp_nombre`, `comp_descripcion`, `comp_marca`, `comp_modelo`, `comp_serial`, `comp_biennac`, `comp_estado`) VALUES
	(5, '2017-07-08 18:22:46', 'a165as1d65', '5a1sd65as16', '5s1a6d51a', '651s65d1a6', '651', 'dfsd1f65', 3);
/*!40000 ALTER TABLE `componente` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla fundainv.movimientos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` (`mov_codigo`, `mov_fecha`, `mov_compcodigo`, `mov_solicitante`, `mov_solresp`, `mov_motivo`, `mov_fechadev`, `mov_respdep`, `mov_perresp`, `mov_entrada`, `mov_salida`) VALUES
	(1, '2017-07-11', 5, 'saasdasd', 'asda', 'sdasd', '2017-07-08', 'asdasdasd', 'asdasd', '2017-07-06', '2017-07-07');
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla fundainv.m_menu_emp_menj: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `m_menu_emp_menj` DISABLE KEYS */;
INSERT INTO `m_menu_emp_menj` (`id`, `ConexMenuMaster`, `orden`, `menu`, `conex`, `funcion`, `Imagen`, `ancho`, `alto`, `nivel`, `CA`, `CAdmin`) VALUES
	(54, NULL, NULL, 'Administrador', 'menu.php', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(77, NULL, NULL, 'Equipos', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `m_menu_emp_menj` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla fundainv.m_menu_emp_sub_menj: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `m_menu_emp_sub_menj` DISABLE KEYS */;
INSERT INTO `m_menu_emp_sub_menj` (`id`, `enlace`, `enlacesub`, `Act`, `orden`, `menu`, `conex`, `Url_1`, `Url_2`, `Url_3`, `Url_4`, `Url_5`, `Url_6`, `Url_7`, `Url_8`, `Url_9`, `Url_10`, `Inserte`, `Updated`, `Deleted`, `Acciones`, `Ejecutar`, `conexd`, `funcion`, `nivel`, `CA`, `CAdmin`, `CssColor`, `CssImagen`) VALUES
	(55, 54, NULL, NULL, NULL, 'Asignar Usuarios', 'menu.php', 'conf_usuario/crear_usuario.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(110, 54, NULL, NULL, NULL, 'Administrar Perfiles', 'menu.php', 'admin_perfil/conf_perfil.php', 'admin_perfil/conf_menu_list.php', 'admin_perfil/conf_menu_accion.php', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(161, 77, NULL, NULL, 1, 'Registrar equipo', NULL, 'sistema/equipo/equipo.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(163, 77, NULL, NULL, 2, 'Buscar equipo', NULL, 'sistema/equipo/buscar.php', 'sistema/equipo/reparar.php', 'sistema/equipo/movimiento.php', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(164, 77, NULL, NULL, 4, 'Reparaciones', NULL, 'sistema/solicitar/reparar.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(166, 77, NULL, NULL, 3, 'Movimientos', NULL, 'sistema/movimiento/movimiento.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(168, 77, NULL, NULL, NULL, 'Buscar equipo', NULL, 'sistema/equipo/buscar2.php', 'sistema/equipo/reparar.php', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '');
/*!40000 ALTER TABLE `m_menu_emp_sub_menj` ENABLE KEYS */;


-- Volcando estructura para tabla fundainv.perfiles
CREATE TABLE IF NOT EXISTS `perfiles` (
  `CodPerfil` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CodPerfil`),
  UNIQUE KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla fundainv.perfiles: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` (`CodPerfil`, `Nombre`) VALUES
	(1, 'Administrador'),
	(2, 'god'),
	(3, 'operador');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla fundainv.perfiles_det: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `perfiles_det` DISABLE KEYS */;
INSERT INTO `perfiles_det` (`id`, `IdPerfil`, `Submenu`, `Menu`, `S`, `U`, `D`, `I`, `P`) VALUES
	(1, 1, 110, 54, 0, 1, 1, 1, 1),
	(113, 1, 55, 54, 1, 1, 1, 1, 1),
	(225, 2, 110, 54, 1, 1, 1, 1, 1),
	(226, 2, 55, 54, 1, 1, 1, 1, 1),
	(236, 2, 163, 77, 1, 1, 1, 1, 1),
	(237, 2, 166, 77, 1, 1, 1, 1, 1),
	(238, 2, 164, 77, 1, 1, 1, 1, 1),
	(239, 2, 161, 77, 1, 1, 1, 1, 1),
	(256, 1, 163, 77, 1, 1, 1, 1, 1),
	(257, 1, 166, 77, 1, 1, 1, 1, 1),
	(258, 1, 161, 77, 1, 1, 1, 1, 1),
	(259, 1, 164, 77, 1, 1, 1, 1, 1),
	(276, 3, 163, 77, 0, 0, 0, 0, 0),
	(277, 3, 166, 77, 0, 0, 0, 0, 0),
	(278, 3, 161, 77, 0, 0, 0, 0, 0),
	(279, 3, 164, 77, 0, 0, 0, 0, 0),
	(288, 3, 168, 77, 1, 0, 0, 1, 0);
/*!40000 ALTER TABLE `perfiles_det` ENABLE KEYS */;


-- Volcando estructura para tabla fundainv.recargar
CREATE TABLE IF NOT EXISTS `recargar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `actd` int(1) NOT NULL,
  `Accion` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla fundainv.recargar: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `recargar` DISABLE KEYS */;
INSERT INTO `recargar` (`id`, `URL`, `actd`, `Accion`) VALUES
	(1, 'uploader/receiver.php', 0, ''),
	(2, 'recargar/recargar.php', 0, ''),
	(3, 'recargar/recargar.php', 0, ''),
	(4, 'sistema/documentos/selectorAnual.php', 0, ''),
	(5, 'sistema/documentos/selectorMes.php', 0, ''),
	(351, 'sistema/index.php', 0, ''),
	(352, 'recargar/recargar.php', 1, ''),
	(353, 'sistema/reportes/pdf_constancia.php', 0, '');
/*!40000 ALTER TABLE `recargar` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla fundainv.registrados: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `registrados` DISABLE KEYS */;
INSERT INTO `registrados` (`id`, `nacionalidad`, `Usuario`, `cedula`, `Nombres`, `Apellidos`, `sexo`, `correo`) VALUES
	(5, '', 0, 12345, 'GOD', 'GOD', '', ''),
	(6, '', 0, 123123, 'admin', 'admin', '', ''),
	(7, '', 0, 123321, 'operadores', 'operadores', '', '');
/*!40000 ALTER TABLE `registrados` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla fundainv.reparacion: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `reparacion` DISABLE KEYS */;
INSERT INTO `reparacion` (`rep_codigo`, `rep_fecha`, `rep_equipo`, `rep_motivo`, `rep_respuesta`, `rep_fecresp`, `rep_status`) VALUES
	(1, '2017-07-11 20:03:36', 5, 'SE DAÑO', NULL, NULL, 3);
/*!40000 ALTER TABLE `reparacion` ENABLE KEYS */;


-- Volcando estructura para tabla fundainv.sexo
CREATE TABLE IF NOT EXISTS `sexo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Sexo';

-- Volcando datos para la tabla fundainv.sexo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` (`id`, `Nombre`) VALUES
	(1, 'Masculino'),
	(2, 'Femenino');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;


-- Volcando estructura para tabla fundainv.tools_estatus
CREATE TABLE IF NOT EXISTS `tools_estatus` (
  `est_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `est_descripcion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`est_codigo`),
  UNIQUE KEY `est_descripcion` (`est_descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla fundainv.tools_estatus: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tools_estatus` DISABLE KEYS */;
INSERT INTO `tools_estatus` (`est_codigo`, `est_descripcion`) VALUES
	(2, 'ACTIVO'),
	(4, 'DAÑADO'),
	(3, 'EN MANTENIMIENTO'),
	(1, 'INACTIVO');
/*!40000 ALTER TABLE `tools_estatus` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1;

-- Volcando datos para la tabla fundainv.usuarios: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `Cedula`, `Usuario`, `contrasena`, `Tipo`, `Nivel`, `Codigo`, `Registro`, `Fecha`, `Observacion`) VALUES
	(1, 123321, 'operador', '06d4f07c943a4da1c8bfe591abbc3579', 'Empleado', 3, 'bb1e6', NULL, '0000-00-00 00:00:00', NULL),
	(2, 123123, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Empleado', 1, '34d38', NULL, '0000-00-00 00:00:00', NULL),
	(3, 12345, 'GOD', 'a1b995eb2627f17bfd5fcb1de8533c62', 'Empleado', 2, '2c48a', NULL, '0000-00-00 00:00:00', NULL),
	(4, 12345, '', '', '', NULL, '2c48a', NULL, '0000-00-00 00:00:00', NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
