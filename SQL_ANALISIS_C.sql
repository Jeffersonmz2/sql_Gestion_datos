WITH profesores_multi_carreras AS (
    SELECT 
        cc.ID_PROFESOR
    FROM 
        CALENDARIO_CURSOS cc
        JOIN CURSOS_CARRERAS cca ON cc.ID_CURSO = cca.ID_CURSO
    GROUP BY 
        cc.ID_PROFESOR
    HAVING 
        COUNT(DISTINCT cca.ID_CARRERA) >= 2
)
SELECT DISTINCT 
    u.NOMBRE || ' ' || u.APELLIDO AS nombre_completo,
    cu.NOMBRE AS nombre_curso,
    ca.NOMBRE AS nombre_carrera
FROM 
    profesores_multi_carreras pmc
    JOIN CALENDARIO_CURSOS cc ON pmc.ID_PROFESOR = cc.ID_PROFESOR
    JOIN USUARIOS u ON cc.ID_PROFESOR = u.ID_USUARIO
    JOIN CURSOS cu ON cc.ID_CURSO = cu.ID_CURSO
    JOIN CURSOS_CARRERAS cca ON cu.ID_CURSO = cca.ID_CURSO
    JOIN CARRERAS ca ON cca.ID_CARRERA = ca.ID_CARRERA
ORDER BY 
    nombre_completo, nombre_carrera, nombre_curso;