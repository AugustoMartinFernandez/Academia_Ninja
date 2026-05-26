USE AcademiaNinja;
GO

 INSERT INTO Aldeas(Nombre, Pais,NombreOficial)
 VALUES 
 ('Konoha','Pais del Fuego','Aldea Oculta entre las Hojas'),
 ('Suna','Pais del Viento','Aldea Oculta de la Arena'),
 ('Kiri','Pais del Agua','Aldea Oculta de la Niebla'),
 ('Kumo','Pais del Rayo','Aldea Oculta de las Nubes'),
 ('Iwa','Pais de la Tierra','Aldea Oculta de las Rocas');
 

SELECT * FROM Aldeas;

-- 1. Agrego la columna 
-- ALTER TABLE Aldeas
-- ADD NombreOficial VARCHAR(100) NOT NULL;
-- GO
-- 2. Le agrego la restricción UNIQUE
-- ALTER TABLE Aldeas
-- ADD CONSTRAINT UQ_Aldea_NombreOficial UNIQUE(NombreOficial);
-- GO

-- UPDATE Aldeas
-- SET NombreOficial = 'Aldea Oculta entre las Hojas'
-- WHERE Nombre = 'Konoha';