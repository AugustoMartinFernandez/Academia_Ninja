USE AcademiaNinja;
GO

INSERT INTO Misiones (Descripcion, IdDificultad, Recompensa)
VALUES
('Capturar al gato Tora de la esposa del Señor Feudal', 1, 5000),        -- Rango D
('Recolectar hierbas medicinales en el bosque', 1, 4000),               --  Rango D
('Pintar la cerca del puente de Konoha', 1, 3000),                      --  Rango D
('Escoltar al constructor Tazuna al Pais de las Olas', 2, 30000),       --  Rango C
('Recuperar pergaminos robados en la frontera', 2, 35000),             --  Rango C
('Investigar desapariciones en la Aldea del Sonido', 3, 80000),        --  Rango B
('Escoltar a un mercader a traves de territorio hostil', 3, 75000),    --  Rango B
('Rescatar al Kazekage Gaara de las garras de Akatsuki', 4, 250000),   --  Rango A
('Recuperar a Sasuke Uchiha', 4, 300000),                              --  Rango A
('Capturar al desertor Itachi Uchiha', 4, 280000),                     --  Rango A
('Repeler la invasion de Pain sobre Konoha', 5, 1000000),              --  Rango S
('Eliminar a Zabuza y al empresario Gato', 3, 90000),                  --  Rango B
('Reconocimiento del escondite de Orochimaru', 3, 70000),             --  Rango B
('Mision conjunta de las cinco aldeas contra Akatsuki', 4, 320000),   -- Rango A
('Defensa de la aldea durante la Cuarta Guerra Ninja', 5, 1500000),   -- Rango S
('Transporte de documentos clasificados entre aldeas', 2, 28000),     -- Rango C
('Exterminar bandidos en el camino comercial', 2, 32000),             -- Rango C
('Vigilancia nocturna del perimetro de Konoha', 1, 6000);             -- Rango D
GO

-- Verificamos
SELECT * FROM Misiones;
GO