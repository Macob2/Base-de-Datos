-- Creación de la base de datos
create database ejemploSelect;
USE ejemploSelect;

-- Tabla: tipo_usuarios
CREATE TABLE tipo_usuarios (
    id_tipo_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipo varchar (60) not null CHECK (nombre_tipo IN ('Administrador', 'Cliente', 'Moderador')), -- Restringe el valor de la columna nombre_tipo a solo tres opciones
    descripcion_tipo VARCHAR(50) NOT NULL,
    nivel_acceso TINYINT CHECK (nivel_acceso BETWEEN 1 AND 3), -- Asegura que el valor de nivel_acceso esté entre 1 y 3, estos representando si es un admin, cliente o moderador 
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP
	ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
    creado_por int,
	actualizado_por int,
	deleted bool default false
);

-- Tabla: usuarios (se añade campo created_at con valor por defecto)
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    username VARCHAR(100) NOT NULL unique,
    contraseña VARCHAR(200) NOT NULL CHECK (CHAR_LENGTH(contraseña) >= 4),  -- Verifica que la contraseña tenga al menos 4 caracteres.
    email VARCHAR(100) NOT NULL UNIQUE, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_usuario INT,
	fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
	creado_por int,
	actualizado_por int,
    deleted BOOLEAN DEFAULT false,
	CONSTRAINT fk_usuarios_tipo_usuarios FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuarios(id_tipo_usuario)
);

-- Tabla: ciudad (nueva)
CREATE TABLE ciudad (
    id_ciudad INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre_ciudad VARCHAR(100) NOT NULL check (CHAR_LENGTH(nombre_ciudad) >= 6), -- Asegura que el nombre de la ciudad tenga al menos 6 caracteres.
    region VARCHAR(100),
	fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP
	ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
    creado_por int,
	actualizado_por int,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	deleted bool default false
);

-- Tabla: personas (relacionada con usuarios y ciudad)
CREATE TABLE personas (
    rut VARCHAR(13) NOT NULL unique CHECK (CHAR_LENGTH(rut) <= 13), -- Asegura que el campo rut (que generalmente representa un documento de identidad) no tenga más de 13 caracteres
    nombre_completo VARCHAR(100) NOT NULL ,
    fecha_nac DATE,
    id_usuario INT,
    id_ciudad INT,
	fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP
	ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
    creado_por int,
	actualizado_por int,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	deleted bool default false,
	CONSTRAINT fk_personas_usuarios FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    CONSTRAINT fk_personas_ciudad FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
);
