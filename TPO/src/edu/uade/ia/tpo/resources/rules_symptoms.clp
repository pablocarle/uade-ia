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
  ()
)

(defrule prediagnostico-inestabilidad-emocional-asignado
  ()
  =>

)
