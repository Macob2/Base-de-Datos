USE sistema_ventas2;

create table Productos(
id_Producto int auto_increment primary key,
nombre_producto varchar(50),
precio varchar(40),
stock int,
created_at datetime default current_timestamp,
updated_at datetime default current_timestamp
on update current_timestamp,
created_by int,
updated_by int,
deleted bool default false
);

create table Ventas(
id_Venta int auto_increment primary key,
usuario_id int,
fecha datetime,
updated_at datetime default current_timestamp
on update current_timestamp,
created_by int,
updated_by int,
deleted bool default false
);

create table Detalle_Ventas(
id_Detalle_Venta int auto_increment primary key,
venta_id int,
producto_id int,
cantidad int,
precio_unitario int,
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
