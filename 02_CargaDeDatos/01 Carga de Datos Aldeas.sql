USE AcademiaNinja;
GO

-- Aldeas 
INSERT INTO Aldeas (Nombre, Pais, NombreOficial) VALUES
('Konoha', 'Pais del Fuego',  'Aldea Oculta entre las Hojas'),
('Suna',   'Pais del Viento', 'Aldea Oculta de la Arena'),
('Kiri',   'Pais del Agua',   'Aldea Oculta de la Niebla'),
('Kumo',   'Pais del Rayo',   'Aldea Oculta entre las Nubes'),
('Iwa',    'Pais de la Tierra','Aldea Oculta de la Roca'),
('Ame',    'Pais de la Lluvia','Aldea Oculta de la Lluvia'),
('Oto',    'Pais del Sonido', 'Aldea Oculta del Sonido'),
('Taki',   'Pais de la Cascada','Aldea Oculta de la Cascada');

-- Verificamos que se cargaron las 8 aldeas
SELECT * FROM Aldeas;
GO