USE AcademiaNinja;
GO

INSERT INTO Misiones (Descripcion, IdDificultad, Recompensa)
VALUES 
('Encontrar a la mascota perdida: El gato Tora', 1, 5000),
('Ayudar en la cosecha agrícola de la aldea', 1, 6500),
('Escolta del constructor de puentes Tazuna', 2, 35000),
('Caza de bestias salvajes en los alrededores', 2, 40000),
('Entregar pergamino secreto en la Aldea de la Arena', 3, 90000),
('Proteger a un señor feudal durante su viaje', 3, 100000),
('Detener a la banda de mercenarios en el País de las Olas', 4, 160000),
('Infiltración y espionaje en la Aldea del Sonido', 4, 180000),
('Investigar la guarida de la organización Akatsuki', 5, 1200000),
('Asesinato de un ninja renegado de alto rango', 5, 1500000);
GO

-- Verificamos 
SELECT * FROM Misiones;
GO