(deftemplate equipo
	(slot nombre)
	(slot categoria	(type SYMBOL)
			(allowed-values SeleccionNacional PrimeraA NacionalB PrimeraDivision))
	(multislot colores-camiseta)
	(slot patron	(type SYMBOL)
			(allowed-values horizontales verticales diagonales))
	(slot cantidadBarras)
	(slot pais	(type SYMBOL)
			(allowed-values Espana Italia Inglaterra Argentina))
)

(deffacts base_conocimiento
	(equipo (nombre "River Plate") (categoria PrimeraA) (colores-camiseta blanco rojo) (pais Argentina))
	(equipo (nombre "Boca Juniors")(categoria PrimeraA) (colores-camiseta azul amarillo) (pais Argentina))
	(equipo (nombre "Chacarita Juniors")(categoria NacionalB) (colores-camiseta blanco rojo negro) (pais Argentina))
	(equipo (nombre "Independiente")(categoria PrimeraA) (colores-camiseta rojo) (pais Argentina))
	(equipo (nombre "Rosario Central")(categoria PrimeraA) (colores-camiseta azul amarillo) (pais Argentina))
	(equipo (nombre "Argentina")(categoria SeleccionNacional)(colores-camiseta celeste blanco) (pais Argentina))
	(equipo (nombre "FC Barcelona")(categoria PrimeraDivision) (colores-camiseta azul rojo) (pais Espana) (patron verticales))
)

(defrule colores-patrones
	(colores $?colores)
	(patrones $?patrones)
	(equipo (nombre ?nombre)(colores-camiseta $?colores-camiseta)(patron ?patron))
	(test (subsetp (create$ ?patron) $?patrones))
	(test (subsetp $?colores $?colores-camiseta))
	=>
	(printout t "La camiseta del equipo " ?nombre " tiene un patron" ?patron " y los colores: " ?colores-camiseta crlf)
)

(defrule camisetas-colores
	(colores $?colores)
	(equipo (nombre ?nombre)(colores-camiseta $?colores-camiseta))
	(test (subsetp $?colores $?colores-camiseta))
	=>
	(printout t "El equipo: " ?nombre " tiene los siguientes colores en su camiseta: " ?colores-camiseta crlf)
)

(defrule colores-categorias
	(colores $?colores)
	(categorias $?categorias)
	(equipo (nombre ?nombre)(colores-camiseta $?colores-camiseta)(categoria ?categoria))
	(test (subsetp (create$ ?categoria) $?categorias))
	(test (subsetp $?colores $?colores-camiseta))
	=>
	(printout t "El equipo " ?nombre " es categoria " ?categoria "y su camiseta tiene los colores: " ?colores-camiseta crlf)
)

(defrule equipos-pais
	(paises $?paises)
	(equipo (nombre ?nombre)(pais ?pais))
	(test (subsetp (create$ ?pais) $?paises))
	=>
	(printout t "El equipo: " ?nombre " es del pais: " ?pais crlf)
)
