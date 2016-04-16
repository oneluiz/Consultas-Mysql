-- ------------------------------------------------
-- Actualizar parte del string de un campo
-- -----------------------------------------------
UPDATE `tabla` SET `campo` = REPLACE ( `campo`, '/', '-' );


-- ------------------------------------------------
-- Inner Join en una misma tabla
-- -----------------------------------------------
SELECT
	`rs_1`.`fecha`,
	`rs_1`.`ingreso` AS IngresoDia,
	`rs_2`.`fecha`,
	`rs_2`.`ingreso` AS IngresoNoche,
	 SUM( `rs_1`.`ingreso`+`rs_2`.`ingreso` ) AS IngresoTotal,
	 SUM( `rs_1`.`exceso`+`rs_2`.`exceso`) AS ExcesoTotal,
	 SUM( `rs_1`.`ventabruta`+`rs_2`.`ventabruta`) AS VentaBrutaTotal,
	 ((SUM( `rs_1`.`ingreso`+`rs_2`.`ingreso` ))/(SUM( `rs_1`.`ventabruta`+`rs_2`.`ventabruta`))*100) AS IngresoBrutaPorcentaje,
	 `rs_1`.`premio` AS PremioDia,
	 `rs_2`.`premio` AS PremioNoche,
	 SUM( `rs_1`.`premio`+`rs_2`.`premio`) AS PremioTotal,
	 `rs_1`.`comision` AS ComisionDia,
	 `rs_2`.`comision` AS ComisionNoche,
	 SUM( `rs_1`.`comision`+`rs_2`.`comision`) AS ComisionTotal,
	 `rs_1`.`capitalizacion` AS CapitalizacionDia,
	 `rs_2`.`capitalizacion` AS CapitalizacionNoche,
	 SUM( `rs_1`.`capitalizacion`+`rs_2`.`capitalizacion`) AS CapitalizacionTotal,
	 ((SUM( `rs_1`.`capitalizacion`+`rs_2`.`capitalizacion`))/(SUM( `rs_1`.`ventabruta`+`rs_2`.`ventabruta`))*100) AS VB,
	 ((SUM( `rs_1`.`capitalizacion`+`rs_2`.`capitalizacion`))/(SUM( `rs_1`.`ingreso`+`rs_2`.`ingreso`))*100) AS VING
FROM `registrosaldos` AS rs_1
INNER JOIN `registrosaldos` AS `rs_2` ON ( `rs_2`.`fecha` = `rs_1`.`fecha`)
WHERE
	`rs_1`.`vendedor`='9' AND `rs_1`.`mes`='4' AND `rs_1`.`anio`='2016' AND `rs_1`.`tipo`='0'
AND
	`rs_2`.`vendedor`='9' AND `rs_2`.`mes`='4' AND `rs_2`.`anio`='2016' AND `rs_2`.`tipo`='1'
GROUP BY `rs_1`.`fecha`, `rs_2`.`fecha`

