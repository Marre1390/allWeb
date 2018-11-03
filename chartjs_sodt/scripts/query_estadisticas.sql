-- Total solicitudes por Mes
SELECT COUNT(*) total_solicitudes, MONTH(dat_fecha_solicitud) mes_solicitud FROM tbl_solicitud GROUP BY MONTH(dat_fecha_solicitud)

-- Total servicios entre todas las solicitudes
SELECT COUNT(*) servicio, tbl_servicio.txt_servicio
FROM tbl_servicio_x_solicitud 
INNER JOIN tbl_servicio 
WHERE tbl_servicio_x_solicitud.cod_servicio = tbl_servicio.cod_servicio
GROUP BY tbl_servicio_x_solicitud.cod_servicio