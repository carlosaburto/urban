clear all
set more off

import delimited "C:\Users\carlo\Documents\urban\uso-de-suelo.csv",  delimiters(";")

rename alcaldãa alcaldia
rename cãdigopostal codigopostal
rename ãrealibre arealibre
rename mãnimovivienda minimovivienda

drop ligaciudadmx

foreach var of varlist alcaldia cuentacatastral calle colonia codigopostal uso_descripcion densidad_descripcion niveles altura arealibre minimovivienda coordenadas geopoint {
	replace `var' = "." if `var' == "NULL"
}


replace longitud = -99.257600 if cuentacatastral == "056_955_07"
replace latitud = 19.357183 if cuentacatastral == "056_955_07"

sort uso_descripcion

replace uso_descripcion = "Area Verde" if uso_descripcion == "Areas Verdes" | uso_descripcion == "Areas Verdes y Espacios Abiertos" | uso_descripcion == "Ãrea Verde" | uso_descripcion == "Ãrea Verde." | uso_descripcion == "Ãreas Verdes"
replace uso_descripcion = "Centro de Barrio"  if  uso_descripcion == "CENTRO DE BARRIO" | uso_descripcion == "Centro de Barrio (CB)"
replace uso_descripcion = "Equipamiento" if uso_descripcion == "EQUIPAMIENTO" | uso_descripcion == "Equipamiento." | uso_descripcion == "Equipamiento (E)"
replace uso_descripcion = "Espacio Abierto" if uso_descripcion == "ESPACIOS ABIERTOS" | uso_descripcion == "Espacio Abierto (EA)" | uso_descripcion == "Espacios Abiertos" | uso_descripcion == "Espacios abiertos"
replace uso_descripcion = "Equipamiento Publico y Privado" if uso_descripcion == "Equipamiento PÃºblico y Privado"
replace uso_descripcion = "Poligono de Actuacion" if uso_descripcion == "PolÃ­gono de ActuaciÃ³n"
replace uso_descripcion = "Habitacional" if uso_descripcion == "Habitacional."
replace uso_descripcion = "Habitacional con Oficinas" if uso_descripcion == "Habitacional con Oficinas."
replace uso_descripcion = "Sin Zonificacion" if uso_descripcion == "Sin ZonificaciÃ³n" | uso_descripcion == "Sin ZonificaciÃ³n (SZ)"

save "C:\Users\carlo\Documents\urban\uso_de_suelo.dta", replace
export delimited "C:\Users\carlo\Documents\urban\uso_de_suelo.csv", replace

***

use "C:\Users\carlo\Documents\urban\uso_de suelo.dta", clear




*gitty gityy









