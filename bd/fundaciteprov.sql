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

-- Volcando estructura de base de datos para fundacite-prov
CREATE DATABASE IF NOT EXISTS `fundacite-prov` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `fundacite-prov`;


-- Volcando estructura para tabla fundacite-prov.m_menu_emp_menj
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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla fundacite-prov.m_menu_emp_menj: ~4 rows (aproximadamente)
DELETE FROM `m_menu_emp_menj`;
/*!40000 ALTER TABLE `m_menu_emp_menj` DISABLE KEYS */;
INSERT INTO `m_menu_emp_menj` (`id`, `ConexMenuMaster`, `orden`, `menu`, `conex`, `funcion`, `Imagen`, `ancho`, `alto`, `nivel`, `CA`, `CAdmin`) VALUES
	(54, NULL, NULL, 'Administrador', 'menu.php', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(76, NULL, NULL, 'Proveedores', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL),
	(77, NULL, NULL, 'Tus Datos', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL),
	(78, NULL, NULL, 'Consultar', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `m_menu_emp_menj` ENABLE KEYS */;


-- Volcando estructura para tabla fundacite-prov.m_menu_emp_sub_menj
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
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla fundacite-prov.m_menu_emp_sub_menj: ~8 rows (aproximadamente)
DELETE FROM `m_menu_emp_sub_menj`;
/*!40000 ALTER TABLE `m_menu_emp_sub_menj` DISABLE KEYS */;
INSERT INTO `m_menu_emp_sub_menj` (`id`, `enlace`, `enlacesub`, `Act`, `orden`, `menu`, `conex`, `Url_1`, `Url_2`, `Url_3`, `Url_4`, `Url_5`, `Url_6`, `Url_7`, `Url_8`, `Url_9`, `Url_10`, `Inserte`, `Updated`, `Deleted`, `Acciones`, `Ejecutar`, `conexd`, `funcion`, `nivel`, `CA`, `CAdmin`, `CssColor`, `CssImagen`) VALUES
	(55, 54, NULL, NULL, NULL, 'Asignar Usuarios', 'menu.php', 'conf_usuario/crear_usuario.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(110, 54, NULL, NULL, NULL, 'Administrar Perfiles', 'menu.php', 'admin_perfil/conf_perfil.php', 'admin_perfil/conf_menu_list.php', 'admin_perfil/conf_menu_accion.php', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(160, 76, NULL, NULL, NULL, 'Proveedor', NULL, 'sistema/proveedor/proveedor.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(161, 77, NULL, NULL, 3, 'Tus Categorías', NULL, 'sistema/categoria/categoria.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(163, 77, NULL, NULL, 4, 'Tus Productos', NULL, 'sistema/producto/producto.php', 'sistema/producto/fotoprod.php', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(165, 77, NULL, NULL, 2, 'Tu Perfil', NULL, 'sistema/resena/resena.php', 'sistema/resena/fotologo.php', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(167, 78, NULL, NULL, NULL, 'Productos', NULL, 'sistema/consulta/producto.php', 'sistema/consulta/foto.php', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(168, 78, NULL, NULL, NULL, 'Proveedores', NULL, 'sistema/consulta/proveedor.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(170, 77, NULL, NULL, 1, 'Datos Generales', NULL, 'sistema/proveedor/proveedor.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '');
/*!40000 ALTER TABLE `m_menu_emp_sub_menj` ENABLE KEYS */;


-- Volcando estructura para tabla fundacite-prov.perfiles
CREATE TABLE IF NOT EXISTS `perfiles` (
  `CodPerfil` int(11) NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CodPerfil`),
  UNIQUE KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla fundacite-prov.perfiles: ~3 rows (aproximadamente)
DELETE FROM `perfiles`;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` (`CodPerfil`, `Nombre`) VALUES
	(1, 'Administrador'),
	(2, 'god'),
	(3, 'operador');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;


-- Volcando estructura para tabla fundacite-prov.perfiles_det
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
  CONSTRAINT `perfiles_det_ibfk_1` FOREIGN KEY (`IdPerfil`) REFERENCES `perfiles` (`CodPerfil`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `perfiles_det_ibfk_2` FOREIGN KEY (`Menu`) REFERENCES `m_menu_emp_menj` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `perfiles_det_ibfk_3` FOREIGN KEY (`Submenu`) REFERENCES `m_menu_emp_sub_menj` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla fundacite-prov.perfiles_det: ~20 rows (aproximadamente)
DELETE FROM `perfiles_det`;
/*!40000 ALTER TABLE `perfiles_det` DISABLE KEYS */;
INSERT INTO `perfiles_det` (`id`, `IdPerfil`, `Submenu`, `Menu`, `S`, `U`, `D`, `I`, `P`) VALUES
	(1, 1, 110, 54, 0, 1, 1, 0, 1),
	(113, 1, 55, 54, 1, 1, 1, 1, 1),
	(225, 2, 110, 54, 1, 1, 1, 1, 1),
	(226, 2, 55, 54, 1, 1, 1, 1, 1),
	(235, 3, 160, 76, 0, 1, 0, 1, 0),
	(237, 2, 160, 76, 1, 1, 1, 1, 1),
	(240, 1, 160, 76, 1, 1, 1, 0, 1),
	(241, 1, 167, 78, 1, 0, 0, 0, 0),
	(242, 1, 168, 78, 1, 0, 0, 0, 0),
	(243, 1, 165, 77, 0, 0, 0, 0, 0),
	(244, 1, 161, 77, 0, 0, 0, 0, 0),
	(245, 1, 163, 77, 0, 0, 0, 0, 0),
	(251, 3, 165, 77, 1, 0, 0, 0, 0),
	(252, 3, 163, 77, 1, 0, 0, 0, 0),
	(253, 3, 161, 77, 1, 0, 0, 0, 0),
	(254, 2, 165, 77, 1, 0, 0, 0, 0),
	(255, 2, 161, 77, 1, 0, 0, 0, 0),
	(256, 2, 163, 77, 1, 0, 0, 0, 0),
	(257, 2, 168, 78, 1, 0, 0, 0, 0),
	(258, 2, 167, 78, 1, 0, 0, 0, 0),
	(259, 3, 170, 77, 0, 0, 0, 1, 0),
	(260, 1, 170, 77, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `perfiles_det` ENABLE KEYS */;


-- Volcando estructura para tabla fundacite-prov.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `prod_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `prod_provccodigo` int(11) DEFAULT NULL,
  `prod_nombre` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `prod_descripcion` text COLLATE utf8_bin,
  `prod_precio` decimal(10,2) DEFAULT NULL,
  `prod_tipoventa` int(11) DEFAULT NULL,
  PRIMARY KEY (`prod_codigo`),
  KEY `FK_productos_provee_catego` (`prod_provccodigo`),
  KEY `FK_productos_tool_tipoventa` (`prod_tipoventa`),
  CONSTRAINT `FK_productos_provee_catego` FOREIGN KEY (`prod_provccodigo`) REFERENCES `provee_catego` (`provc_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_productos_tool_tipoventa` FOREIGN KEY (`prod_tipoventa`) REFERENCES `tool_tipoventa` (`tipv_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla fundacite-prov.productos: ~0 rows (aproximadamente)
DELETE FROM `productos`;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`prod_codigo`, `prod_provccodigo`, `prod_nombre`, `prod_descripcion`, `prod_precio`, `prod_tipoventa`) VALUES
	(5, 3, 'Despierta ese sabor que te gusta dar ', 'Aceite extra - refinado vegetal ideal para freir porque los alimentos no lo absorben, y para resaltar el sabor de las comidas. Vatel es la marca líder con más de 50 años en el mercado venezolano.', 200.00, 1),
	(6, 3, 'asda', 'sdasdasdas', 300.00, 1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;


-- Volcando estructura para tabla fundacite-prov.producto_imagen
CREATE TABLE IF NOT EXISTS `producto_imagen` (
  `prodi_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `prodi_procodigo` int(11) DEFAULT NULL,
  `prodi_imagen` text COLLATE utf8_bin,
  PRIMARY KEY (`prodi_codigo`),
  KEY `FK__productos` (`prodi_procodigo`),
  CONSTRAINT `FK__productos` FOREIGN KEY (`prodi_procodigo`) REFERENCES `productos` (`prod_codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla fundacite-prov.producto_imagen: ~0 rows (aproximadamente)
DELETE FROM `producto_imagen`;
/*!40000 ALTER TABLE `producto_imagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_imagen` ENABLE KEYS */;


-- Volcando estructura para tabla fundacite-prov.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `prov_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `prov_nit` int(11) DEFAULT NULL,
  `prov_razon` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `prov_resena` text COLLATE utf8_bin,
  `prov_direccion` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `prov_email` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `prov_telefono` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `prov_sitioweb` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `prov_rubro` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `prov_status` varchar(150) COLLATE utf8_bin DEFAULT '0',
  PRIMARY KEY (`prov_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla fundacite-prov.proveedor: ~1 rows (aproximadamente)
DELETE FROM `proveedor`;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` (`prov_codigo`, `prov_nit`, `prov_razon`, `prov_resena`, `prov_direccion`, `prov_email`, `prov_telefono`, `prov_sitioweb`, `prov_rubro`, `prov_status`) VALUES
	(9, 19191490, 'CARGIL.CA', 'Cargill proporciona alimentos, productos y servicios agrícolas, financieros e industriales a todo el mundo. Colaborando estrechamente  con los agricultores,  clientes, gobiernos y comunidades, ayudamos a las personas a progresar al aplicar nuestros conocimientos de 150 años de experiencia. Contamos con 150 000 empleados en 70 países que están comprometidos con la idea de alimentar al mundo de una forma responsable, a  reducir el impacto medioambiental y mejorar las comunidades en las que vivimos y trabajamos.', 'Barrio La paz, Sector I, calle 5, casa 113', 'karpofv.89@gmail.com', '04124289537', 'carrito.com', 'venta de carros', '1');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;


-- Volcando estructura para tabla fundacite-prov.provee_catego
CREATE TABLE IF NOT EXISTS `provee_catego` (
  `provc_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `provc_provcodigo` int(11) DEFAULT NULL,
  `provc_categoria` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`provc_codigo`),
  UNIQUE KEY `provc_provcodigo` (`provc_categoria`,`provc_provcodigo`),
  KEY `FK_provee_catego_proveedor` (`provc_provcodigo`),
  CONSTRAINT `FK_provee_catego_proveedor` FOREIGN KEY (`provc_provcodigo`) REFERENCES `proveedor` (`prov_codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla fundacite-prov.provee_catego: ~0 rows (aproximadamente)
DELETE FROM `provee_catego`;
/*!40000 ALTER TABLE `provee_catego` DISABLE KEYS */;
INSERT INTO `provee_catego` (`provc_codigo`, `provc_provcodigo`, `provc_categoria`) VALUES
	(3, 9, 'Aceites y grasa');
/*!40000 ALTER TABLE `provee_catego` ENABLE KEYS */;


-- Volcando estructura para tabla fundacite-prov.recargar
CREATE TABLE IF NOT EXISTS `recargar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `actd` int(1) NOT NULL,
  `Accion` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla fundacite-prov.recargar: ~8 rows (aproximadamente)
DELETE FROM `recargar`;
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


-- Volcando estructura para tabla fundacite-prov.registrados
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
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla fundacite-prov.registrados: ~4 rows (aproximadamente)
DELETE FROM `registrados`;
/*!40000 ALTER TABLE `registrados` DISABLE KEYS */;
INSERT INTO `registrados` (`id`, `nacionalidad`, `Usuario`, `cedula`, `Nombres`, `Apellidos`, `sexo`, `correo`) VALUES
	(1, '', 0, 12345, 'laya', 'juan', '', ''),
	(2, '', 0, 21589306, 'Maria', 'Fernandez', '', ''),
	(3, '', 0, 19191493, 'gabriel', 'rojas', '', ''),
	(4, '', 0, 19191492, 'sadasd', 'asdas', '', '');
/*!40000 ALTER TABLE `registrados` ENABLE KEYS */;


-- Volcando estructura para tabla fundacite-prov.sexo
CREATE TABLE IF NOT EXISTS `sexo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Sexo';

-- Volcando datos para la tabla fundacite-prov.sexo: ~2 rows (aproximadamente)
DELETE FROM `sexo`;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` (`id`, `Nombre`) VALUES
	(1, 'Masculino'),
	(2, 'Femenino');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;


-- Volcando estructura para tabla fundacite-prov.tool_tipoventa
CREATE TABLE IF NOT EXISTS `tool_tipoventa` (
  `tipv_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `tipv_descripcion` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`tipv_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla fundacite-prov.tool_tipoventa: ~2 rows (aproximadamente)
DELETE FROM `tool_tipoventa`;
/*!40000 ALTER TABLE `tool_tipoventa` DISABLE KEYS */;
INSERT INTO `tool_tipoventa` (`tipv_codigo`, `tipv_descripcion`) VALUES
	(1, 'DETAL'),
	(2, 'MAYOR');
/*!40000 ALTER TABLE `tool_tipoventa` ENABLE KEYS */;


-- Volcando estructura para tabla fundacite-prov.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Cedula` int(11) NOT NULL DEFAULT '0',
  `Usuario` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Nombres` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Apellidos` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contrasena` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `CodSede` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tipo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Nivel` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Stilo` int(1) NOT NULL,
  `theme_color` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Codigo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Registro` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fecha` datetime NOT NULL,
  `Observacion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Usuario` (`Usuario`),
  UNIQUE KEY `Cedula_2` (`Tipo`,`Cedula`),
  KEY `Tipo` (`Cedula`,`Tipo`,`Usuario`),
  KEY `Cedula` (`Codigo`,`Usuario`,`Cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla fundacite-prov.usuarios: ~5 rows (aproximadamente)
DELETE FROM `usuarios`;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `Cedula`, `Usuario`, `Nombres`, `Apellidos`, `contrasena`, `CodSede`, `Tipo`, `Nivel`, `Stilo`, `theme_color`, `Codigo`, `Registro`, `Fecha`, `Observacion`) VALUES
	(25, 12345, 'GOD', '', '', 'a1b995eb2627f17bfd5fcb1de8533c62', NULL, 'Empleado', '2', 0, '', 'f29e8', NULL, '0000-00-00 00:00:00', NULL),
	(74, 8573655, 'laya', '', '', 'a1b995eb2627f17bfd5fcb1de8533c62', NULL, 'Empleado', '1', 0, '', '4d0ed', NULL, '0000-00-00 00:00:00', NULL),
	(82, 12345, '', '', '', '', NULL, '', NULL, 0, '', 'f29e8', NULL, '0000-00-00 00:00:00', NULL),
	(92, 19191490, 'carrito', '', '', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 'Empleado', '3', 0, '', 'b413c', '1', '2017-06-04 19:01:15', NULL),
	(108, 123123, 'admin', 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL, 'Empleado', '1', 0, '', '34a57', NULL, '0000-00-00 00:00:00', NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
