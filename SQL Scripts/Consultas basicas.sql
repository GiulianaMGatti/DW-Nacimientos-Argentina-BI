use DW_Salud
------------------------------------------------------------------------------------------------
-- ¿Como evolucionó la cantidad total de nacimientos por año en Argentina entre 2005 y 2022?

SELECT dt.anio, SUM(fn.nacimientos_cantidad) as total_naciemientos 
FROM fact.fact_nacimientos fn 
JOIN dim.dim_tiempo dt on fn.tiempo_key = dt.tiempo_key
GROUP BY dt.anio
ORDER BY dt.anio ASC;

------------------------------------------------------------------------------------------------
-- ¿Qué provincias registraron mayor cantidad de nacimientos?

SELECT dj.jurisdicion_residencia_nombre, SUM(fn.nacimientos_cantidad) as total_nacimientos 
FROM fact.fact_nacimientos fn 
JOIN dim.dim_jurisdiccion dj on fn.jurisdiccion_key = dj.jurisdiccion_key
GROUP BY dj.jurisdicion_residencia_nombre
ORDER BY total_nacimientos DESC;

------------------------------------------------------------------------------------------------
--¿Cómo se distribuyen los nacimientos según el grupo de edad de la madre?
SELECT dem.edad_madre_grupo, SUM(fn.nacimientos_cantidad) as total_nacimientos,
ROUND(
SUM(nacimientos_cantidad)*100
/SUM(SUM(fn.nacimientos_cantidad)) OVER(), 
        2
        ) AS porcentaje
FROM fact.fact_nacimientos fn    
JOIN dim.dim_edad_madre dem on fn.edad_madre_key = dem.edad_madre_key
GROUP BY dem.edad_madre_grupo
ORDER BY total_nacimientos DESC;

------------------------------------------------------------------------------------------------
--¿Cómo se distribuyen los nacimientos según edad de la madre y tipo de parto?
SELECT dem.edad_madre_grupo, dtp.tipo_de_parto_nombre, 
SUM(fn.nacimientos_cantidad) as total_nacimientos
FROM fact.fact_nacimientos fn    
JOIN dim.dim_edad_madre dem on fn.edad_madre_key = dem.edad_madre_key
JOIN dim.dim_tipo_parto dtp on fn.tipo_parto_key = dtp.tipo_parto_key
GROUP BY dem.edad_madre_grupo, dtp.tipo_de_parto_nombre
ORDER BY total_nacimientos DESC;

------------------------------------------------------------------------------------------------
--¿Cómo evolucionaron los nacimientos por provincia a lo largo de los años?
SELECT dt.anio, dj.jurisdicion_residencia_nombre, 
SUM(fn.nacimientos_cantidad) as total_nacimientos
FROM fact.fact_nacimientos fn    
JOIN dim.dim_tiempo dt on dt.tiempo_key = fn.tiempo_key
JOIN dim.dim_jurisdiccion dj on dj.jurisdiccion_key = fn.jurisdiccion_key
GROUP BY dt.anio, dj.jurisdicion_residencia_nombre
ORDER BY dt.anio DESC, total_nacimientos DESC;

------------------------------------------------------------------------------------------------
--Cantidad de nacimientos en la provincia de Buenos Aires entre 2015 y 2020
SELECT dt.anio, 
SUM(fn.nacimientos_cantidad) as total_nacimientos
FROM fact.fact_nacimientos fn    
JOIN dim.dim_tiempo dt on dt.tiempo_key = fn.tiempo_key
WHERE fn.jurisdiccion_key = 2 AND dt.anio BETWEEN 2015 AND 2020
GROUP BY dt.anio
ORDER BY dt.anio ASC;

------------------------------------------------------------------------------------------------
--¿Qué porcentaje representa cada jurisdicción sobre el total nacional de nacimientos?
SELECT dj.jurisdicion_residencia_nombre, SUM(fn.nacimientos_cantidad) as total_nacimientos,
CAST(
SUM(fn.nacimientos_cantidad)*100.00
/SUM(SUM(fn.nacimientos_cantidad)) OVER() AS decimal (10,2)
) AS porcentaje
FROM fact.fact_nacimientos fn    
JOIN dim.dim_jurisdiccion dj on dj.jurisdiccion_key = fn.jurisdiccion_key
GROUP BY dj.jurisdicion_residencia_nombre
ORDER BY total_nacimientos DESC;