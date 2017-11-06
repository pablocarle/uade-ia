(defrule prediagnostico-inestabilidad-emocional
  ?PACIENTE <- (paciente
    (dni ?dni)
    (diagnostico NOSE)
    (prediagnostico NOSE)
  )
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (test (subsetp (create$ GANASDEREIR GANASDELLORAR CAMBIOSDEESTADODEANIMO) $?sintomas))
  =>
  (assert
    (paciente_prediagnostico
      (dni ?dni)
      (diagnostico INESTABILIDADEMOCIONAL)
    )
  )
  (modify ?PACIENTE (prediagnostico ASIGNADO))
)

(defrule prediagnostico-inestabilidad-emocional-asignado
  ?PACIENTE <- (paciente
    (dni ?dni)
    (diagnostico NOSE)
    (prediagnostico ASIGNADO) ;TODO Falta el test de los sintomas
  )
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  =>
  (insert$ $?diagnosticos 1 INESTABILIDADEMOCIONAL)
  (delete-member$ $?diagnosticos NOSE) ;actualizar reglas de rules_antecedents.clp
)

(defrule prediagnostico-histeria
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  =>
  (insert$ $?diagnosticos 1 )

)

; Probar caso de (delete-member)
