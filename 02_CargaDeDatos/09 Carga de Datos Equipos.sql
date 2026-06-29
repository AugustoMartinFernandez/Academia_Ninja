USE AcademiaNinja;
GO

INSERT INTO Equipos (NombreEquipo, IdSensei)
VALUES
('Equipo 7', 102),                 
('Equipo 8', 132),                 
('Equipo 10', 131),                
('Equipo Guy', 108),               
('Equipo de la Arena', 146),       
('Guardia de la Niebla', 112),     
('Unidad de la Nube', 119),        
('Escuadron Anbu Raiz', 145),      
('Cuerpo Medico de Konoha', 109),  
('Akatsuki', 159);                 
GO

-- Verificamos
SELECT * FROM Equipos;
GO