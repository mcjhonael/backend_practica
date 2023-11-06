-- cuando la relacion es de muxos a muxos se crea otra tabla
-- solo pasa en las BD relacional
-- nace la tabla pueste|pivote|detalle
-- alumnos | cursos (rel m-m)
-- alumnos | detalle | cursos (1-m)(m-1)
-- detalle se debe llamar como la union de las 2 tablas (alumnos_cursos)
-- las 2 llaves pasan a la tabla detalle
-- en el detalle irian puede ser k un alumno tenga un registro con un curso 
-- pero tbm el mismo alumno con otro curso x eso creamos una tabla aparte
-- para juntar todo la data

CREATE DATABASE CALIFICACIONES;
USE CALIFICACIONES;

CREATE TABLE ALUMNOS(
ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
NOMBRE VARCHAR(50),
APELLIDO VARCHAR(50),
CORREO VARCHAR(50) UNIQUE
);

CREATE TABLE CURSOS(
ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
NOMBRE VARCHAR(50),
DURACION TINYINT,
CREDITOS TINYINT,
ESTADO BOOLEAN
);
CREATE TABLE ALUMNOS_CURSOS(
ALUMNOS_ID INT,
CURSOS_ID INT,
FOREIGN KEY (ALUMNOS_ID) REFERENCES ALUMNOS(ID),
FOREIGN KEY (CURSOS_ID) REFERENCES CURSOS(ID)
);

SELECT *
FROM ALUMNOS;

SELECT * 
FROM CURSOS;

SELECT *
FROM ALUMNOS_CURSOS;

-- DROP DATABASE CALIFICACIONES;

INSERT INTO CURSOS(NOMBRE,DURACION,CREDITOS,ESTADO) VALUES 
('REACT',4,6,TRUE),
('ANGULAR',3,3,TRUE),
('DJANGO',5,5,TRUE),
('FLASK',3,4,TRUE),
('EXPRESS',2,5,TRUE);


SELECT * FROM cursos;
SELECT * FROM ALUMNOS;
SELECT * FROM ALUMNOS_CURSOS;

-- MOSTRAR TODOS LOS ALUMNOS QUE EMPIEZAN CON LA LETRA A AL INICIO YA K EL % SIGNIFICA LO QUE SEA DESPUES 
SELECT  *
FROM ALUMNOS
WHERE NOMBRE LIKE 'A%';

-- MOSTRAR TODOS LOS ALUMNOS QUE TERMINEN CON LA LETRA A AL INICIO YA K EL % SIGNIFICA LO QUE SEA DESPUES 
SELECT  *
FROM ALUMNOS
WHERE NOMBRE LIKE '%A';

-- MOSTRAR TODOS LOS ALUMNOS QUE TENGANLA LETRA A AL INICIO O FINAL O DONDE SEA 
SELECT  *
FROM ALUMNOS
WHERE NOMBRE LIKE '%A%';

-- MOSTRAR TODOS LOS ALUMNOS QUE INICIO LETRA A Y DONDE SEA LA LETRA E 
-- CUANDO USAMOS EL LIKE CUANDO QUEREMOS HACER UN MACH EXACTO 
SELECT  *
FROM ALUMNOS
WHERE NOMBRE LIKE 'A%E%';

-- TODOS LOS ALUMNOS CUYO CORREO SEA HOTMAIL

SELECT *
FROM ALUMNOS
WHERE CORREO LIKE '%hotmail%';

-- funciones de agregacion en sql
-- son funciones de sql que se usan para calculos multiples valores realizados
-- por un select y retorna un unico valor(hay como 8 o 9 funciones de agregacion pero la mas usadas vamos a ver)

-- cuantos correo hay en la tabla alumno cuando correo cumpla esta condicion
-- total de correo siempre manda el total
SELECT count(correo)
FROM ALUMNOS
WHERE CORREO LIKE '%hotmail%';

-- ahora si queremos saber de cada registro cuando es la cantidad que tiene le agregamos group by
-- cuantos correo tiene cada alumno espeficicado podemos decirle x su id, nombre ,etc y a quien le pertenece cada correo
SELECT count(correo),id,nombre
FROM ALUMNOS
WHERE CORREO LIKE '%hotmail%'
group by id;

#cuantas veces se repite el nombre de los alumnos
select count(nombre),nombre
from alumnos
group by nombre;


-- cuantas veces se repiten los nombres de los alumnos y quienes son ordenado de A-Z
-- ordenamiento por los totales los numero asc(a-z) desc(z-a)
-- 1ro ordenas asc los total despues de ordenar los total vas a ordenar asc los nombre 
-- recuerda que el ordenamiento importa xk 1ro se ordena total de alli se ordena nombre
select count(nombre) total,nombre
from alumnos
group by nombre
order by total desc,nombre asc;


-- TRAER NOMBRE_ALUMNO | APELLIDO_ALUMNO | NOMBRE_CURSO | ESTADO_CURSO
-- SE RELACIONA ALUMNOS - ALUMNOS_CURSOS LUEGO ALUMNOS_CURSOS - CURSOS
-- recuerda que el inner join debe estar en los lado id de alumno debe coincidir con el id de alumnos_cursos 
-- debe existir tanto en alumnos y en alumnos_cursos
SELECT A.NOMBRE AS NombreAlumno, A.apellido as ApellidoAlumno, C.NOMBRE AS NombreCurso, C.ESTADO AS EstadoCurso
FROM ALUMNOS AS A
INNER JOIN ALUMNOS_CURSOS AS AC
ON A.ID = AC.ALUMNOS_ID
INNER JOIN CURSOS AS C 
ON AC.CURSOS_ID = C.ID;
 
# cuantos alumnos estan inscrito en cada curso
#QUE ESTE ORDENADO DE MAS A MENOS ALUMNOS
#QUE ME DE LOS CURSOS ORDENADOS ALFABETCAMENTE
SELECT COUNT(ALUMNOS_ID) AS ALUMNOS_INSCRITOS,C.NOMBRE AS NOMBRE_CURSO
FROM ALUMNOS_CURSOS AS AC
INNER JOIN CURSOS AS C
ON C.ID = AC.CURSOS_ID
GROUP BY NOMBRE
ORDER BY 1 DESC,2 ASC;
-- agrupalo x los nombres x favor
-- 1ro agrupamelo los cursos x nombre y despues lo cuentas de cada uno cuantos alumnos tienes
#PODEMOS CAMBIAR EL ORDENAMIENTO CON NRO DE COLUMNAS MAS FACIL
#ORDER BY ALUMNOS_INSCRITOS DESC,NOMBRE_CURSO ASC;

-- datos a ingresar
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Christopher','Hubbard','tracey73@white.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Pamela','Reed','jeffreypatton@andrade.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Douglas','Phillips','lbaker@best.biz');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Kristy','Neal','wilsonthomas@flores.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Daniel','Young','cmaynard@yahoo.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Joshua','Swanson','kennethrichardson@gmail.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('James','Cruz','rlowe@edwards.net');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Brenda','Ayala','frusso@steele.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Krystal','Brennan','rritter@hotmail.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('John','Reyes','smithlisa@orr-stone.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Olivia','Baxter','catherine39@gmail.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Alejandro','Rice','samueljones@davis.org');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Matthew','Lutz','hernandezjohn@yahoo.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Sheila','Pruitt','alexandercrystal@mason-carr.net');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Kenneth','Jennings','pkirby@hotmail.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Kara','Mcclain','tlewis@hotmail.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Angela','Hale','aarontaylor@yahoo.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Lucas','King','amandamunoz@smith.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Richard','Johnson','davidgray@ward-young.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Annette','Ellis','alvaradopatrick@hotmail.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Bryan','Choi','holdenjuan@parrish.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Jose','Gordon','luis44@yahoo.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('David','Ramirez','catherine71@yahoo.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Colin','Cardenas','keith49@wilson-wilson.info');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Patricia','Gilbert','aaronkim@hotmail.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Valerie','Walter','michele27@hotmail.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Taylor','Cuevas','margaret89@ross.org');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('David','Elliott','ycopeland@yahoo.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Elizabeth','Robinson','dmiller@gmail.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Gregory','Johnson','hbecker@gmail.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Jesse','Bell','heatherwells@yahoo.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Amanda','Hughes','gmartinez@gmail.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Jessica','Ross','kmullen@gmail.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Amber','Erickson','lolson@sexton.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Theresa','Bryant','hmontes@gmail.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Douglas','Alvarez','goodmanshannon@beck.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Martin','Johnson','heather65@gmail.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Brittany','Rubio','andrearandall@thomas-adams.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Jamie','Kim','johnsontravis@hotmail.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Samuel','Bailey','luis21@mathis.org');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Misty','Brown','james00@yahoo.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Jake','Jenkins','masonashley@collins.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('David','Jacobs','ronald58@yahoo.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Regina','Brown','onealelizabeth@woods-dyer.net');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('David','Rodgers','jennifer47@chang-hurley.biz');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Natalie','Knight','lbrown@martinez.net');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Alice','Ward','ibyrd@pineda.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Carmen','Cook','ffowler@walsh.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Mary','Carr','cunninghamjames@johnson.com');
INSERT INTO ALUMNOS(NOMBRE,APELLIDO,CORREO) VALUES
    ('Leah','Lane','jamesfuentes@schultz.com');
    
    
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(27,5);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(7,4);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(19,2);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(3,4);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(27,4);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(35,4);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(10,1);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(44,2);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(15,5);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(36,5);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(21,4);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(17,1);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(41,2);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(11,5);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(27,4);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(19,5);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(9,2);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(45,4);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(5,5);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(16,1);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(30,5);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(20,1);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(11,2);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(47,3);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(5,2);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(5,4);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(49,3);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(39,4);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(10,3);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(38,4);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(26,3);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(2,2);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(15,3);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(49,2);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(9,3);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(3,1);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(4,1);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(31,1);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(45,1);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(35,4);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(46,3);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(18,4);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(38,3);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(45,2);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(28,3);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(10,1);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(47,4);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(22,1);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(49,2);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(33,4);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(32,1);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(34,2);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(29,4);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(27,3);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(11,5);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(5,4);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(39,1);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(4,5);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(14,1);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(39,3);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(30,2);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(47,2);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(21,1);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(24,1);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(14,3);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(21,2);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(49,2);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(48,5);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(21,4);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(30,2);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(24,1);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(50,1);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(49,3);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(18,5);
INSERT INTO ALUMNOS_CURSOS(ALUMNOS_ID,CURSOS_ID) VALUES(25,3);
    
