USE BD_UCV_Notas;
GO

-- Genero
INSERT INTO Genero (idGenero, descripcion) VALUES
(1, 'Masculino'),
(2, 'Femenino'),
(3, 'Otro');

-- EstadoCivil
INSERT INTO EstadoCivil (idEstado, descripcionE) VALUES
(1, 'Soltero'),
(2, 'Casado'),
(3, 'Divorciado');

-- Distrito
INSERT INTO Distrito (idDistrito, descripcionD) VALUES
(1, 'San Juan de Lurigancho'),
(2, 'Miraflores'),
(3, 'Los Olivos');

-- CondicionSocioEconomica
INSERT INTO CondicionSocioEconomica (idCondicionSE, descripcionCon) VALUES
(1, 'Alta'),
(2, 'Media'),
(3, 'Baja');

-- CategoriaEstudiante
INSERT INTO CategoriaEstudiante (idCategoriaE, descripcionCE) VALUES
(1, 'Regular'),
(2, 'Becado'),
(3, 'Extraordinario');

-- Facultad
INSERT INTO Facultad (idFacultad, descripcionFa) VALUES
(1, 'Ingeniería'),
(2, 'Derecho'),
(3, 'Psicología');

-- Unidad
INSERT INTO Unidad (idUnidad, descripcionU) VALUES
('1', 'Unidad I'),
('2', 'Unidad II'),
('3', 'Unidad III');

-- Tipo
INSERT INTO Tipo (idTipo, descripcion) VALUES
(1, 'Examen'),
(2, 'Práctica'),
(3, 'Proyecto');

-- CategoriaCurso
INSERT INTO CategoriaCurso (idCategoriaCurso, descripcionCC) VALUES
(1, 'Obligatorio'),
(2, 'Electivo'),
(3, 'Libre');

-- Ciclo
INSERT INTO Ciclo (idCiclo, decripcion) VALUES
(1, '2023-II'),
(2, '2023-I'),
(3, '2024-II');

-- Turno
INSERT INTO Turno (idTurno, descripcion) VALUES
(1, 'Mañana'),
(2, 'Tarde'),
(3, 'Noche');

-- Pabellon
INSERT INTO Pabellon (idPabellon, descripcion) VALUES
(1, 'Pabellón A'),
(2, 'Pabellón B'),
(3, 'Pabellón C');


-- Carrera (requiere Facultad)
INSERT INTO Carrera (idCarrera, nombreCarrera, idFacultad) VALUES
(1, 'Ingeniería de Sistemas', 1),
(2, 'Derecho Penal', 2),
(3, 'Psicología Clínica', 3);

-- Estudiante (requiere varias FK)
INSERT INTO Estudiante (
    CodigoE, dniE, nombresE, apellidosE, idGenero, correo,
    idEstado, celular, direccion, idDistrito,
    idCondicionSE, idCategoriaE, idCarrera
) VALUES
('2001', '12345678', 'Carlos', 'Pérez', 1, 'carlos@mail.com', 1, '987654321', 'Av. Siempre Viva 123', 1, 2, 1, 1),
('2002', '87654321', 'Lucía', 'Gómez', 2, 'lucia@mail.com', 2, '987654322', 'Calle Falsa 456', 2, 3, 2, 2),
('2003', '11223344', 'Miguel', 'Torres', 1, 'miguel@mail.com', 1, '987654323', 'Av. Primavera 789', 3, 1, 3, 3),
('2004', '32165498', 'Juan', 'Lopez', 1, 'juan@mail.com', 1, '987111111', 'Av. Central 100', 1, 2, 1, 1),
('2005', '32165499', 'María', 'Flores', 2, 'maria@mail.com', 2, '987111112', 'Jr. Las Rosas 200', 2, 3, 2, 2),
('2006', '32165500', 'Pedro', 'Martínez', 1, 'pedro@mail.com', 1, '987111113', 'Av. Norte 300', 3, 1, 3, 3),
('2007', '32165501', 'Elena', 'Salas', 2, 'elena@mail.com', 3, '987111114', 'Av. Sur 400', 1, 2, 1, 1),
('2008', '32165502', 'Luis', 'Torreblanca', 1, 'luis@mail.com', 1, '987111115', 'Jr. Luna 500', 2, 2, 1, 1);




-- Profesor (requiere Genero, EstadoCivil, Distrito)
INSERT INTO Profesor (
    codigoD, dniProf, nombresD, apellidosD, idGenero, idEstado,
    correo, celular, direccion, idDistrito
) VALUES
('1001', '44556677', 'Ana', 'Ramírez', 2, 2, 'ana@mail.com', '998877665', 'Av. Las Flores 789', 1),
('1002', '55667788', 'Luis', 'García', 1, 1, 'luis@mail.com', '998877664', 'Calle Luna 456', 2),
('1003', '66778899', 'Elena', 'Ponce', 2, 3, 'elena@mail.com', '998877663', 'Calle Sol 123', 3);


-- Curso (requiere CategoriaCurso, Ciclo)
INSERT INTO Curso (idCurso, NombreCurso, NumeroCreditos, idCategoriaCurso, idCiclo) VALUES
(1, 'Competencia Comunicativa', 4, 1, 1),
(2, 'Matemática I', 3, 1, 2),
(3, 'Pensamiento Lógico', 4, 2, 1),
(4, 'Programación I', 4, 1, 1),
(5, 'Estadística', 3, 1, 2),
(6, 'Psicología General', 4, 2, 1),
(7, 'Derecho Constitucional', 4, 1, 2),
(8, 'Filosofía', 3, 2, 1);


-- Matricula (requiere Estudiante)
INSERT INTO Matricula (idMatricula, CodigoE) VALUES
(1, '2001'),
(2, '2002'),
(3, '2003'),
(4, '2004'),
(5, '2005'),
(6, '2006'),
(7, '2007'),
(8, '2008');

-- DetalleMatricula (requiere Matricula, Curso, Profesor, Turno, Pabellon)
INSERT INTO DetalleMatricula (
    idDetalleMatricula, idMatricula, idCurso, codigoD, fechaInicio,
    fechaTermino, idTurno, aula, idPabellon
) VALUES
(1, 1, 1, '1001', '2025-03-01', '2025-07-01', 1, 'A101', 1),
(2, 2, 2, '1002', '2025-03-01', '2025-07-01', 2, 'B202', 2),
(3, 3, 3, '1003', '2025-03-01', '2025-07-01', 3, 'C303', 3),
(4, 4, 4, '1001', '2025-03-01', '2025-07-01', 1, 'A102', 1),
(5, 5, 5, '1002', '2025-03-01', '2025-07-01', 2, 'B203', 2),
(6, 6, 6, '1003', '2025-03-01', '2025-07-01', 3, 'C304', 3),
(7, 7, 7, '1001', '2025-03-01', '2025-07-01', 1, 'A103', 1),
(8, 8, 8, '1002', '2025-03-01', '2025-07-01', 2, 'B204', 2);


-- Notas (requiere DetalleMatricula)
INSERT INTO Notas (idNota, idDetalleMatricula) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);
-- DetalleNota (requiere Notas, Unidad, Tipo)
INSERT INTO DetalleNota (idDetalleNota, idNota, idUnidad, idTipo, nota) VALUES
(1, 1, 1, 1, 14.5),
(2, 1, 2, 2, 16.0),
(3, 1, 3, 3, 17.5),
(4, 2, 1, 1, 13.0),
(5, 2, 2, 2, 14.0),
(6, 2, 3, 3, 15.0),
(7, 3, 1, 1, 18.0),
(8, 3, 2, 2, 17.0),
(9, 3, 3, 3, 16.5),
(10, 4, 1, 1, 15.0),
(11, 4, 2, 2, 14.5),
(12, 4, 3, 3, 16.0),
(13, 5, 1, 1, 13.5),
(14, 5, 2, 2, 15.0),
(15, 5, 3, 3, 16.5),
(16, 6, 1, 1, 17.0),
(17, 6, 2, 2, 16.0),
(18, 6, 3, 3, 18.0),
(19, 7, 1, 1, 14.0),
(20, 7, 2, 2, 15.0),
(21, 7, 3, 3, 13.0),
(22, 8, 1, 1, 12.5),
(23, 8, 2, 2, 19.0),
(24, 8, 3, 3, 19.0);

select * from DetalleNota;


