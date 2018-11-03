SELECT * FROM sodt.tbl_servicio_x_solicitud;

SELECT COUNT(*) servicio, tbl_servicio.txt_servicio
FROM tbl_servicio_x_solicitud 
INNER JOIN tbl_servicio 
WHERE tbl_servicio_x_solicitud.cod_servicio = tbl_servicio.cod_servicio
GROUP BY tbl_servicio_x_solicitud.cod_servicio