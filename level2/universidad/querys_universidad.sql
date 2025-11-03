USE universidad;

-- 1 Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT  p.apellido1, p.apellido2, p.nombre FROM persona p WHERE tipo = 'alumno' ORDER by p.apellido1 ASC , p.apellido2 DESC;
-- 2 Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT apellido1, apellido2 , nombre FROM persona WHERE tipo = 'alumno' AND (telefono = ' ' OR telefono IS NULL);
-- 3 Retorna el llistat dels alumnes que van néixer en 1999.
SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
-- 4 Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';
-- 5 Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT * FROM asignatura WHERE cuatrimestre = '1' AND curso = '3' AND id_grado = '7';
-- 6 Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM persona p JOIN departamento d ON p.id = d.id WHERE p.tipo = 'profesor' ORDER BY p.apellido1 , p.apellido2 , p.nombre ASC;
-- 7 Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM asignatura a JOIN alumno_se_matricula_asignatura m ON a.id = m.id_asignatura JOIN curso_escolar ce ON m.id_curso_escolar = ce.id JOIN persona p ON m.id_alumno = p.id  WHERE p.nif ='26902806M';
-- 8 Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT DISTINCT d.nombre FROM departamento d JOIN profesor p ON p.id_departamento = d.id JOIN asignatura a ON a.id_profesor = p.id_profesor JOIN grado g ON g.id = a.id_grado WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
-- 9 Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT DISTINCT p.* FROM persona p JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno JOIN curso_escolar ce ON am.id_curso_escolar = ce.id WHERE p.tipo = 'alumno' AND ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;

-- 10 Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT d.nombre AS departamento, p.apellido1, p.apellido2, p.nombre FROM persona p JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id ORDER BY d.nombre ASC , p.apellido1 ASC , p.apellido2 ASC , p.nombre ASC;
-- 11 Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT p.* FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_departamento WHERE tipo ='profesor' AND pr.id_departamento IS NULL;
-- 12 Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento  WHERE pr.id_departamento IS NULL;
-- 13 Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT CONCAT(p.nombre,' ',p.apellido1)AS profesor FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo ='profesor' AND a.id IS NULL;
-- 14 Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT a.* FROM asignatura a LEFT JOIN profesor p ON a.id_profesor = p.id_profesor WHERE a.id_profesor IS NULL;
-- 15 Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE a.id IS NULL;
-- 16 Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(*) FROM persona WHERE tipo = 'alumno';
-- 17 Calcula quants alumnes van néixer en 1999.
SELECT COUNT(*) FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
-- 18 Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT d.nombre AS departamento, p.nombre, COUNT(pr.id_profesor) AS total_profesores FROM departamento d JOIN profesor pr ON d.id = pr.id_departamento JOIN persona p ON pr.id_profesor = p.id ORDER BY p.nombre DESC;
-- 19 Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT d.nombre , COUNT(pr.id_profesor) AS profesores FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.id, d.nombre ORDER BY d.nombre ASC;
-- 20 Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT g.nombre, COUNT(a.id) AS num_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id GROUP BY g.nombre ORDER BY num_asignaturas DESC;
-- 21 Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT g.nombre, COUNT(a.id) AS num_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, g.id HAVING COUNT(a.id) > 40 ORDER BY num_asignaturas DESC;
-- 22 Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT g.nombre, a.tipo ,SUM(a.creditos) AS num_creditos FROM grado g JOIN asignatura a ON g.id = a.id_grado GROUP BY a.tipo, g.id, g.nombre ORDER BY g.nombre, a.tipo ASC ;