USE AcademiaNinja;
GO

-- Paises (van antes que las aldeas porque cada aldea apunta a uno)
INSERT INTO Paises (Nombre) VALUES
('Pais del Fuego'),
('Pais del Viento'),
('Pais del Agua'),
('Pais del Rayo'),
('Pais de la Tierra'),
('Pais de la Lluvia'),
('Pais del Sonido'),
('Pais de la Cascada');

-- Verificamos que se cargaron los 8 paises
SELECT * FROM Paises;
GO