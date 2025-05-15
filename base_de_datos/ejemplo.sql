create database sistema_ventas2;
-- Seleccionar la base de datos para trabajar
USE sistema_ventas2;
-- Creamos la tabla tipo_usuario
CREATE TABLE tipo_usuarios (
id_tipo INT AUTO_INCREMENT PRIMARY KEY,
-- Identificador único

descripcion_tipo varchar (200) not null,

nombre_tipo VARCHAR(50) NOT NULL,
-- Tipo de usuario (Admin, Cliente)
-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
-- Fecha creación

updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación

created_by INT,-- Usuario que crea

updated_by INT,-- Usuario que modifica

deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);

-- Tabla para usuarios

CREATE TABLE usuarios (

id_usuario INT AUTO_INCREMENT PRIMARY KEY not null, -- Id único

nombre_tipo VARCHAR(100) NOT NULL, -- Nombre de usuario

contraseña varchar (200) not null,

correo VARCHAR(100) UNIQUE not null, -- Correo electrónico único

tipo_usuario_id INT, -- Relación a tipo_usuario

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
-- Fecha creación

updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación

created_by INT,-- Usuario que crea

updated_by INT,-- Usuario que modifica

deleted BOOLEAN DEFAULT FALSE -- Borrado lógico

);

ALTER TABLE usuarios 
-- Modificar tabla
-- Agregar una restricción (FK)

ADD CONSTRAINT fk_usuarios_tipo_usuarios

-- Añade referencia(FK)

FOREIGN KEY (tipo_usuario_id) REFERENCES
tipo_usuarios(id_tipo);


INSERT INTO tipo_usuarios (
    nombre_tipo,
    descripcion_tipo,
    created_by,
    updated_by
)
VALUES (
    'Administrador',
    'Accede a todas las funciones del sistema, incluida la administración de usuarios.',
    1, -- creado por el usuario inicial
    1  -- actualizado por el mismo
),(
	'Vendedor',
	'Se encarga de las ventas de frutas',
    1,
    1
);


INSERT INTO usuarios (
    nombre_tipo, contraseña, correo, tipo_usuario_id, created_by, updated_by
)
VALUES (
    'sistema',
    '$2y$10$2pEjT0G2k9YzHs1oZ.abcde3Y8GkmHfvhO1/abcxyz', -- Contraseña encriptada (ejemplo realista con bcrypt)
    'sistema@plataforma.cl',
    NULL,
    NULL,
    NULL
),(
	'Vendedor "Juan"',
    'Juan1234',
    'juan@gmail.com',
    2,
    1,
    1
),(
	'Vendedor "Alexander"',
    'Alexander12345',
    'Alexander@gmail.com',
    2,
    1,
    1
);
