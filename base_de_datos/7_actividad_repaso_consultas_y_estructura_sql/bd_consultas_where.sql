
-- 1.-  Mostrar todos los usuarios de tipo Cliente
-- Seleccionar nombre de usuario, correo y tipo_usuario
select u.username, u.email, t.nombre_tipo
from usuarios u, tipo_usuarios t where u.id_tipo_usuario = 2 and u.id_tipo_usuario = t.id_tipo_usuario;

-- 2.-  Mostrar Personas nacidas despues del año 1990
-- Seleccionar Nombre, fecha de nacimiento y username.
select p.rut, p.nombre_completo, p.fecha_nac, u.username 
from personas p, usuarios u where "1990-01-01" <= fecha_nac and u.id_usuario = p.id_usuario;

-- 3.- Seleccionar nombres de personas que comiencen con la 
-- letra A - Seleccionar nombre y correo la persona.
select p.nombre_completo, u.email
from personas p, usuarios u where nombre_completo like "A%" and u.id_usuario = p.id_usuario;

-- 4.- Mostrar usuarios cuyos dominios de correo sean
-- mail.commit LIKE '%mail.com%'
select username, email, id_usuario
from usuarios where email like '%mail.com%';

-- 5.- Mostrar todas las personas que no viven en 
 -- Valparaiso y su usuario + ciudad.
 -- select * from ciudad; -- ID 2 VALPARAISO
select u.id_usuario, c.nombre_ciudad
from usuarios u, ciudad c, personas p where c.id_ciudad != 2 and p.id_ciudad = c.id_ciudad and p.id_usuario = u.id_usuario;

-- 6.- Mostrar usuarios que contengan más de 7 
-- carácteres de longitud.
select username 
from usuarios where length(username) > 7;

-- 7.- Mostrar username de personas nacidas entre
-- 1990 y 1995
select u.username, p.fecha_nac
from usuarios u, personas p where fecha_nac between "1990-01-01" and "1995-01-01" and p.id_usuario = u.id_usuario;