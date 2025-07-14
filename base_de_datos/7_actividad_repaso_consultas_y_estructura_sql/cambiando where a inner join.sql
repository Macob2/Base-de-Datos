use ejemploSelect;

-- 1.-  Mostrar todos los usuarios de tipo Cliente
-- Seleccionar nombre de usuario, correo y tipo_usuario
select u.username, u.email, t.nombre_tipo
from usuarios u inner join tipo_usuarios t on u.id_tipo_usuario = t.id_tipo_usuario where u.id_tipo_usuario = 2;

-- 2.-  Mostrar Personas nacidas despues del año 1990
-- Seleccionar Nombre, fecha de nacimiento y username.
select p.rut, p.nombre_completo, p.fecha_nac, u.username 
from personas p inner join usuarios u on u.id_usuario = p.id_usuario where "1990-01-01" <= fecha_nac;

-- 3.- Seleccionar nombres de personas que comiencen con la 
-- letra A - Seleccionar nombre y correo la persona.
select p.nombre_completo, u.email
from usuarios u inner join personas p on u.id_usuario = p.id_usuario where p.nombre_completo like "A%";

-- 4.- Mostrar usuarios cuyos dominios de correo sean
-- mail.commit LIKE '%mail.com%'
select u.username, u.email, u.id_usuario, p.nombre_completo
from usuarios u inner join personas p on p.id_usuario = u.id_usuario where email like '%mail.com%';

-- 5.- Mostrar todas las personas que no viven en 
 -- Valparaiso y su usuario + ciudad.
 -- select * from ciudad; -- ID 2 VALPARAISO
select u.username, c.nombre_ciudad
from usuarios u inner join personas p on p.id_usuario = u.id_usuario inner join ciudad c on p.id_ciudad = c.id_ciudad where c.id_ciudad != 2;

-- 6.- Mostrar usuarios que contengan más de 7 
-- carácteres de longitud.
select u.username, u.id_usuario, p.nombre_completo,u.email 
from usuarios u inner join personas p on p.id_usuario = u.id_usuario where length(username) > 7;

-- 7.- Mostrar username de personas nacidas entre
-- 1990 y 1995
select u.username, p.fecha_nac
from usuarios u inner join personas p on p.id_usuario = u.id_usuario where p.fecha_nac between "1990-01-01" and "1995-01-01";