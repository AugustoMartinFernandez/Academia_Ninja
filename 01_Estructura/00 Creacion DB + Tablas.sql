-- https://naruto.fandom.com/es/wiki/
-- Creamos la base de datos
CREATE DATABASE AcademiaNinja;
GO
-- Usamos esta base
USE AcademiaNinja;
GO

-- TABLAS INDEPENDIENTES
-- 1. Paises 
CREATE TABLE Paises(
    IdPais INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Paises PRIMARY KEY (IdPais),
    CONSTRAINT UQ_Pais_Nombre UNIQUE (Nombre)  -- no se repite un pais
);

-- 2. Aldeas 
CREATE TABLE Aldeas(
    IdAldea INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    IdPais INT NOT NULL,
    NombreOficial VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Aldeas PRIMARY KEY (IdAldea),
    CONSTRAINT UQ_Aldea_Nombre UNIQUE(Nombre),  -- no puede haber dos aldeas con el mismo nombre
    CONSTRAINT UQ_Aldea_NombreOficial UNIQUE(NombreOficial),
    CONSTRAINT FK_Aldeas_Paises FOREIGN KEY (IdPais) REFERENCES Paises(IdPais)
);

-- 3. Rangos Genin, Chunin, Jonin, etc
CREATE TABLE Rangos(
    IdRango INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    NivelPrioridad INT NOT NULL, -- numero para ordenar la jerarquia, mas alto = mas importante
    CONSTRAINT PK_Rangos PRIMARY KEY (IdRango),
    CONSTRAINT UQ_Rango_Nombre UNIQUE (Nombre),
    CONSTRAINT CHK_Prioridad CHECK (NivelPrioridad > 0)
);

-- 4. Dificultades de la mision (D, C, B, A, S)
CREATE TABLE Dificultades(
    IdDificultad INT IDENTITY(1,1) NOT NULL,
    Codigo CHAR(1) NOT NULL,
    CONSTRAINT PK_Dificultades PRIMARY KEY(IdDificultad),
    CONSTRAINT UQ_Dificultad_Codigo UNIQUE(Codigo)
);

-- 5. Elementos (Fuego, Agua, Rayo, etc.)
CREATE TABLE Elementos (
    IdElemento INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Elementos PRIMARY KEY (IdElemento),
    CONSTRAINT UQ_Elemento_Nombre UNIQUE (Nombre)
);


-- TABLAS DEPENDIENTES 
-- 6. Ninjas (tienen FK a Rangos y a Aldeas)
CREATE TABLE Ninjas(
    IdNinja INT IDENTITY(100,1) NOT NULL,  -- arrancamos en 100 para que los id se vean mas claros
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    IdRango INT NOT NULL,
    IdAldea INT NOT NULL,
    Estado BIT NOT NULL DEFAULT 1, -- 1 = activo, 0 = baja logica
    CONSTRAINT PK_Ninjas PRIMARY KEY(IdNinja),
    CONSTRAINT FK_Ninjas_Rangos FOREIGN KEY(IdRango) REFERENCES Rangos(IdRango),
    CONSTRAINT FK_Ninjas_Aldeas FOREIGN KEY(IdAldea) REFERENCES Aldeas(IdAldea)
);

-- 7. Jutsus (tienen FK a Elementos)
CREATE TABLE Jutsus (
    IdJutsu INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    IdElemento INT NOT NULL,
    Descripcion VARCHAR(MAX) NULL,
    CONSTRAINT PK_Jutsus PRIMARY KEY (IdJutsu),
    CONSTRAINT UQ_Jutsu_Nombre UNIQUE (Nombre),
    CONSTRAINT FK_Jutsus_Elementos FOREIGN KEY (IdElemento) REFERENCES Elementos(IdElemento)
);

-- 8. Misiones (la recompensa vive aca, una sola por mision)
CREATE TABLE Misiones (
    IdMision INT IDENTITY(1,1) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    IdDificultad INT NOT NULL,
    Recompensa MONEY NOT NULL,
    CONSTRAINT PK_Misiones PRIMARY KEY (IdMision),
    CONSTRAINT FK_Misiones_Dificultades FOREIGN KEY (IdDificultad) REFERENCES Dificultades(IdDificultad)
);

-- 9. Equipos (el sensei es un ninja, por eso la FK va a Ninjas)
CREATE TABLE Equipos(
    IdEquipo INT IDENTITY(1,1) NOT NULL,
    NombreEquipo VARCHAR(50) NOT NULL,
    IdSensei INT NOT NULL, -- el lider del equipo, tiene que ser un ninja de rango Jonin
    CONSTRAINT PK_Equipos PRIMARY KEY(IdEquipo),
    CONSTRAINT UQ_Equipo_Nombre UNIQUE(NombreEquipo),
    CONSTRAINT FK_EquipoSensei FOREIGN KEY(IdSensei) REFERENCES Ninjas(IdNinja)
);

-- TABLAS INTERMEDIAS 
-- 10. NinjaHabilidades (relacion muchos a muchos entre Ninjas y Jutsus)
CREATE TABLE NinjaHabilidades (
    IdNinja INT NOT NULL,
    IdJutsu INT NOT NULL,
    NivelMaestria INT DEFAULT 1,  -- del 1 al 10
    CONSTRAINT PK_NinjaHabilidades PRIMARY KEY (IdNinja, IdJutsu),  -- clave compuesta
    CONSTRAINT FK_Habilidades_Ninja FOREIGN KEY (IdNinja) REFERENCES Ninjas(IdNinja),
    CONSTRAINT FK_Habilidades_Jutsu FOREIGN KEY (IdJutsu) REFERENCES Jutsus(IdJutsu),
    CONSTRAINT CHK_Maestria CHECK (NivelMaestria BETWEEN 1 AND 10)
);

-- 11. EquipoDetalle (los alumnos de cada equipo)
CREATE TABLE EquipoDetalle (
    IdEquipo INT NOT NULL,
    IdNinja INT NOT NULL,
    CONSTRAINT PK_EquipoDetalle PRIMARY KEY (IdEquipo, IdNinja),  -- clave compuesta equipo + ninja
    CONSTRAINT FK_Detalle_Equipo FOREIGN KEY (IdEquipo) REFERENCES Equipos(IdEquipo),
    CONSTRAINT FK_Detalle_Ninja FOREIGN KEY (IdNinja) REFERENCES Ninjas(IdNinja)
);

-- 12. Asignaciones (une un equipo con una mision, la asignacion es al equipo)
CREATE TABLE Asignaciones (
    IdAsignacion INT IDENTITY(1,1) NOT NULL,
    IdMision INT NOT NULL,
    IdEquipo INT NOT NULL,
    FechaInicio DATETIME NOT NULL DEFAULT GETDATE(),
    FechaFin DATETIME NULL,  -- queda en null mientras la mision esta en curso
    Estado VARCHAR(20) NOT NULL DEFAULT 'En Curso',
    CONSTRAINT PK_Asignaciones PRIMARY KEY (IdAsignacion),
    CONSTRAINT FK_Asignaciones_Misiones FOREIGN KEY (IdMision) REFERENCES Misiones(IdMision),
    CONSTRAINT FK_Asignaciones_Equipos FOREIGN KEY (IdEquipo) REFERENCES Equipos(IdEquipo),
    CONSTRAINT CHK_EstadoMision CHECK (Estado IN ('En Curso', 'Completada', 'Fallida'))
);

-- 13. AuditoriaNinjas (guardamos los cambios que se hacen sobre los ninjas)
CREATE TABLE AuditoriaNinjas (
    IdLog INT IDENTITY(1,1) NOT NULL,
    IdNinja INT NOT NULL,
    Accion VARCHAR(50),  -- 'ALTA', 'MODIFICACION' o 'BAJA LOGICA'
    Fecha DATETIME DEFAULT GETDATE(),
    CONSTRAINT PK_AuditoriaNinjas PRIMARY KEY (IdLog)
);