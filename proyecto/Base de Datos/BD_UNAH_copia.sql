-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: BD_UNAH
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Alumnos`
--

DROP TABLE IF EXISTS `Alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alumnos` (
  `codigo_alumno` int(11) NOT NULL AUTO_INCREMENT,
  `numero_cuenta` varchar(20) NOT NULL,
  `promedio` decimal(10,0) NOT NULL,
  `codigo_persona` int(11) NOT NULL,
  `contrasenia` varchar(45) NOT NULL,
  `codigo_tipo_empleado` int(11) NOT NULL,
  `foto` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo_alumno`,`codigo_tipo_empleado`),
  KEY `fk_Alumnos_Tipo_Empleados1_idx` (`codigo_tipo_empleado`),
  KEY `fk_Alumnos_Personas1_idx` (`codigo_persona`),
  CONSTRAINT `fk_Alumnos_Personas1` FOREIGN KEY (`codigo_persona`) REFERENCES `Personas` (`codigo_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Alumnos_Tipo_Empleados1` FOREIGN KEY (`codigo_tipo_empleado`) REFERENCES `Tipo_Empleados` (`codigo_tipo_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alumnos`
--

LOCK TABLES `Alumnos` WRITE;
/*!40000 ALTER TABLE `Alumnos` DISABLE KEYS */;
INSERT INTO `Alumnos` VALUES (1,'20091011831',0,1,'bcdcb29ed2aab16d48c11485264df665e906bdd9',6,'/img/fotos_perfil/20091011831.jpg');
/*!40000 ALTER TABLE `Alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Asignaturas`
--

DROP TABLE IF EXISTS `Asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Asignaturas` (
  `codigo_asignatura` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_alterno` varchar(20) NOT NULL,
  `nombre_asignatura` varchar(45) NOT NULL,
  `unidades_valorativas` int(11) NOT NULL,
  `dias` varchar(20) NOT NULL,
  `codigp_tp_asignatura` int(11) NOT NULL,
  PRIMARY KEY (`codigo_asignatura`),
  KEY `fk_Asignaturas_Tipo_Asignaturas1_idx` (`codigp_tp_asignatura`),
  CONSTRAINT `fk_Asignaturas_Tipo_Asignaturas1` FOREIGN KEY (`codigp_tp_asignatura`) REFERENCES `Tipo_Asignaturas` (`codigp_tp_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Asignaturas`
--

LOCK TABLES `Asignaturas` WRITE;
/*!40000 ALTER TABLE `Asignaturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Asignaturas_X_Carreras`
--

DROP TABLE IF EXISTS `Asignaturas_X_Carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Asignaturas_X_Carreras` (
  `codigo_asignatura` int(11) NOT NULL,
  `codigo_carrera` int(11) NOT NULL,
  PRIMARY KEY (`codigo_asignatura`,`codigo_carrera`),
  KEY `fk_Asignaturas_has_Carreras_Carreras1_idx` (`codigo_carrera`),
  KEY `fk_Asignaturas_has_Carreras_Asignaturas1_idx` (`codigo_asignatura`),
  CONSTRAINT `fk_Asignaturas_has_Carreras_Asignaturas1` FOREIGN KEY (`codigo_asignatura`) REFERENCES `Asignaturas` (`codigo_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Asignaturas_has_Carreras_Carreras1` FOREIGN KEY (`codigo_carrera`) REFERENCES `Carreras` (`codigo_carrera`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Asignaturas_X_Carreras`
--

LOCK TABLES `Asignaturas_X_Carreras` WRITE;
/*!40000 ALTER TABLE `Asignaturas_X_Carreras` DISABLE KEYS */;
/*!40000 ALTER TABLE `Asignaturas_X_Carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Asignaturas_X_Matriculas`
--

DROP TABLE IF EXISTS `Asignaturas_X_Matriculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Asignaturas_X_Matriculas` (
  `codigo_asignatura` int(11) NOT NULL,
  `codigo_seccion` int(11) NOT NULL,
  `codigo_periodo` int(11) NOT NULL,
  `codigo_alumno` int(11) NOT NULL,
  PRIMARY KEY (`codigo_asignatura`,`codigo_seccion`,`codigo_periodo`,`codigo_alumno`),
  KEY `fk_Asignaturas_has_Matriculas_Matriculas1_idx` (`codigo_seccion`,`codigo_periodo`,`codigo_alumno`),
  KEY `fk_Asignaturas_has_Matriculas_Asignaturas1_idx` (`codigo_asignatura`),
  CONSTRAINT `fk_Asignaturas_has_Matriculas_Asignaturas1` FOREIGN KEY (`codigo_asignatura`) REFERENCES `Asignaturas` (`codigo_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Asignaturas_has_Matriculas_Matriculas1` FOREIGN KEY (`codigo_seccion`, `codigo_periodo`, `codigo_alumno`) REFERENCES `Matriculas` (`codigo_seccion`, `codigo_periodo`, `codigo_alumno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Asignaturas_X_Matriculas`
--

LOCK TABLES `Asignaturas_X_Matriculas` WRITE;
/*!40000 ALTER TABLE `Asignaturas_X_Matriculas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Asignaturas_X_Matriculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aulas`
--

DROP TABLE IF EXISTS `Aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Aulas` (
  `codigo_aula` int(11) NOT NULL AUTO_INCREMENT,
  `numero_aula` varchar(10) NOT NULL,
  `codigo_edificio` int(11) NOT NULL,
  `codigo_tp_aula` int(11) NOT NULL,
  PRIMARY KEY (`codigo_aula`),
  KEY `fk_Aulas_Tipo_Aula1_idx` (`codigo_tp_aula`),
  KEY `fk_Aulas_Edificios1_idx` (`codigo_edificio`),
  CONSTRAINT `fk_Aulas_Edificios1` FOREIGN KEY (`codigo_edificio`) REFERENCES `Edificios` (`codigo_edificio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Aulas_Tipo_Aula1` FOREIGN KEY (`codigo_tp_aula`) REFERENCES `Tipo_Aulas` (`codigo_tp_aula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aulas`
--

LOCK TABLES `Aulas` WRITE;
/*!40000 ALTER TABLE `Aulas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Campus`
--

DROP TABLE IF EXISTS `Campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Campus` (
  `codigo_campus` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_campus` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo_campus`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Campus`
--

LOCK TABLES `Campus` WRITE;
/*!40000 ALTER TABLE `Campus` DISABLE KEYS */;
INSERT INTO `Campus` VALUES (1,'Administrativo'),(2,'Ciencias Sociales'),(3,'Ciencias Economicas'),(4,'Ciencias Juridicas'),(5,'Ciencias Matematicas'),(6,'Ciencias de la Salud'),(7,'Ciencias Biologicas'),(8,'Ciencias Artisticas'),(9,'Deportistas'),(10,'Ciencias Culturales');
/*!40000 ALTER TABLE `Campus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cargos`
--

DROP TABLE IF EXISTS `Cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cargos` (
  `codigo_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cargo` varchar(45) NOT NULL,
  `codigo_cargo_superior` int(11) NOT NULL,
  PRIMARY KEY (`codigo_cargo`,`codigo_cargo_superior`),
  KEY `fk_Cargos_Cargos1_idx` (`codigo_cargo_superior`),
  CONSTRAINT `fk_Cargos_Cargos1` FOREIGN KEY (`codigo_cargo_superior`) REFERENCES `Cargos` (`codigo_cargo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cargos`
--

LOCK TABLES `Cargos` WRITE;
/*!40000 ALTER TABLE `Cargos` DISABLE KEYS */;
INSERT INTO `Cargos` VALUES (1,'Administrador',1);
/*!40000 ALTER TABLE `Cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carreras`
--

DROP TABLE IF EXISTS `Carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Carreras` (
  `codigo_carrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_carrera` varchar(45) NOT NULL,
  `cantidad_asignaturas` int(11) DEFAULT NULL,
  `codigo_grado` int(11) NOT NULL,
  `codigo_facultad` int(11) NOT NULL,
  PRIMARY KEY (`codigo_carrera`),
  KEY `fk_Carreras_Grados1_idx` (`codigo_grado`),
  KEY `fk_Carreras_Facultades1_idx` (`codigo_facultad`),
  CONSTRAINT `fk_Carreras_Facultades1` FOREIGN KEY (`codigo_facultad`) REFERENCES `Facultades` (`codigo_facultad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Carreras_Grados1` FOREIGN KEY (`codigo_grado`) REFERENCES `Grados` (`codigo_grado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carreras`
--

LOCK TABLES `Carreras` WRITE;
/*!40000 ALTER TABLE `Carreras` DISABLE KEYS */;
INSERT INTO `Carreras` VALUES (1,'Ingenieria en Sistemas',54,2,1),(2,'Ingenieria Industrial',62,2,1),(3,'Ingenieria Qumica',52,1,1),(4,'Ingenieria Electrica',68,2,1);
/*!40000 ALTER TABLE `Carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carreras_X_Alumnos`
--

DROP TABLE IF EXISTS `Carreras_X_Alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Carreras_X_Alumnos` (
  `codigo_carrera` int(11) NOT NULL,
  `codigo_alumno` int(11) NOT NULL,
  `fecha_registro_carrera` date NOT NULL,
  `promedio_carrera` decimal(10,0) NOT NULL,
  `clases_aprobadas` int(11) NOT NULL,
  PRIMARY KEY (`codigo_carrera`,`codigo_alumno`),
  KEY `fk_Carreras_has_Alumnos_Alumnos1_idx` (`codigo_alumno`),
  KEY `fk_Carreras_has_Alumnos_Carreras1_idx` (`codigo_carrera`),
  CONSTRAINT `fk_Carreras_has_Alumnos_Alumnos1` FOREIGN KEY (`codigo_alumno`) REFERENCES `Alumnos` (`codigo_alumno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Carreras_has_Alumnos_Carreras1` FOREIGN KEY (`codigo_carrera`) REFERENCES `Carreras` (`codigo_carrera`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carreras_X_Alumnos`
--

LOCK TABLES `Carreras_X_Alumnos` WRITE;
/*!40000 ALTER TABLE `Carreras_X_Alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Carreras_X_Alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Edificios`
--

DROP TABLE IF EXISTS `Edificios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Edificios` (
  `codigo_edificio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_edificio` varchar(45) NOT NULL,
  `alias` varchar(10) NOT NULL,
  `codigo_campus` int(11) NOT NULL,
  PRIMARY KEY (`codigo_edificio`),
  KEY `fk_Edificios_Campus1_idx` (`codigo_campus`),
  CONSTRAINT `fk_Edificios_Campus1` FOREIGN KEY (`codigo_campus`) REFERENCES `Campus` (`codigo_campus`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Edificios`
--

LOCK TABLES `Edificios` WRITE;
/*!40000 ALTER TABLE `Edificios` DISABLE KEYS */;
INSERT INTO `Edificios` VALUES (1,'Facultad Psicologia, Matematicas y Filosofia','F1',5),(2,'Facultad de Economia','C1',3),(3,'Facultad de Derecho','E1',4),(4,'Facultad de Ingeniería y Arquitectura','B2',5),(5,'Facultad de Arte','C2',1),(6,'Facultad de Arquitectura','',7),(7,'Nutricion','J2',6);
/*!40000 ALTER TABLE `Edificios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleados`
--

DROP TABLE IF EXISTS `Empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Empleados` (
  `codigo_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `clave_empleado` int(11) NOT NULL,
  `salario_base` decimal(10,2) NOT NULL,
  `codigo_persona` int(11) NOT NULL,
  `codigo_genero` int(11) NOT NULL,
  `codigo_estado_civil` int(11) NOT NULL,
  `codigo_tipo_empleado` int(11) NOT NULL,
  `codigo_cargo` int(11) NOT NULL,
  `contrasenia` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo_empleado`),
  KEY `fk_Empleados_Tipo_Empleados1_idx` (`codigo_tipo_empleado`),
  KEY `fk_Empleados_Cargos1_idx` (`codigo_cargo`),
  KEY `fk_Empleados_Personas1_idx` (`codigo_persona`,`codigo_genero`,`codigo_estado_civil`),
  CONSTRAINT `fk_Empleados_Cargos1` FOREIGN KEY (`codigo_cargo`) REFERENCES `Cargos` (`codigo_cargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Empleados_Personas1` FOREIGN KEY (`codigo_persona`) REFERENCES `Personas` (`codigo_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Empleados_Tipo_Empleados1` FOREIGN KEY (`codigo_tipo_empleado`) REFERENCES `Tipo_Empleados` (`codigo_tipo_empleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleados`
--

LOCK TABLES `Empleados` WRITE;
/*!40000 ALTER TABLE `Empleados` DISABLE KEYS */;
INSERT INTO `Empleados` VALUES (1,130290,50000.00,1,0,0,1,1,'3fecbbd72f31ec3668872cf34849e1bb464abc13');
/*!40000 ALTER TABLE `Empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Especializaciones`
--

DROP TABLE IF EXISTS `Especializaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Especializaciones` (
  `codigo_especializacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_especializacion` varchar(45) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`codigo_especializacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Especializaciones`
--

LOCK TABLES `Especializaciones` WRITE;
/*!40000 ALTER TABLE `Especializaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `Especializaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estados_Civiles`
--

DROP TABLE IF EXISTS `Estados_Civiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estados_Civiles` (
  `codigo_estado_civil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado_civil` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo_estado_civil`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estados_Civiles`
--

LOCK TABLES `Estados_Civiles` WRITE;
/*!40000 ALTER TABLE `Estados_Civiles` DISABLE KEYS */;
INSERT INTO `Estados_Civiles` VALUES (1,'Soltero/a'),(2,'Casado/a');
/*!40000 ALTER TABLE `Estados_Civiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estados_Matriculas`
--

DROP TABLE IF EXISTS `Estados_Matriculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estados_Matriculas` (
  `codigo_estado_matricula` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado` varchar(45) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codigo_estado_matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estados_Matriculas`
--

LOCK TABLES `Estados_Matriculas` WRITE;
/*!40000 ALTER TABLE `Estados_Matriculas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Estados_Matriculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Evaluaciones`
--

DROP TABLE IF EXISTS `Evaluaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Evaluaciones` (
  `codigo_evaluacion` bigint(11) NOT NULL AUTO_INCREMENT,
  `codigo_historial` int(11) NOT NULL,
  `codigo_alumno` int(11) NOT NULL,
  `codigo_periodo` int(11) NOT NULL,
  `codigo_asignatura` int(11) NOT NULL,
  `codigo_maestro` int(11) NOT NULL,
  `codigo_tp_evaluacion` int(11) NOT NULL,
  `nota_final` tinyint(1) NOT NULL,
  PRIMARY KEY (`codigo_evaluacion`,`codigo_historial`),
  KEY `fk_Evaluaciones_Tipos_Evaluaciones1_idx` (`codigo_tp_evaluacion`),
  KEY `fk_Evaluaciones_Alumnos1_idx` (`codigo_alumno`),
  KEY `fk_Evaluaciones_Periodos1_idx` (`codigo_periodo`),
  KEY `fk_Evaluaciones_Maestros1_idx` (`codigo_maestro`),
  KEY `fk_Evaluaciones_Asignaturas1_idx` (`codigo_asignatura`),
  KEY `fk_Evaluaciones_Historiales1_idx` (`codigo_historial`),
  CONSTRAINT `fk_Evaluaciones_Alumnos1` FOREIGN KEY (`codigo_alumno`) REFERENCES `Alumnos` (`codigo_alumno`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Evaluaciones_Asignaturas1` FOREIGN KEY (`codigo_asignatura`) REFERENCES `Asignaturas` (`codigo_asignatura`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Evaluaciones_Historiales1` FOREIGN KEY (`codigo_historial`) REFERENCES `Historiales` (`codigo_historial`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Evaluaciones_Maestros1` FOREIGN KEY (`codigo_maestro`) REFERENCES `Maestros` (`codigo_maestro`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Evaluaciones_Periodos1` FOREIGN KEY (`codigo_periodo`) REFERENCES `Periodos` (`codigo_periodo`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Evaluaciones_Tipos_Evaluaciones1` FOREIGN KEY (`codigo_tp_evaluacion`) REFERENCES `Tipos_Evaluaciones` (`codigo_tp_evaluacion`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Evaluaciones`
--

LOCK TABLES `Evaluaciones` WRITE;
/*!40000 ALTER TABLE `Evaluaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `Evaluaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facultades`
--

DROP TABLE IF EXISTS `Facultades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Facultades` (
  `codigo_facultad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_facultad` varchar(45) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`codigo_facultad`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facultades`
--

LOCK TABLES `Facultades` WRITE;
/*!40000 ALTER TABLE `Facultades` DISABLE KEYS */;
INSERT INTO `Facultades` VALUES (1,'Ingenieria','.....'),(2,'Medicina','.....'),(3,'Derecho','.....'),(4,'Odontologia','La facultad...'),(5,'Psicologia',''),(6,'Informatica','.....'),(7,'Sociologia',''),(8,'Filosofia','La facultad.....');
/*!40000 ALTER TABLE `Facultades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Generos`
--

DROP TABLE IF EXISTS `Generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Generos` (
  `codigo_genero` int(11) NOT NULL AUTO_INCREMENT,
  `genero` varchar(20) NOT NULL,
  `abreviatura` varchar(5) NOT NULL,
  PRIMARY KEY (`codigo_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Generos`
--

LOCK TABLES `Generos` WRITE;
/*!40000 ALTER TABLE `Generos` DISABLE KEYS */;
INSERT INTO `Generos` VALUES (1,'Masculino','M'),(2,'Femenino','F');
/*!40000 ALTER TABLE `Generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grados`
--

DROP TABLE IF EXISTS `Grados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Grados` (
  `codigo_grado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_grado` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo_grado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grados`
--

LOCK TABLES `Grados` WRITE;
/*!40000 ALTER TABLE `Grados` DISABLE KEYS */;
INSERT INTO `Grados` VALUES (1,'Postgrado'),(2,'Pregrado');
/*!40000 ALTER TABLE `Grados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Historiales`
--

DROP TABLE IF EXISTS `Historiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Historiales` (
  `codigo_historial` int(11) NOT NULL AUTO_INCREMENT,
  `promedio` tinyint(1) NOT NULL,
  `codigo_alumno` int(11) NOT NULL,
  `codigo_tp_periodo` int(11) NOT NULL,
  PRIMARY KEY (`codigo_historial`),
  KEY `fk_Historiales_Alumnos1_idx` (`codigo_alumno`),
  KEY `fk_Historiales_Tipos_Periodos1_idx` (`codigo_tp_periodo`),
  CONSTRAINT `fk_Historiales_Alumnos1` FOREIGN KEY (`codigo_alumno`) REFERENCES `Alumnos` (`codigo_alumno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Historiales_Tipos_Periodos1` FOREIGN KEY (`codigo_tp_periodo`) REFERENCES `Tipos_Periodos` (`codigo_tp_periodo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Historiales`
--

LOCK TABLES `Historiales` WRITE;
/*!40000 ALTER TABLE `Historiales` DISABLE KEYS */;
/*!40000 ALTER TABLE `Historiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lugares`
--

DROP TABLE IF EXISTS `Lugares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lugares` (
  `codigo_lugar` int(11) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(45) NOT NULL,
  `municipio` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo_lugar`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lugares`
--

LOCK TABLES `Lugares` WRITE;
/*!40000 ALTER TABLE `Lugares` DISABLE KEYS */;
INSERT INTO `Lugares` VALUES (1,'Francisco Morazan','Tegucigalpa MDC');
/*!40000 ALTER TABLE `Lugares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Maestros`
--

DROP TABLE IF EXISTS `Maestros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Maestros` (
  `codigo_maestro` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_especializacion` int(11) NOT NULL,
  `codigo_titularidad` int(11) NOT NULL,
  `codigo_empleado` int(11) NOT NULL,
  PRIMARY KEY (`codigo_maestro`,`codigo_especializacion`),
  KEY `fk_Maestros_Especializaciones1_idx` (`codigo_especializacion`),
  KEY `fk_Maestros_Titularidades1_idx` (`codigo_titularidad`),
  KEY `fk_Maestros_Empleados1_idx` (`codigo_empleado`),
  CONSTRAINT `fk_Maestros_Empleados1` FOREIGN KEY (`codigo_empleado`) REFERENCES `Empleados` (`codigo_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Maestros_Especializaciones1` FOREIGN KEY (`codigo_especializacion`) REFERENCES `Especializaciones` (`codigo_especializacion`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Maestros_Titularidades1` FOREIGN KEY (`codigo_titularidad`) REFERENCES `Titularidades` (`codigo_titularidad`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Maestros`
--

LOCK TABLES `Maestros` WRITE;
/*!40000 ALTER TABLE `Maestros` DISABLE KEYS */;
/*!40000 ALTER TABLE `Maestros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Matriculas`
--

DROP TABLE IF EXISTS `Matriculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Matriculas` (
  `codigo_seccion` int(11) NOT NULL,
  `codigo_periodo` int(11) NOT NULL,
  `codigo_alumno` int(11) NOT NULL,
  `codigo_estado_matricula` int(11) NOT NULL,
  `fecha_matricula` date NOT NULL,
  PRIMARY KEY (`codigo_seccion`,`codigo_periodo`,`codigo_alumno`),
  KEY `fk_Estados_Matriculas_has_Alumnos_Estados_Matriculas1_idx` (`codigo_estado_matricula`),
  KEY `fk_Matriculas_Periodos1_idx` (`codigo_periodo`),
  KEY `fk_Matriculas_Alumnos1_idx` (`codigo_alumno`),
  CONSTRAINT `fk_Estados_Matriculas_has_Alumnos_Estados_Matriculas1` FOREIGN KEY (`codigo_estado_matricula`) REFERENCES `Estados_Matriculas` (`codigo_estado_matricula`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Matriculas_Alumnos1` FOREIGN KEY (`codigo_alumno`) REFERENCES `Alumnos` (`codigo_alumno`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Matriculas_Periodos1` FOREIGN KEY (`codigo_periodo`) REFERENCES `Periodos` (`codigo_periodo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Matriculas_Secciones1` FOREIGN KEY (`codigo_seccion`) REFERENCES `Secciones` (`codigo_seccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Matriculas`
--

LOCK TABLES `Matriculas` WRITE;
/*!40000 ALTER TABLE `Matriculas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Matriculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Periodos`
--

DROP TABLE IF EXISTS `Periodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Periodos` (
  `codigo_periodo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_periodo` varchar(20) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `codigo_tp_periodo` int(11) NOT NULL,
  PRIMARY KEY (`codigo_periodo`),
  KEY `fk_Periodos_Tipos_Periodos1_idx` (`codigo_tp_periodo`),
  CONSTRAINT `fk_Periodos_Tipos_Periodos1` FOREIGN KEY (`codigo_tp_periodo`) REFERENCES `Tipos_Periodos` (`codigo_tp_periodo`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Periodos`
--

LOCK TABLES `Periodos` WRITE;
/*!40000 ALTER TABLE `Periodos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Periodos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Personas`
--

DROP TABLE IF EXISTS `Personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Personas` (
  `codigo_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `identidad` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(200) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `nacionalidad` varchar(45) NOT NULL,
  `codigo_estado_civil` int(11) NOT NULL,
  `codigo_genero` int(11) NOT NULL,
  `codigo_campus` int(11) NOT NULL,
  `codigo_lugar` int(11) NOT NULL,
  PRIMARY KEY (`codigo_persona`),
  KEY `fk_Personas_Estados_Civiles1_idx` (`codigo_estado_civil`),
  KEY `fk_Personas_Generos1_idx` (`codigo_genero`),
  KEY `fk_Personas_Lugares1_idx` (`codigo_lugar`),
  KEY `fk_Personas_Campus1_idx` (`codigo_campus`),
  CONSTRAINT `fk_Personas_Campus1` FOREIGN KEY (`codigo_campus`) REFERENCES `Campus` (`codigo_campus`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Personas_Estados_Civiles1` FOREIGN KEY (`codigo_estado_civil`) REFERENCES `Estados_Civiles` (`codigo_estado_civil`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Personas_Generos1` FOREIGN KEY (`codigo_genero`) REFERENCES `Generos` (`codigo_genero`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Personas_Lugares1` FOREIGN KEY (`codigo_lugar`) REFERENCES `Lugares` (`codigo_lugar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personas`
--

LOCK TABLES `Personas` WRITE;
/*!40000 ALTER TABLE `Personas` DISABLE KEYS */;
INSERT INTO `Personas` VALUES (1,'Marvin Rene','Ramirez Jimenez','1990-02-13','0801-1990-03700','33859665','Colonia reparto por bajo, barrio Santa Rosa, paseo casamata','marre1390@gmail.com','Hondureña',1,1,1,1);
/*!40000 ALTER TABLE `Personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requisitos`
--

DROP TABLE IF EXISTS `Requisitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Requisitos` (
  `codigo_requisito` int(11) NOT NULL AUTO_INCREMENT,
  `asignatura_requisito` varchar(200) NOT NULL,
  PRIMARY KEY (`codigo_requisito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requisitos`
--

LOCK TABLES `Requisitos` WRITE;
/*!40000 ALTER TABLE `Requisitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Requisitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requisitos_X_Asignaturas`
--

DROP TABLE IF EXISTS `Requisitos_X_Asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Requisitos_X_Asignaturas` (
  `codigo_requisito` int(11) NOT NULL,
  `codigo_asignatura` int(11) NOT NULL,
  PRIMARY KEY (`codigo_requisito`,`codigo_asignatura`),
  KEY `fk_Requisitos_has_Asignaturas_Asignaturas1_idx` (`codigo_asignatura`),
  KEY `fk_Requisitos_has_Asignaturas_Requisitos1_idx` (`codigo_requisito`),
  CONSTRAINT `fk_Requisitos_has_Asignaturas_Asignaturas1` FOREIGN KEY (`codigo_asignatura`) REFERENCES `Asignaturas` (`codigo_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Requisitos_has_Asignaturas_Requisitos1` FOREIGN KEY (`codigo_requisito`) REFERENCES `Requisitos` (`codigo_requisito`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requisitos_X_Asignaturas`
--

LOCK TABLES `Requisitos_X_Asignaturas` WRITE;
/*!40000 ALTER TABLE `Requisitos_X_Asignaturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Requisitos_X_Asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Secciones`
--

DROP TABLE IF EXISTS `Secciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Secciones` (
  `codigo_seccion` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_aula` int(11) NOT NULL,
  `codigo_periodo` int(11) NOT NULL,
  `codigo_maestro` int(11) NOT NULL,
  `codigo_alterno` varchar(45) NOT NULL,
  `hora_inicio` datetime NOT NULL,
  `hora_fin` datetime NOT NULL,
  `dias` varchar(20) NOT NULL,
  `cupos_disponibles` int(11) NOT NULL,
  PRIMARY KEY (`codigo_seccion`),
  KEY `fk_Secciones_Aulas1_idx` (`codigo_aula`),
  KEY `fk_Secciones_Periodos1_idx` (`codigo_periodo`),
  KEY `fk_Secciones_Maestros1_idx` (`codigo_maestro`),
  CONSTRAINT `fk_Secciones_Aulas1` FOREIGN KEY (`codigo_aula`) REFERENCES `Aulas` (`codigo_aula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Secciones_Maestros1` FOREIGN KEY (`codigo_maestro`) REFERENCES `Maestros` (`codigo_maestro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Secciones_Periodos1` FOREIGN KEY (`codigo_periodo`) REFERENCES `Periodos` (`codigo_periodo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Secciones`
--

LOCK TABLES `Secciones` WRITE;
/*!40000 ALTER TABLE `Secciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `Secciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_Asignaturas`
--

DROP TABLE IF EXISTS `Tipo_Asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipo_Asignaturas` (
  `codigp_tp_asignatura` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_asignatura` varchar(45) NOT NULL,
  PRIMARY KEY (`codigp_tp_asignatura`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_Asignaturas`
--

LOCK TABLES `Tipo_Asignaturas` WRITE;
/*!40000 ALTER TABLE `Tipo_Asignaturas` DISABLE KEYS */;
INSERT INTO `Tipo_Asignaturas` VALUES (1,'Presencial'),(2,'Distancia'),(3,'OnLine'),(4,'Semestral');
/*!40000 ALTER TABLE `Tipo_Asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_Aulas`
--

DROP TABLE IF EXISTS `Tipo_Aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipo_Aulas` (
  `codigo_tp_aula` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_aula` varchar(20) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codigo_tp_aula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_Aulas`
--

LOCK TABLES `Tipo_Aulas` WRITE;
/*!40000 ALTER TABLE `Tipo_Aulas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipo_Aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_Empleados`
--

DROP TABLE IF EXISTS `Tipo_Empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipo_Empleados` (
  `codigo_tipo_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_empleado` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo_tipo_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_Empleados`
--

LOCK TABLES `Tipo_Empleados` WRITE;
/*!40000 ALTER TABLE `Tipo_Empleados` DISABLE KEYS */;
INSERT INTO `Tipo_Empleados` VALUES (1,'Admin'),(2,'Decano'),(3,'Jefe de carrera'),(4,'Coordinador de carrera'),(5,'Docente'),(6,'Estudiante');
/*!40000 ALTER TABLE `Tipo_Empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipos_Evaluaciones`
--

DROP TABLE IF EXISTS `Tipos_Evaluaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipos_Evaluaciones` (
  `codigo_tp_evaluacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_evaluacion` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo_tp_evaluacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipos_Evaluaciones`
--

LOCK TABLES `Tipos_Evaluaciones` WRITE;
/*!40000 ALTER TABLE `Tipos_Evaluaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipos_Evaluaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipos_Periodos`
--

DROP TABLE IF EXISTS `Tipos_Periodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipos_Periodos` (
  `codigo_tp_periodo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_periodo` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo_tp_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipos_Periodos`
--

LOCK TABLES `Tipos_Periodos` WRITE;
/*!40000 ALTER TABLE `Tipos_Periodos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipos_Periodos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Titularidades`
--

DROP TABLE IF EXISTS `Titularidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Titularidades` (
  `codigo_titularidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_titularidad` varchar(45) NOT NULL,
  `salario_max` decimal(10,2) NOT NULL,
  `salario_min` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codigo_titularidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Titularidades`
--

LOCK TABLES `Titularidades` WRITE;
/*!40000 ALTER TABLE `Titularidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `Titularidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Titulos`
--

DROP TABLE IF EXISTS `Titulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Titulos` (
  `codigo_titulo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_titulo` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo_titulo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Titulos`
--

LOCK TABLES `Titulos` WRITE;
/*!40000 ALTER TABLE `Titulos` DISABLE KEYS */;
INSERT INTO `Titulos` VALUES (1,'Licenciatura en Psicología'),(2,'Licenciatura en Informática'),(3,'Licenciatura en Física'),(4,'Licenciatura en Medicina'),(5,'Licenciatura en Mercadotecnia'),(6,'Licenciatura en Ingeniería de Sistemas'),(7,'Licenciatura en Español'),(8,'Licenciatura en Educación Física'),(9,'Licenciatura en Astronomia'),(10,'Licenciatura en Derecho'),(11,'Licenciatura en Matemáticas'),(12,'Licenciatura en Odontología'),(13,'Licenciatura en Pedagogia'),(14,'Licenciatura en Economia'),(15,'Licenciatura en Música'),(16,'Licenciatura en Nutrición'),(17,'undefined'),(18,'undefined'),(19,'undefined'),(20,'Licenciatura en Biologia');
/*!40000 ALTER TABLE `Titulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Titulos_X_Empleados`
--

DROP TABLE IF EXISTS `Titulos_X_Empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Titulos_X_Empleados` (
  `codigo_tipo_empleado` int(11) NOT NULL,
  `codigo_titulo` int(11) NOT NULL,
  `codigo_universidad` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `numero_registro` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo_tipo_empleado`,`codigo_titulo`),
  KEY `fk_Tipo_Empleados_has_Titulos_Titulos1_idx` (`codigo_titulo`),
  KEY `fk_Tipo_Empleados_has_Titulos_Tipo_Empleados1_idx` (`codigo_tipo_empleado`),
  KEY `fk_Titulos_X_Empleados_Universidades1_idx` (`codigo_universidad`),
  CONSTRAINT `fk_Tipo_Empleados_has_Titulos_Tipo_Empleados1` FOREIGN KEY (`codigo_tipo_empleado`) REFERENCES `Tipo_Empleados` (`codigo_tipo_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Tipo_Empleados_has_Titulos_Titulos1` FOREIGN KEY (`codigo_titulo`) REFERENCES `Titulos` (`codigo_titulo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Titulos_X_Empleados_Universidades1` FOREIGN KEY (`codigo_universidad`) REFERENCES `Universidades` (`codigo_universidad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Titulos_X_Empleados`
--

LOCK TABLES `Titulos_X_Empleados` WRITE;
/*!40000 ALTER TABLE `Titulos_X_Empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `Titulos_X_Empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Universidades`
--

DROP TABLE IF EXISTS `Universidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Universidades` (
  `codigo_universidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_universidad` varchar(45) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  PRIMARY KEY (`codigo_universidad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Universidades`
--

LOCK TABLES `Universidades` WRITE;
/*!40000 ALTER TABLE `Universidades` DISABLE KEYS */;
INSERT INTO `Universidades` VALUES (1,'UNAH','2255-4546','Tegucigalpa\n M.D.C., Francisco Morazan');
/*!40000 ALTER TABLE `Universidades` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-12 23:43:13
