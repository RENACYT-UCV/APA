USE pruebaBI;
GO
-- Insertar LUEGO DE GENERAR TABLAS CON BACKEND
INSERT INTO genero (idGenero, descripcion) VALUES 
('M', 'Masculino'),
('F', 'Femenino');

-- Insertar Estado Civil
INSERT INTO estadocivil (idEstado, descripcionE) VALUES 
('S', 'Soltero'),
('C', 'Casado');

-- Insertar Distritos
INSERT INTO distrito (idDistrito, nombre_Di) VALUES 
(1, 'Lima'),
(2, 'Callao');

-- Insertar Tipos
INSERT INTO tipo (idTipo, descripcion) VALUES 
(1, 'Docente'),
(2, 'Administrativo');

-- Insertar Personal
INSERT INTO personal (
    idPersonal, dniPers, nombresP, apellidosP, correo, celular, direccion, 
    idGenero, idEstado, idDistrito, idTipo
) VALUES 
(1001, '12345678', 'Juan', 'P�rez', 'juan.perez@correo.com', '987654321', 'Av. Siempre Viva 123', 
 'M', 'S', 1, 1);

