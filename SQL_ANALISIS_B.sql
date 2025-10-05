SELECT 
    u.NOMBRE || ' ' || u.APELLIDO AS nombre_completo,
    c.NOMBRE AS nombre_curso
FROM 
    CURSOS c
    JOIN CALENDARIO_CURSOS cc ON c.ID_CURSO = cc.ID_CURSO
    JOIN USUARIOS u ON cc.ID_PROFESOR = u.ID_USUARIO
WHERE 
    c.ID_FACULTAD = 2;
