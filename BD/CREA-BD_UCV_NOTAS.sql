-- Crear la base de datos (verifica antes de crearla manualmente si existe)
IF NOT EXISTS (
    SELECT name FROM sys.databases WHERE name = 'BD_UCV_Notas'
)
BEGIN
    CREATE DATABASE BD_UCV_Notas;
END
GO

USE BD_UCV_Notas;
GO

-- Tabla: Genero
CREATE TABLE Genero (
    idGenero INT PRIMARY KEY,
    descripcion VARCHAR(50)
);

-- Tabla: EstadoCivil
CREATE TABLE EstadoCivil (
    idEstado INT PRIMARY KEY,
    descripcionE VARCHAR(50)
);

-- Tabla: Distrito
CREATE TABLE Distrito (
    idDistrito INT PRIMARY KEY,
    descripcionD VARCHAR(50)
);

-- Tabla: CondicionSocioEconomica
CREATE TABLE CondicionSocioEconomica (
    idCondicionSE INT PRIMARY KEY,
    descripcionCon VARCHAR(50)
);

-- Tabla: CategoriaEstudiante
CREATE TABLE CategoriaEstudiante (
    idCategoriaE INT PRIMARY KEY,
    descripcionCE VARCHAR(100)
);

-- Tabla: Facultad
CREATE TABLE Facultad (
    idFacultad INT PRIMARY KEY,
    descripcionFa VARCHAR(100)
);

-- Tabla: Carrera
CREATE TABLE Carrera (
    idCarrera INT PRIMARY KEY,
    nombreCarrera VARCHAR(100),
    idFacultad INT,
    FOREIGN KEY (idFacultad) REFERENCES Facultad(idFacultad)
);

-- Tabla: Estudiante
CREATE TABLE Estudiante (
    CodigoE INT PRIMARY KEY,
    dniE VARCHAR(15),
    nombresE VARCHAR(100),
    apellidosE VARCHAR(100),
    idGenero INT,
    correo VARCHAR(100),
    idEstado INT,
    celular VARCHAR(20),
    direccion VARCHAR(200),
    idDistrito INT,
    idCondicionSE INT,
    idCategoriaE INT,
    idCarrera INT,
    FOREIGN KEY (idGenero) REFERENCES Genero(idGenero),
    FOREIGN KEY (idEstado) REFERENCES EstadoCivil(idEstado),
    FOREIGN KEY (idDistrito) REFERENCES Distrito(idDistrito),
    FOREIGN KEY (idCondicionSE) REFERENCES CondicionSocioEconomica(idCondicionSE),
    FOREIGN KEY (idCategoriaE) REFERENCES CategoriaEstudiante(idCategoriaE),
    FOREIGN KEY (idCarrera) REFERENCES Carrera(idCarrera)
);

-- Tabla: Profesor
CREATE TABLE Profesor (
    codigoD INT PRIMARY KEY,
    dniProf VARCHAR(15),
    nombresD VARCHAR(100),
    apellidosD VARCHAR(100),
    idGenero INT,
    idEstado INT,
    correo VARCHAR(100),
    celular VARCHAR(20),
    direccion VARCHAR(200),
    idDistrito INT,
    FOREIGN KEY (idGenero) REFERENCES Genero(idGenero),
    FOREIGN KEY (idEstado) REFERENCES EstadoCivil(idEstado),
    FOREIGN KEY (idDistrito) REFERENCES Distrito(idDistrito)
);

-- Tabla: Unidad
CREATE TABLE Unidad (
    idUnidad varchar(2) PRIMARY KEY,
    descripcionU VARCHAR(100)
);

-- Tabla: Tipo
CREATE TABLE Tipo (
    idTipo INT PRIMARY KEY,
    descripcion VARCHAR(100)
);

-- Tabla: CategoriaCurso
CREATE TABLE CategoriaCurso (
    idCategoriaCurso INT PRIMARY KEY,
    descripcionCC VARCHAR(100)
);

-- Tabla: Ciclo
CREATE TABLE Ciclo (
    idCiclo INT PRIMARY KEY,
    decripcion VARCHAR(50)
);

-- Tabla: Curso
CREATE TABLE Curso (
    idCurso INT PRIMARY KEY,
    NombreCurso VARCHAR(100),
    NumeroCreditos INT,
    idCategoriaCurso INT,
    idCiclo INT,
    FOREIGN KEY (idCategoriaCurso) REFERENCES CategoriaCurso(idCategoriaCurso),
    FOREIGN KEY (idCiclo) REFERENCES Ciclo(idCiclo)
);

-- Tabla: Turno
CREATE TABLE Turno (
    idTurno INT PRIMARY KEY,
    descripcion VARCHAR(50)
);

-- Tabla: Pabellon
CREATE TABLE Pabellon (
    idPabellon INT PRIMARY KEY,
    descripcion VARCHAR(100)
);

-- Tabla: Matricula
CREATE TABLE Matricula (
    idMatricula INT PRIMARY KEY,
    CodigoE int,
    FOREIGN KEY (CodigoE) REFERENCES Estudiante(CodigoE)
);

-- Tabla: DetalleMatricula
CREATE TABLE DetalleMatricula (
    idDetalleMatricula INT PRIMARY KEY,
    idMatricula INT,
    idCurso INT,
    codigoD int,
    fechaInicio DATE,
    fechaTermino DATE,
    idTurno INT,
    aula VARCHAR(20),
    idPabellon INT,
    FOREIGN KEY (idMatricula) REFERENCES Matricula(idMatricula),
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso),
    FOREIGN KEY (codigoD) REFERENCES Profesor(codigoD),
    FOREIGN KEY (idTurno) REFERENCES Turno(idTurno),
    FOREIGN KEY (idPabellon) REFERENCES Pabellon(idPabellon)
);

-- Tabla: Notas
CREATE TABLE Notas (
    idNota INT PRIMARY KEY,
    idDetalleMatricula INT,
    FOREIGN KEY (idDetalleMatricula) REFERENCES DetalleMatricula(idDetalleMatricula)
);

-- Tabla: DetalleNota
CREATE TABLE DetalleNota (
    idDetalleNota INT PRIMARY KEY,
    idNota INT,
    idUnidad varchar(2),
    idTipo INT,
    nota FLOAT,
    FOREIGN KEY (idNota) REFERENCES Notas(idNota),
    FOREIGN KEY (idUnidad) REFERENCES Unidad(idUnidad),
    FOREIGN KEY (idTipo) REFERENCES Tipo(idTipo)
);

