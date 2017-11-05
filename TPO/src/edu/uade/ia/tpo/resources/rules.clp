(defrule antecedente-neurosis
  (paciente_examen
    (dni ?dni)
    (antecedente NEUROSIS)
  )
  ?PACIENTE <- (paciente
    (dni ?dni)
    (diagnostico NOSE)
    (prediagnostico NOSE)
  )
  =>
  (assert
    (paciente_prediagnostico
      (dni ?dni)
      (diagnostico NEUROSIS)
    )
  )
  (modify ?PACIENTE
    (prediagnostico ASIGNADO)
  )
  (printout t "Asignado prediagnostico neurosis" crlf)
)

(defrule antecedente-neurosis-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente NEUROSIS)
  )
  (paciente
    (dni ?dni)
    (diagnostico NOSE)
    (prediagnostico ASIGNADO)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ NEUROSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 NEUROSIS)
  (printout t "Insertado prediagnostico NEUROSIS" crlf)
)

(defrule antecedente-psicosis
  (paciente_examen
    (dni ?dni)
    (antecedente PSICOSIS)
  )
  ?PACIENTE <- (paciente
    (dni ?dni)
    (diagnostico NOSE)
    (prediagnostico NOSE)
  )
  =>
  (assert
    (paciente_prediagnostico
      (dni ?dni)
      (diagnostico PSICOSIS)
    )
  )
  (modify ?PACIENTE
    (prediagnostico ASIGNADO)
  )
  (printout t "Asignado prediagnostico psicosis" crlf)
)

(defrule antecedente-psicosis-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente PSICOSIS)
  )
  (paciente
    (dni ?dni)
    (diagnostico NOSE)
    (prediagnostico ASIGNADO)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PSICOSIS)
  (printout t "Insertado prediagnostico PSICOSIS" crlf)
)
