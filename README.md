<p align="center">
  <img src="./banner-academia-ninja.png" alt="Academia Ninja" width="100%">
</p>

# 🥷 Academia Ninja - Proyecto Integrador de Base de Datos II

<p align="center">
  <img src="https://img.shields.io/badge/SQL%20Server-2022-red?style=for-the-badge&logo=microsoft-sql-server&logoColor=white" alt="SQL Server">
  <img src="https://img.shields.io/badge/T--SQL-Microsoft-blue?style=for-the-badge" alt="T-SQL">
  <img src="https://img.shields.io/badge/UTN-FRGP-lightgrey?style=for-the-badge" alt="UTN FRGP">
  <img src="https://img.shields.io/badge/Rama-tincho-orange?style=for-the-badge&logo=git&logoColor=white" alt="Branch">
</p>

---

¡Buenas!

Bienvenidos al repositorio de nuestro Trabajo Práctico Integrador para la materia **Base de Datos II** de la **Tecnicatura Universitaria en Programación (UTN FRGP)**.

Armamos este sistema desde cero para gestionar de punta a punta todo el funcionamiento de una **Academia Ninja** inspirada en el universo de Naruto.

La idea principal de este proyecto es centralizar y blindar toda la lógica pesada del negocio (como las auditorías de los personajes, el control de las escuadras y el estado financiero de las misiones peligrosas) directamente adentro del servidor usando **SQL Server**.

Con esto logramos que los datos sean consistentes, que las consultas vuelen y que el sistema sea inmune a fallos de sincronización.

---

# 📂 Organización del Proyecto (Arquitectura)

Para que el repositorio sea legible, fácil de mantener y no tenga un millón de scripts sueltos en la raíz, ordenamos todo de forma cronológica según su ejecución en las siguientes carpetas:

```text
Academia_Ninja/
│
├── 01_Estructura/
│   └── 00 Creacion DB + Tablas.sql
├── 02_CargaDeDatos/
│   ├── 01 Carga de Datos Aldeas.sql
│   ├── 02 Carga de Datos Rangos.sql
│   ├── 03 Carga de Datos Dificultades.sql
│   ├── 04 Carga de Datos Elementos.sql
│   ├── 05 Carga de Datos Ninjas.sql
│   ├── 06 Carga de Datos Jutsus.sql
│   ├── 07 Carga de Datos Misiones.sql
│   ├── 08 Carga de Datos Equipos.sql
│   ├── 09 Carga de Datos EquiposDetalle.sql
│   ├── 10 Carga de Datos NinjaHabilidades.sql
│   └── 11 Carga de Datos Asignaciones .sql
├── 03_Vistas/
│   ├── 12 Vista Detalle Ninja.sql
│   ├── 13 Vista Libro Bingo.sql
│   ├── 14 Vista Historial y Estado Financiero de Misiones por Equipo.sql
│   ├── 16 Vista_ComposicionEquipos.sql
│   └── 19 Vistas_Filtros_y_Resumenes.sql
├── 04_Triggers/
│   ├── 15 Trigger Auditoría de la tabla Ninjas.sql
│   └── 18 Trigger Validacion Ingreso Equipo.sql
├── 05_Procedimientos/
│   ├── 17 _SP_CurarNinja.sql
│   └── 20 SP Asignar Mision.sql
│
└── README.md
```

---

# 🛠️ Cómo Instalar y Levantar la Base de Datos

## 1️⃣ Clonar el repositorio

Abrís una terminal de Git Bash, CMD o la consola que uses en la carpeta donde quieras guardar el código y ejecutás:

```bash
git clone [https://github.com/AugustoMartinFernandez/Academia_Ninja.git](https://github.com/AugustoMartinFernandez/Academia_Ninja.git)
cd Academia_Ninja
```

---

## 2️⃣ Ejecutar los Scripts en Microsoft SQL Server

Abrís tu SQL Server Management Studio (SSMS) o Visual Studio Code (asegurate de tener la extensión MSSQL conectada a tu instancia local) y ejecutás los archivos respetando estrictamente el orden de las carpetas.

### Paso 1

Entrás a la carpeta `01_Estructura` y corrés el archivo `00 Creacion DB + Tablas.sql` para levantar la base de datos **AcademiaNinja** y su esqueleto relacional.

---

### Paso 2

Vas a la carpeta `02_CargaDeDatos` y ejecutás los archivos del **01 al 11** uno atrás del otro.

Esto va a poblar las tablas con los personajes más conocidos (Naruto, Sasuke, Kakashi, etc.), sus jutsus, las aldeas ocultas y sus escuadras oficiales.

---

### Paso 3

Corrés todos los scripts de las carpetas `03_Vistas`, `04_Triggers` y `05_Procedimientos` para cargar toda la inteligencia y las restricciones automáticas al motor de consultas.

---

# 🚀 Guía de Pruebas: ¿Cómo ver la magia en acción?

Para comprobar que las reglas de negocio funcionan correctamente y que la base de datos es robusta, armamos este mapa de pruebas rápido.

Podés copiar y pegar cada bloque directamente en tu consola SQL.

---

## 🚫 Prueba 1: Trigger de Validación (Integridad del Negocio)

El trigger **TRG_ValidarIngresoEquipo** controla que nadie pueda mandar a pelear a un ninja que fue dado de baja.

```sql
-- Pasamos a Zabuza Momochi (ID 112) a estado inactivo (baja logica)
UPDATE Ninjas
SET Estado = 0
WHERE IdNinja = 112;

-- Intentamos meterlo a la fuerza en el Equipo 7 (Tabla EquipoDetalle)
INSERT INTO EquipoDetalle (IdEquipo, IdNinja)
VALUES (1, 112);
```

**Resultado esperado:**
```text
SQL frena la operacion al toque con un error rojo:
"Regla de Negocio: No se puede asignar a un equipo un ninja que este dado de baja (inactivo)."
```

---

## 🩺 Prueba 2: Procedimiento Almacenado Transaccional (Manejo de Errores)

Si queremos reactivar a Zabuza para que pueda volver a unirse a una escuadra, tenemos que usar el procedimiento médico controlado **SP_CurarNinja**.

```sql
-- Ejecutamos la curacion medica de Zabuza
EXEC SP_CurarNinja @IdNinja = 112;
```

**Resultado esperado:**
```text
"Ninja curado y reactivado exitosamente."
```

---

```sql
-- Si tiramos un ID que no existe para probar el control de errores:
EXEC SP_CurarNinja @IdNinja = 999;
```

**Resultado esperado:**
```text
"El Ninja especificado no existe."
```

---

## 💵 Prueba 3: SP de Asignación de Misiones con Transacciones

El procedimiento **SP_AsignarMision** mete la inserción adentro de un BEGIN TRANSACTION para asegurar que el equipo no duplique trabajos en curso.

```sql
-- Le asignamos la Mision 1 (Encontrar al gato Tora) al Equipo 1
EXEC SP_AsignarMision
    @IdMision = 1,
    @IdEquipo = 1;
```

**Resultado esperado:**
```text
"Exito: Mision asignada al equipo correctamente."
```

---

```sql
-- Intentamos asignar nuevamente la misma misión
EXEC SP_AsignarMision
    @IdMision = 1,
    @IdEquipo = 1;
```

**Resultado esperado:**
```text
"Error: El equipo ya tiene esta misión en curso."
```

---

## 📊 Prueba 4: Vistas de Resumen y Uso de LEFT JOIN

```sql
-- Consultamos la estadistica de ninjas por aldea
SELECT *
FROM vw_ResumenAldeas
ORDER BY CantidadNinjas DESC;
```

**Resultado esperado:**
```text
Muestra todas las aldeas y acopla un COUNT agrupado con GROUP BY.
Aldeas como "Iwa" salen con 0 en vez de desaparecer gracias al LEFT JOIN.
```

---

```sql
-- Consultamos que personajes estan sin escuadra asignada actualmente
SELECT *
FROM vw_NinjasSinEquipo;
```

**Resultado esperado:**
```text
Lista todos los shinobis disponibles y lideres libres que no figuran en EquipoDetalle.
```

---

## 📝 Prueba 5: Trigger de Auditoría (Trazabilidad)

Cualquier movimiento que ocurra sobre el personal es trackeado automáticamente por el trigger **TRG_AuditoriaNinjas**.

```sql
-- Revisamos la tabla de auditoría
SELECT *
FROM AuditoriaNinjas;
```

**Resultado esperado:**
```text
Vas a ver los logs con etiquetas claras de:
- ALTA
- MODIFICACION
- BAJA LOGICA
```

---

# 👥 Integrantes - Grupo #09

- Fernandez, Augusto Martin
- Alomo, Ramiro Santino
- Contreras, Esteban

---

## 🎓 Institución

Este proyecto fue desarrollado bajo los lineamientos académicos exigidos por la cátedra de **Base de Datos II** de la **UTN FRGP - Cursada 2026**.

---

## 🌐 Conectá Conmigo

Si te gustó cómo quedó estructurada esta base de datos o querés ver más proyectos y contenido sobre desarrollo web y programación, ¡te invito a seguirme en mis redes!

<p align="center">
  <a href="https://www.linkedin.com/in/tinchodev" target="_blank">
    <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn TinchoDev">
  </a>
  <a href="https://www.instagram.com/tinchoo_dev?igsh=ZXV4eGl3amgyYWE0&utm_source=qr" target="_blank">
    <img src="https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white" alt="Instagram TinchoDev">
  </a>
  <a href="https://www.facebook.com/share/18JpcvWkNq/?mibextid=wwXIfr" target="_blank">
    <img src="https://img.shields.io/badge/Facebook-1877F2?style=for-the-badge&logo=facebook&logoColor=white" alt="Facebook TinchoDev">
  </a>
</p>