
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `reto4` DEFAULT CHARACTER SET utf8 ;
USE `reto4` ;

-- -----------------------------------------------------
-- Table cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto4`.`cliente` (
  `c_identidad` INT NOT NULL AUTO_INCREMENT,
  `c_nombre` VARCHAR(40) NOT NULL,
  `c_especie` VARCHAR(30) NOT NULL,
  `c_genero` VARCHAR(30) NULL,
  PRIMARY KEY (`c_identidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table vehiculo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto4`.`vehiculo` (
  `v_matricula` INT NOT NULL,
  `v_nombre` VARCHAR(50) NOT NULL,
  `v_velocidad` FLOAT NOT NULL,
  `v_longitud` FLOAT NOT NULL,
  PRIMARY KEY (`v_matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table alquiler
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto4`.`alquiler` (
  `a_id` INT NOT NULL,
  `a_cliente` INT NOT NULL,
  `a_vehiculo` INT NOT NULL,
  `a_fecha` DATETIME NOT NULL,
  `a_ocasion` VARCHAR(50) NOT NULL,
  `a_duracion` INT NOT NULL,
  `a_costo` DOUBLE NOT NULL,
  PRIMARY KEY (`a_id`),
  INDEX `a_cliente` (`a_cliente` ASC) VISIBLE,
  INDEX `a_vehiculo` (`a_vehiculo` ASC) VISIBLE,
  CONSTRAINT `fk_alquiler_cliente1`
    FOREIGN KEY (`a_cliente`)
    REFERENCES `reto4`.`cliente` (`c_identidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alquiler_vehiculo1`
    FOREIGN KEY (`a_vehiculo`)
    REFERENCES `reto4`.`vehiculo` (`v_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table transporte
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto4`.`transporte` (
  `t_matricula` INT NOT NULL,
  `t_tripulantes` INT NOT NULL,
  `t_pasajeros` INT NOT NULL,
  PRIMARY KEY (`t_matricula`),
  CONSTRAINT `fk_transporte_vehiculo`
    FOREIGN KEY (`t_matricula`)
    REFERENCES `reto4`.`vehiculo` (`v_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ligero
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto4`.`ligero` (
  `l_matricula` INT NOT NULL,
  `l_color` VARCHAR(20) NOT NULL,
  `l_androide` VARCHAR(30) NULL,
  PRIMARY KEY (`l_matricula`),
  CONSTRAINT `fk_ligero_vehiculo1`
    FOREIGN KEY (`l_matricula`)
    REFERENCES `reto4`.`vehiculo` (`v_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table capitan
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto4`.`capitan` (
  `c_licencia` INT NOT NULL,
  `c_transporte` INT NOT NULL,
  `c_nombre` VARCHAR(40) NOT NULL,
  `c_especie` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`c_licencia`),
  INDEX `c_transporte` (`c_transporte` ASC) VISIBLE,
  CONSTRAINT `fk_capitan_transporte1`
    FOREIGN KEY (`c_transporte`)
    REFERENCES `reto4`.`transporte` (`t_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO vehiculo (v_matricula,v_nombre,v_velocidad, v_longitud) VALUES(1,'Halcón Milenario',75,34.37);
INSERT INTO vehiculo (v_matricula,v_nombre,v_velocidad, v_longitud) VALUES(2,'Ala-X',100,12.5);
INSERT INTO vehiculo (v_matricula,v_nombre,v_velocidad, v_longitud) VALUES(3,'Ala-Y',80,14);
INSERT INTO vehiculo (v_matricula,v_nombre,v_velocidad, v_longitud) VALUES(4,'Ala-A',120,9.6);
INSERT INTO vehiculo (v_matricula,v_nombre,v_velocidad, v_longitud) VALUES(5,'Interceptor TIE	',105,9.2);
INSERT INTO vehiculo (v_matricula,v_nombre,v_velocidad, v_longitud) VALUES(6,'Esclavo 1',70,21.1);
INSERT INTO vehiculo (v_matricula,v_nombre,v_velocidad, v_longitud) VALUES(7,'Destructor Estelar',60,1600);
INSERT INTO vehiculo (v_matricula,v_nombre,v_velocidad, v_longitud) VALUES(8,'Estrella de la Muerte',10,120000);
INSERT INTO vehiculo (v_matricula,v_nombre,v_velocidad, v_longitud) VALUES(9,'Transbordador Imperial',50,20);
INSERT INTO vehiculo (v_matricula,v_nombre,v_velocidad, v_longitud) VALUES(10,'Ejecutor',40,19000);

INSERT INTO cliente (c_identidad,c_nombre,c_especie,c_genero) VALUES (1,'Luke Skywalker','Humano','Masculino');
INSERT INTO cliente (c_identidad,c_nombre,c_especie,c_genero) VALUES (2,'Leia Organa','Humano','Femenino');
INSERT INTO cliente (c_identidad,c_nombre,c_especie,c_genero) VALUES (3,'Rey Skywalker','Humano','Femenino');
INSERT INTO cliente (c_identidad,c_nombre,c_especie,c_genero) VALUES (4,'Obi-Wan Kenobi','Humano','Masculino');
INSERT INTO cliente (c_identidad,c_nombre,c_especie,c_genero) VALUES (5,'Maz Kanata','Humanoide','Femenino');
INSERT INTO cliente (c_identidad,c_nombre,c_especie,c_genero) VALUES (6,'Anakin Skywalker','Humano','Masculino');
INSERT INTO cliente (c_identidad,c_nombre,c_especie,c_genero) VALUES (7,'Yoda','Yoda','Masculino');
INSERT INTO cliente (c_identidad,c_nombre,c_especie,c_genero) VALUES (8,'Ahsoka Tano','Togruta','Femenino');
INSERT INTO cliente (c_identidad,c_nombre,c_especie,c_genero) VALUES (9,'Grogu','Yoda','Masculino');
INSERT INTO cliente (c_identidad,c_nombre,c_especie,c_genero) VALUES (10,'Aayla Secura',"Twi'lek",'Femenino');
INSERT INTO cliente (c_identidad,c_nombre,c_especie,c_genero) VALUES (11,'Chewbacca','Wookiee','Masculino');
INSERT INTO cliente (c_identidad,c_nombre,c_especie,c_genero) VALUES (12,'Wicket W. Warrick','Ewok','Masculino');

INSERT INTO ligero (l_matricula, l_color, l_androide ) VALUES (2,'BLANCO/ROJO','R2-D2');
INSERT INTO ligero (l_matricula, l_color, l_androide ) VALUES (3,'AMARILLO','C-3PO');
INSERT INTO ligero (l_matricula, l_color, l_androide ) VALUES (4,'ROJO',NULL);
INSERT INTO ligero (l_matricula, l_color, l_androide ) VALUES (5,'NEGRO','Androide TIE');

INSERT INTO transporte (t_matricula,t_tripulantes,t_pasajeros) VALUES (1,4,6);
INSERT INTO transporte (t_matricula,t_tripulantes,t_pasajeros) VALUES (6,1,6);
INSERT INTO transporte (t_matricula,t_tripulantes,t_pasajeros) VALUES (7,47060,0);
INSERT INTO transporte (t_matricula,t_tripulantes,t_pasajeros) VALUES (8,342953,843342);
INSERT INTO transporte (t_matricula,t_tripulantes,t_pasajeros) VALUES (9,6,20);
INSERT INTO transporte (t_matricula,t_tripulantes,t_pasajeros) VALUES (10,279144,38000);

INSERT INTO capitan (c_licencia,c_nombre,c_especie,c_transporte) VALUES (1,'Han Solo','Humano',1);
INSERT INTO capitan (c_licencia,c_nombre,c_especie,c_transporte) VALUES (2,'Jango Fett','Mandaloriano',6);
INSERT INTO capitan (c_licencia,c_nombre,c_especie,c_transporte) VALUES (3,'General Grievous','Androide',7);
INSERT INTO capitan (c_licencia,c_nombre,c_especie,c_transporte) VALUES (4,'Grand Moff Tarkin','Humano',8);
INSERT INTO capitan (c_licencia,c_nombre,c_especie,c_transporte) VALUES (5,'Darth Vader','Humano/Androide',9);
INSERT INTO capitan (c_licencia,c_nombre,c_especie,c_transporte) VALUES (6,'Kendal Ozzel','Humano',10);

INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7110,1,6,'2005-05-19','La Venganza de los Sith',4,238.03);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7143,2,6,'2018-05-25','Han Solo',10,252.99);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7176,3,9,'2015-12-18','El Despertar de la Fuerza',14,1095.27);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7187,1,1,'2018-05-25','Han Solo',15,374.64);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7209,4,8,'1999-05-19','La Amenaza Fantasma',18,1145.38);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7220,2,9,'2018-05-25','Han Solo',17,839.24);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7242,5,10,'2017-12-15','Los Últimos JEDI',17,1396.31);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7253,3,6,'1999-05-19','La Amenaza Fantasma',24,826.54);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7264,1,3,'1999-05-19','La Amenaza Fantasma',9,427.71);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7275,6,6,'2018-05-25','Han Solo',7,556.67);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7286,4,6,'2015-12-18','El Despertar de la Fuerza',9,451.35);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7297,2,8,'1977-05-25','Una nueva esperanza',9,395.32);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7308,7,5,'2018-05-25','Han Solo',13,1099.22);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7319,5,2,'2002-05-16','El Ataque de los Clones',11,833.2);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7330,3,8,'2019-12-20','El Ascenso de Skywalker',23,528.94);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7341,8,10,'1983-05-25','El Retorno del JEDI',11,207.56);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7352,6,4,'2017-12-15','Los Últimos JEDI',15,492.47);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7363,4,8,'2016-12-16','Rogue One',11,742.71);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7374,9,10,'2016-12-16','Rogue One',24,175.44);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7385,7,2,'1983-05-25','El Retorno del JEDI',13,1016.47);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7396,5,4,'2016-12-16','Rogue One',7,19.04);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7407,10,1,'2019-12-20','El Ascenso de Skywalker',24,387.95);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7418,8,8,'2002-05-16','El Ataque de los Clones',19,1024.49);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7429,6,4,'2002-05-16','El Ataque de los Clones',20,444.75);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7451,9,4,'2005-05-19','La Venganza de los Sith',4,69.09);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7462,7,3,'1999-05-19','La Amenaza Fantasma',7,556.8);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7484,10,6,'2018-05-25','Han Solo',20,272.61);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7495,8,9,'2016-12-16','Rogue One',6,116.87);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7528,9,6,'1977-05-25','Una nueva esperanza',4,285.43);
INSERT INTO alquiler (a_id,a_cliente,a_vehiculo,a_fecha,a_ocasion,a_duracion,a_costo) 
VALUES (7561,10,6,'1980-05-21','El Imperio contraataca',28,1377.01);
