# Servidor Prolog: Sistema Experto para la Asignación de Profesores

**Alumno:**
Cristóbal Rafael Lara Páez (191490)
**Asignatura:** Programación Avanzada  
**Docente:** Jesús Alejandro Flores Hernández

---

## Descripción de la actividad

Desarrollar un sistema experto en SWI-Prolog con API REST (JSON) para la asignación de profesores de la FCI a academias, cuerpos académicos, proyectos, cursos (selección del mejor candidato), capacitaciones y comisiones, según preparación, grado, especialidad y dominio de asignaturas.

## Estructura

* **[servidor_fci.pl](./servidor_fci.pl).** Servidor HTTP, controladores de rutas, motor de inferencia y evaluación.
* **[base_conocimiento.pl](./base_conocimiento.pl).** Hechos dinámicos (`:- dynamic`) de profesores y entidades, con predicados para adición en tiempo de ejecución.

## Ejecución

1. **Iniciar servidor (Disponibe en [http://localhost:8080](http://localhost:8080))**
   ```bash
   swipl servidor_fci.pl
   ```

## Endpoints de la API

### Consultas y Catálogos
* `GET /api`: Índice de endpoints en formato JSON.
* `GET /api/profesores`: Lista de profesores y materias que dominan.
* `GET /api/{entidad}`: Catálogo de `cursos`, `academias`, `cuerpos_academicos`, `proyectos`, `capacitaciones` o `comisiones`.

### Asignaciones del Sistema Experto (Opciones 1 a 5)
Evalúan a los docentes, calculan puntajes y devuelven el ranking. Aceptan el parámetro opcional `guardar=si`.

* `GET /api/asignar/academia?id=acad_ia`: Asigna por materias dominadas y afinidad.
* `GET /api/asignar/cuerpo_academico?id=ca1`: Asigna por línea afín, posgrado, PRODEP y SNII.
* `GET /api/asignar/proyecto?id=p1`: Asigna por especialidad y cursos afines.
* `GET /api/asignar/curso?id=c1`: **Determina al mejor profesor** según orden de dominio, grado y especialidad.
* `GET /api/asignar/capacitacion?id=cap1`: Recomienda docentes que no hayan tomado el curso.
* `GET /api/asignar/comision?id=com1`: Asigna por afinidad y grado.

### Expediente Docente (Opción 6)
* `GET /api/profesor?q=101` (o `q=roberto`): Retorna estudios (licenciatura, maestría, doctorado), acreditaciones, capacitaciones y asignaciones activas.

### Gestión Dinámica
* `GET /api/agregar/profesor?empleado=108&nombre=...&grado=...&especialidad=...&cursos=C1,C2`: Agrega un profesor en tiempo de ejecución.
* `GET /api/agregar/curso?id=c13&creditos=8&nombre=...&objetivo=...&academia=...`: Agrega un curso.
* `GET /api/asignar/manual?tipo=...&empleado=...&destino=...`: Asigna manualmente.
* `GET /api/desasignar?tipo=...&empleado=...&destino=...`: Elimina una asignación.
* `GET /api/reiniciar`: Restablece las asignaciones iniciales.

## Criterios de para la asignación de los docentes

1. **Grado:** Doctorado (30 pts), Maestría (20 pts), Licenciatura (10 pts).
2. **Dominio de cursos:** 1.º en lista (40 pts), 2.º (30 pts), 3.º (20 pts), >=4.º (10 pts), no domina (0 pts).
3. **Afinidad:** Especialidad o materias afines (+20 a +35 pts).
4. **Investigación:** PRODEP (+15 pts) y SNII (+20 pts) para cuerpos académicos.
