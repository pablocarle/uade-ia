(defrule prediagnostico-inestabilidad-emocional
  ?PACIENTE <- (paciente
    (dni ?dni)
    (diagnostico NOSE)
    (prediagnostico NOSE)
  )
  (paciente_examen
    (sintomas

    )
  )
  =>

)
