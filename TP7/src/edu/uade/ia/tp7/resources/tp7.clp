(deftemplate equipo
	(slot nombre)
	(slot categoria	(type SYMBOL)
			(allowed-values SeleccionNacional PrimeraA NacionalB PrimeraDivision))
	(multislot colores-camiseta)
	(slot patron (type SYMBOL)
			(allowed-values BarrasHorizontales BarrasVerticales BarrasDiagonales Lisa))
	(slot cantidadBarras)
	(slot pais	(type SYMBOL)
			(allowed-values Espana Italia Inglaterra Argentina))
)

(deftemplate Resultado
	(slot NombreEquipo)
	(multislot ColoresCamiseta)
	(slot Patron)
	(slot CantidadBarras)
	(slot Pais)
	(slot Categoria)
)

(deffacts base_conocimiento
	(equipo
	    (nombre RiverPlate)
	    (categoria PrimeraA)
	    (colores-camiseta blanco rojo)
	    (pais Argentina)
	    (patron BarrasDiagonales)
	    (cantidadBarras 1)
	)
	(equipo
	    (nombre BocaJuniors)
	    (categoria PrimeraA)
	    (colores-camiseta azul amarillo)
	    (pais Argentina)
	    (patron BarrasHorizontales)
	    (cantidadBarras 1)
	)
	(equipo
	    (nombre ChacaritaJuniors)
	    (categoria NacionalB)
	    (colores-camiseta blanco rojo negro)
	    (pais Argentina)
	)
	(equipo
	    (nombre Independiente)
	    (categoria PrimeraA)
	    (colores-camiseta rojo)
	    (pais Argentina)
	    (patron Lisa)
	)
	(equipo
	    (nombre RosarioCentral)
	    (categoria PrimeraA)
	    (colores-camiseta azul amarillo)
	    (pais Argentina)
	    (patron BarrasVerticales)
	    (cantidadBarras 4)
	)
	(equipo
	    (nombre Argentina)
	    (categoria SeleccionNacional)
	    (colores-camiseta celeste blanco)
	    (pais Argentina)
	    (patron BarrasVerticales)
	    (cantidadBarras 3)
	)
	(equipo
	    (nombre FCBarcelona)
	    (categoria PrimeraDivision)
	    (colores-camiseta azul rojo)
	    (pais Espana)
	    (patron BarrasVerticales)
	    (cantidadBarras 3)
	)
)

(defrule colores-patrones
	(colores $?colores)
	(patrones $?patrones)
	(equipo
		(nombre ?nombre)
		(colores-camiseta $?colores-camiseta)
		(patron ?patron)
		(pais ?pais)
		(cantidadBarras ?cantidadBarras)
		(categoria ?cat)
	)
	(test (subsetp (create$ ?patron) $?patrones))
	(test (subsetp $?colores $?colores-camiseta))
	=>
	(printout t "La camiseta del equipo " ?nombre " tiene un patron" ?patron " y los colores: " ?colores-camiseta crlf)
	(assert
		(Resultado
			(NombreEquipo ?nombre)
			(ColoresCamiseta $?colores-camiseta)
			(Patron ?patron)
			(Pais ?pais)
			(Categoria ?cat)
			(CantidadBarras ?cantidadBarras)
		)
	)
)

(defrule camisetas-colores
	(colores $?colores)
	(equipo
		(nombre ?nombre)
		(colores-camiseta $?colores-camiseta)
		(pais ?pais)
		(patron ?patron)
		(cantidadBarras ?cantidadBarras)
		(categoria ?cat)
	)
	(test (subsetp $?colores $?colores-camiseta))
	=>
	(printout t "El equipo: " ?nombre " tiene los siguientes colores en su camiseta: " ?colores-camiseta crlf)
	(assert
		(Resultado
			(NombreEquipo ?nombre)
			(ColoresCamiseta $?colores-camiseta)
			(Patron ?patron)
			(Pais ?pais)
			(Categoria ?cat)
			(CantidadBarras ?cantidadBarras)
		)
	)
)

(defrule colores-categorias
	(colores $?colores)
	(categorias $?categorias)
	(equipo
		(nombre ?nombre)
		(colores-camiseta $?colores-camiseta)
		(categoria ?categoria)
		(pais ?pais)
		(patron ?patron)
		(cantidadBarras ?cantidadBarras)
	)
	(test (subsetp (create$ ?categoria) $?categorias))
	(test (subsetp $?colores $?colores-camiseta))
	=>
	(printout t "El equipo " ?nombre " es categoria " ?categoria "y su camiseta tiene los colores: " ?colores-camiseta crlf)
	(assert
		(Resultado
			(NombreEquipo ?nombre)
			(ColoresCamiseta $?colores-camiseta)
			(Patron ?patron)
			(Pais ?pais)
			(Categoria ?categoria)
			(CantidadBarras ?cantidadBarras)
		)
	)
)

(defrule equipos-pais
	(paises $?paises)
	(equipo
		(nombre ?nombre)
		(pais ?pais)
		(categoria ?cat)
		(patron ?patron)
		(colores-camiseta $?colores-camiseta)
		(cantidadBarras ?cantidadBarras)
	)
	(test (subsetp (create$ ?pais) $?paises))
	=>
	(printout t "El equipo: " ?nombre " es del pais: " ?pais crlf)
	(assert
		(Resultado
			(NombreEquipo ?nombre)
			(ColoresCamiseta $?colores-camiseta)
			(Patron ?patron)
			(Pais ?pais)
			(Categoria ?cat)
			(CantidadBarras ?cantidadBarras)
		)
	)
)
