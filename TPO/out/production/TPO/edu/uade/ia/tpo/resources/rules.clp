(defrule antecedente-neurosis
  ()
  =>
  (assert
    ()
  )
)


(defrule prediagnostico-inestabilidad-emocional
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ; verificar validaciones
  =>
  (assert
    (paciente_prediagnostico
      (dni ?dni)

    )
  )
)

(defrule prediagnostico-histeria
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ; verificar sintomas (ver funciones multislot)
  =>

)

(defrule prediagnostico-impulsivo
  ()
  =>

)

(defrule prediagnostico-obsesivo
  ()
  =>

)

(defrule prediagnostico-
  ()
  =>

)
