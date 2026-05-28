USE AcademiaNinja;
GO

INSERT INTO Aldeas (Nombre, Pais, NombreOficial)
VALUES 
('Konoha', 'Pais del Fuego', 'Aldea Oculta entre las Hojas'),
('Suna', 'Pais del Viento', 'Aldea Oculta de la Arena'),
('Kiri', 'Pais del Agua', 'Aldea Oculta de la Niebla'),
('Kumo', 'Pais del Rayo', 'Aldea Oculta de las Nubes'),
('Iwa', 'Pais de la Tierra', 'Aldea Oculta de las Rocas');
GO

-- Verificamos que se cargaron las 5 aldeas
SELECT * FROM Aldeas;
GO