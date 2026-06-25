USE AcademiaNinja;
GO

-- 1. Borramos si existe 
IF OBJECT_ID('SP_CurarNinja', 'P') IS NOT NULL
    DROP PROCEDURE SP_CurarNinja;
GO

-- 2. Creamos el procedimiento
CREATE PROCEDURE SP_CurarNinja
    @IdNinja INT
AS
BEGIN
    BEGIN TRY
        -- Validar existencia
        IF NOT EXISTS (SELECT 1 FROM Ninjas WHERE IdNinja = @IdNinja)
        BEGIN
            RAISERROR('El Ninja especificado no existe.', 16, 1);
            RETURN;
        END

        -- Transaccion
        BEGIN TRANSACTION;
            
            UPDATE Ninjas
            SET Estado = 1
            WHERE IdNinja = @IdNinja;

        COMMIT TRANSACTION;
        PRINT 'Ninja curado y reactivado exitosamente.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 
            ROLLBACK TRANSACTION;
            
        THROW;
    END CATCH
END;
GO

SELECT IdNinja, Nombre, Apellido 
FROM Ninjas 
WHERE Estado = 0;

-- Resultado = 112	Zabuza	Momochi.

-- La prueba de exito
-- llamamos al procedimiento para curarlo/revivirlo (pasarlo a estado 1)
EXEC SP_CurarNinja @IdNinja = 112;
-- Resultado
-- Ninja curado y reactivado exitosamente
-- Comprobamos nuevamente 
SELECT Estado FROM Ninjas WHERE IdNinja = 112;
--Resultado: 1

-- Prueba de error (Ninja inexistente)
-- Intentamos curar/ revivir  un ID que no existe 
EXEC SP_CurarNinja @IdNinja = 99;
-- Resultado
-- Lanza una excepcion real (en rojo): El Ninja especificado no existe.