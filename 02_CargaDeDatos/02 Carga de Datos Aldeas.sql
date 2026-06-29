USE AcademiaNinja;
GO

-- Aldeas 
INSERT INTO Aldeas (Nombre, IdPais, NombreOficial) VALUES
('Konoha',1,'Aldea Oculta entre las Hojas'),
('Suna',2,'Aldea Oculta de la Arena'),
('Kiri',3,'Aldea Oculta de la Niebla'),
('Kumo',4,'Aldea Oculta entre las Nubes'),
('Iwa',5,'Aldea Oculta de la Roca'),
('Ame',6,'Aldea Oculta de la Lluvia'),
('Oto',7,'Aldea Oculta del Sonido'),
('Taki',8,'Aldea Oculta de la Cascada');

-- Verificamos que se cargaron las 8 aldeas
SELECT * FROM Aldeas;
GO