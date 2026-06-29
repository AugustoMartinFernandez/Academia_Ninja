USE AcademiaNinja;
GO

-- 1. Borramos si existe
IF OBJECT_ID('TRG_AuditoriaNinjas', 'TR') IS NOT NULL
    DROP TRIGGER TRG_AuditoriaNinjas;
GO

CREATE TRIGGER TRG_AuditoriaNinjas
ON Ninjas
AFTER INSERT, UPDATE
AS
BEGIN
    -- 1. LOGICA PARA EL ALTA (INSERT)
    IF NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO AuditoriaNinjas (IdNinja, Accion)
        SELECT IdNinja, 'ALTA'
        FROM inserted;
    END
    -- 2. LOGICA PARA LA MODIFICACIÓN Y BAJA LOGICA (UPDATE)
    IF EXISTS (SELECT * FROM deleted)
    BEGIN 
        -- A. BAJA LOGICA (El estado pasa de 1 a 0)
        INSERT INTO AuditoriaNinjas (IdNinja, Accion)
        SELECT i.IdNinja, 'BAJA LOGICA'
        FROM inserted i
        INNER JOIN deleted d ON i.IdNinja = d.IdNinja
        WHERE i.Estado = 0 AND d.Estado = 1;
        -- B. MODIFICACION NORMAL
        INSERT INTO AuditoriaNinjas (IdNinja, Accion)
        SELECT i.IdNinja, 'MODIFICACION'
        FROM inserted i
        INNER JOIN deleted d ON i.IdNinja = d.IdNinja
        WHERE i.Estado <> 0 OR d.Estado <> 1;
    END
END;
GO

-- 1. Probamos el ALTA
INSERT INTO Ninjas (Nombre, Apellido, FechaNacimiento, IdRango, IdAldea) 
VALUES ('Boruto', 'Uzumaki', '2015-03-27', 1, 1);
-- 2. Probamos la MODIFICACION NORMAL
UPDATE Ninjas SET Nombre = 'Naruto (Hokage)' WHERE IdNinja = 100;
-- 3. Probamos la BAJA LOGICA
UPDATE Ninjas SET Estado = 0 WHERE IdNinja = 112;
-- 4. Vemos SI  funciona:
SELECT * FROM AuditoriaNinjas;