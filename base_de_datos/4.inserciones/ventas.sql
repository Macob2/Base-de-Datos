

USE sistema_ventas2;

create table Productos(
id_Producto int auto_increment primary key not null,
nombre_producto varchar(50) not null,
descripcion varchar (200) not null,
precio varchar(40) not null,
stock int not null,
created_at datetime default current_timestamp,
updated_at datetime default current_timestamp
on update current_timestamp,
created_by int,
updated_by int,
deleted bool default false
);

create table Ventas(
id_Venta int auto_increment primary key not null,
usuario_id int not null,
fecha datetime not null,
updated_at datetime default current_timestamp
on update current_timestamp,
created_by int,
updated_by int,
deleted bool default false
);

create table Detalle_Ventas(
id_Detalle_Venta int auto_increment primary key not null,
venta_id int not null,
producto_id int not null,
cantidad int not null,
updated_at datetime default current_timestamp
on update current_timestamp,
created_by int,
updated_by int,
deleted bool default false
);

ALTER TABLE Ventas 
-- Modificar tabla
-- Agregar una restricción (FK)

ADD CONSTRAINT fk_Ventas_usuarios

-- Añade referencia(FK)

FOREIGN KEY (usuario_id) REFERENCES
usuarios(id_usuario);

ALTER TABLE Detalle_Ventas 
-- Modificar tabla
-- Agregar una restricción (FK)

ADD CONSTRAINT fk_Detalle_Ventas_Ventas

-- Añade referencia(FK)

FOREIGN KEY (Venta_id) REFERENCES
Ventas(id_Venta);

ALTER TABLE Detalle_Ventas 
-- Modificar tabla
-- Agregar una restricción (FK)

ADD CONSTRAINT fk_Detalle_Ventas_Productos

-- Añade referencia(FK)

FOREIGN KEY (Producto_id) REFERENCES
Productos(id_Producto);

INSERT INTO Productos (nombre_producto, descripcion, precio, stock, created_by, updated_by
)VALUES (
	'Peras',
    'Un kg de peras',
    1300,
    35,
    1,
    1
),(
	'Manzanas',
    'Un kg de manzanas rojas',
    1500,
    30,
    1,
    1
),(
	'Naranjas',
    'Un kg de naranjas',
    1300,
    25,
    1,
    1
);

INSERT INTO Ventas (fecha, created_by, updated_by, usuario_id
) VALUES (
	now(),
    1,
    1,
    2
),(
	now(),
    1,
    1,
    3
);

INSERT INTO Detalle_Ventas (cantidad, created_by, updated_by, venta_id, producto_id
)VALUES (
	25,
    1,
    1,
    1,
    3
),(
	20,
    1,
    1,
	1,
    2
),(
	5,
    1,
    1,
	2,
    1
),(
	60,
    1,
    1,
	2,
    2
);

