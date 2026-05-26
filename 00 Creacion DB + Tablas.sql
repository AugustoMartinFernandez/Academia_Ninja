-- 1. Creamos la base de datos
CREATE DATABASE AcademiaNinja;
GO


USE AcademiaNinja;
GO

-- https://animemanganaruto.fandom.com/es/wiki/Aldea_Oculta
-- 2. Tabla de Aldeas
CREATE TABLE Aldeas(
    IdAldea INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Pais VARCHAR(50) NOT NULL,
    NombreOficial VARCHAR(100) NULL,
    CONSTRAINT PK_Aldeas PRIMARY KEY (IdAldea),
    CONSTRAINT UQ_Aldea_Nombre UNIQUE(Nombre),
    CONSTRAINT UQ_Aldea_NombreOficial UNIQUE(NombreOficial)
     -- No puede haber dos aldeas con el mismo nombre 

);

-- https://naruto.fandom.com/es/wiki/Categor%C3%ADa:Rangos_Ninja
-- 3. Tabla de Rangos Ninja (Genin, Chunin etc.)
CREATE TABLE Rangos(
    IdRango INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    NivelPrioridad INT NOT NULL, -- Para lógica de NINJAS Jonin=3, Genin=1
    CONSTRAINT PK_Rangos PRIMARY KEY (IdRango),
    CONSTRAINT UQ_Rango_Nombre UNIQUE (Nombre),
    CONSTRAINT CHK_Prioridad CHECK (NivelPrioridad > 0)
);

-- https://naruto.fandom.com/es/wiki/Misiones <-- Leer 
-- 4. Tabla Dificultades de Mision (D,C,B,A,S)
CREATE TABLE Dificultades(
    IdDificultad INT IDENTITY(1,1) NOT NULL,
    Codigo CHAR(1) NOT NULL, -- D,C, ETC
    RecompensaBase MONEY NOT NULL,
    CONSTRAINT PK_Dificultades PRIMARY KEY(IdDificultad),
    CONSTRAINT UQ_Dificultad_Codigo UNIQUE(Codigo),
    CONSTRAINT CHK_Recompensa CHECK (RecompensaBase >= 0)
);

-- https://animemanganaruto.fandom.com/es/wiki/Aldea_Oculta 
-- 5. Tabla de Elementos (Fuego, Agua, etc.)
CREATE TABLE Elementos (
    IdElemento INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Elementos PRIMARY KEY (IdElemento),
    CONSTRAINT UQ_Elemento_Nombre UNIQUE (Nombre)
);

-- https://naruto.fandom.com/es/wiki/Sistema_de_Jerarqu%C3%ADa_Shinobi 
-- 6. Tabla de Ninjas
CREATE TABLE Ninjas(
    IdNinja INT IDENTITY(100,1) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    FechaNacimiento DATe NOT NULL,
    IdRango INT NOT NULL,
    IdAldea INT NOT NULL,
    Estado BIT NOT NULL DEFAULT 1, -- 1= Activo, 0 = Baja Logica
    CONSTRAINT PK_Ninjas PRIMARY KEY(IdNinja),
    CONSTRAINT FK_Ninjas_Rangos FOREIGN KEY(IdRango) REFERENCES Rangos(IdRango),
    CONSTRAINT FK_Ninjas_Aldeas FOREIGN KEY(IdAldea) REFERENCES Aldeas(IdAldea)
);

-- 7. Tabla de Equipos
CREATE TABLE Equipos(
    IdEquipo INT IDENTITY(1,1) NOT NULL,
    NombreEquipo VARCHAR(50) NOT NULL,
    IdSensei INT NOT NULL, -- El lider del equipo (debe ser rango Jonin, lo validaremos con un Trigger)
    CONSTRAINT PK_Equipos PRIMARY KEY(IdEquipo),
    CONSTRAINT UQ_Equipo_Nombre UNIQUE(NombreEquipo),
    CONSTRAINT FK_EquipoSensei FOREIGN KEY(IdSensei) REFERENCES Ninjas(IdNinja)
);

-- 8. Tabla de Misiones
CREATE TABLE Misiones (
    IdMision INT IDENTITY(1,1) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    IdDificultad INT NOT NULL,
    Recompensa MONEY NOT NULL,
    CONSTRAINT PK_Misiones PRIMARY KEY (IdMision),
    CONSTRAINT FK_Misiones_Dificultades FOREIGN KEY (IdDificultad) REFERENCES Dificultades(IdDificultad)
);

-- 9. Tabla de Asignaciones (Donde se une Equipo con Mision)
CREATE TABLE Asignaciones (
    IdAsignacion INT IDENTITY(1,1) NOT NULL,
    IdMision INT NOT NULL,
    IdEquipo INT NOT NULL,
    FechaInicio DATETIME NOT NULL DEFAULT GETDATE(),
    FechaFin DATETIME NULL,
    Estado VARCHAR(20) NOT NULL DEFAULT 'En Curso', --  En curso, Completada, Fallida.
    CONSTRAINT PK_Asignaciones PRIMARY KEY (IdAsignacion),
    CONSTRAINT FK_Asignaciones_Misiones FOREIGN KEY (IdMision) REFERENCES Misiones(IdMision),
    CONSTRAINT FK_Asignaciones_Equipos FOREIGN KEY (IdEquipo) REFERENCES Equipos(IdEquipo),
    CONSTRAINT CHK_EstadoMision CHECK (Estado IN ('En Curso', 'Completada', 'Fallida'))
);

-- 10. Tabla Detalle de Equipo (Asociamos los ninjas alumnos al equipo)
CREATE TABLE EquipoDetalle (
    IdEquipo INT NOT NULL,
    IdNinja INT NOT NULL,
    CONSTRAINT PK_EquipoDetalle PRIMARY KEY (IdEquipo, IdNinja), -- Clave compuesta
    CONSTRAINT FK_Detalle_Equipo FOREIGN KEY (IdEquipo) REFERENCES Equipos(IdEquipo),
    CONSTRAINT FK_Detalle_Ninja FOREIGN KEY (IdNinja) REFERENCES Ninjas(IdNinja)
);

-- https://naruto.fandom.com/es/wiki/Jutsu
-- 11. Tabla de Jutsus
CREATE TABLE Jutsus (
    IdJutsu INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    IdElemento INT NOT NULL, -- FK a la tabla de Elementos
    Descripcion VARCHAR(MAX) NULL,
    CONSTRAINT PK_Jutsus PRIMARY KEY (IdJutsu),
    CONSTRAINT UQ_Jutsu_Nombre UNIQUE (Nombre),
    CONSTRAINT FK_Jutsus_Elementos FOREIGN KEY (IdElemento) REFERENCES Elementos(IdElemento)
);

-- 12. Tabla NinjaHabilidades (Relacion muchos a muchos entre Ninjas y Jutsus)
CREATE TABLE NinjaHabilidades (
    IdNinja INT NOT NULL,
    IdJutsu INT NOT NULL,
    NivelMaestria INT DEFAULT 1, -- Ejemplo: 1 al 10
    CONSTRAINT PK_NinjaHabilidades PRIMARY KEY (IdNinja, IdJutsu),
    CONSTRAINT FK_Habilidades_Ninja FOREIGN KEY (IdNinja) REFERENCES Ninjas(IdNinja),
    CONSTRAINT FK_Habilidades_Jutsu FOREIGN KEY (IdJutsu) REFERENCES Jutsus(IdJutsu),
    CONSTRAINT CHK_Maestria CHECK (NivelMaestria BETWEEN 1 AND 10)
);

-- 13. Tabla AuditoriaNinjas 
CREATE TABLE AuditoriaNinjas (
    IdLog INT IDENTITY(1,1) NOT NULL,
    IdNinja INT NOT NULL,
    Accion VARCHAR(50), -- Aqui guardaremos 'ALTA', 'MODIFICACION' o 'BAJA LOGICA'
    Fecha DATETIME DEFAULT GETDATE(),
    CONSTRAINT PK_AuditoriaNinjas PRIMARY KEY (IdLog)
);