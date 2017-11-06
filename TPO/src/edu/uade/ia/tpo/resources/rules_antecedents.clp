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

(defrule antecedente-perversiones
  (paciente_examen
    (dni ?dni)
    (antecedente PERVERSIONES)
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
      (diagnostico PERVERSIONES)
    )
  )
  (modify ?PACIENTE
    (prediagnostico ASIGNADO)
  )
  (printout t "Asignado prediagnostico PERVERSIONES" crlf)
)

(defrule antecedente-perversiones-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente PERVERSIONES)
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
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (printout t "Insertado prediagnostico PERVERSIONES" crlf)
)

(defrule antecedente-otraspatologias
  (paciente_examen
    (dni ?dni)
    (antecedente OTRASPATOLOGIAS)
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
      (diagnostico OTRASPATOLOGIAS)
    )
  )
  (modify ?PACIENTE
    (prediagnostico ASIGNADO)
  )
  (printout t "Asignado prediagnostico OTRASPATOLOGIAS" crlf)
)

(defrule antecedente-otraspatologias-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente OTRASPATOLOGIAS)
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
  (test (not (subsetp (create$ OTRASPATOLOGIAS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 OTRASPATOLOGIAS)
  (printout t "Insertado prediagnostico OTRASPATOLOGIAS" crlf)
)

(defrule antecedente-histerias
  (paciente_examen
    (dni ?dni)
    (antecedente HISTERIAS)
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
  (printout t "Asignado prediagnostico Histerias-NEUROSIS" crlf)
)

(defrule antecedente-histerias-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente HISTERIAS)
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
  (printout t "Insertado prediagnostico Histerias-NEUROSIS" crlf)
)

(defrule antecedente-neurosisobsesiva
  (paciente_examen
    (dni ?dni)
    (antecedente NEUROSISOBSESIVA)
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
  (printout t "Asignado prediagnostico NeurosisObsesiva-NEUROSIS" crlf)
)

(defrule antecedente-neurosisobsesiva-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente NEUROSISOBSESIVA)
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
  (printout t "Insertado prediagnostico NeurosisObsevisa-NEUROSIS" crlf)
)

(defrule antecedente-fobias
  (paciente_examen
    (dni ?dni)
    (antecedente FOBIAS)
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
  (printout t "Asignado prediagnostico Fobias-NEUROSIS" crlf)
)

(defrule antecedente-fobias-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente FOBIAS)
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
  (printout t "Insertado prediagnostico Fobias-NEUROSIS" crlf)
)

(defrule antecedente-paranoias
  (paciente_examen
    (dni ?dni)
    (antecedente PARANOIAS)
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
  (printout t "Asignado prediagnostico Paranoias-PSICOSIS" crlf)
)

(defrule antecedente-paranoias-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente PARANOIAS)
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
  (printout t "Insertado prediagnostico Paranoias-PSICOSIS" crlf)
)

(defrule antecedente-esquizofrenia
  (paciente_examen
    (dni ?dni)
    (antecedente ESQUIZOFRENIA)
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
  (printout t "Asignado prediagnostico Esquizofrenia-PSICOSIS" crlf)
)

(defrule antecedente-esquizofrenia-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente ESQUIZOFRENIA)
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
  (printout t "Insertado prediagnostico Esquizofrenia-PSICOSIS" crlf)
)

(defrule antecedente-parafrenia
  (paciente_examen
    (dni ?dni)
    (antecedente PARAFRENIA)
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
  (printout t "Asignado prediagnostico Parafrenia-PSICOSIS" crlf)
)

(defrule antecedente-parafrenia-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente PARAFRENIA)
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
  (printout t "Insertado prediagnostico Parafrenia-PSICOSIS" crlf)
)

(defrule antecedente-psicosismaniacodepresiva
  (paciente_examen
    (dni ?dni)
    (antecedente PSICOSISMANIACODEPRESIVA)
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
  (printout t "Asignado prediagnostico PsicosisManiacoDepresiva-PSICOSIS" crlf)
)

(defrule antecedente-psicosismaniacodepresiva-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente PSICOSISMANIACODEPRESIVA)
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
  (printout t "Insertado prediagnostico PsicosisManiacoDepresiva-PSICOSIS" crlf)
)

(defrule antecedente-melancolia
  (paciente_examen
    (dni ?dni)
    (antecedente MELANCOLIA)
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
  (printout t "Asignado prediagnostico Melancolia-PSICOSIS" crlf)
)

(defrule antecedente-melancolia-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente MELANCOLIA)
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
  (printout t "Insertado prediagnostico Melancolia-PSICOSIS" crlf)
)

(defrule antecedente-fetichismo
  (paciente_examen
    (dni ?dni)
    (antecedente FETICHISMO)
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
      (diagnostico PERVERSIONES)
    )
  )
  (modify ?PACIENTE
    (prediagnostico ASIGNADO)
  )
  (printout t "Asignado prediagnostico Fetichismo-PERVERSIONES" crlf)
)

(defrule antecedente-fetichismo-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente FETICHISMO)
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
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (printout t "Insertado prediagnostico Fetichismo-PERVERSIONES" crlf)
)

(defrule antecedente-sadismo
  (paciente_examen
    (dni ?dni)
    (antecedente SADISMO)
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
      (diagnostico PERVERSIONES)
    )
  )
  (modify ?PACIENTE
    (prediagnostico ASIGNADO)
  )
  (printout t "Asignado prediagnostico Sadismo-PERVERSIONES" crlf)
)

(defrule antecedente-sadismo-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente SADISMO)
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
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (printout t "Insertado prediagnostico Sadismo-PERVERSIONES" crlf)
)

(defrule antecedente-masoquismo
  (paciente_examen
    (dni ?dni)
    (antecedente MASOQUISMO)
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
      (diagnostico PERVERSIONES)
    )
  )
  (modify ?PACIENTE
    (prediagnostico ASIGNADO)
  )
  (printout t "Asignado prediagnostico Masoquismo-PERVERSIONES" crlf)
)

(defrule antecedente-masoquismo-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente MASOQUISMO)
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
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (printout t "Insertado prediagnostico Masoquismo-PERVERSIONES" crlf)
)

(defrule antecedente-voyeurismo
  (paciente_examen
    (dni ?dni)
    (antecedente VOYEURISMO)
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
      (diagnostico PERVERSIONES)
    )
  )
  (modify ?PACIENTE
    (prediagnostico ASIGNADO)
  )
  (printout t "Asignado prediagnostico Voyeurismo-PERVERSIONES" crlf)
)

(defrule antecedente-voyeurismo-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente VOYEURISMO)
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
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (printout t "Insertado prediagnostico Voyeurismo-PERVERSIONES" crlf)
)

(defrule antecedente-exhibicionismo
  (paciente_examen
    (dni ?dni)
    (antecedente EXHIBICIONISMO)
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
      (diagnostico PERVERSIONES)
    )
  )
  (modify ?PACIENTE
    (prediagnostico ASIGNADO)
  )
  (printout t "Asignado prediagnostico Exhibicionismo-PERVERSIONES" crlf)
)

(defrule antecedente-exhibicionismo-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente EXHIBICIONISMO)
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
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (printout t "Insertado prediagnostico Exhibicionismo-PERVERSIONES" crlf)
)

(defrule antecedente-adicciones
  (paciente_examen
    (dni ?dni)
    (antecedente ADICCIONES)
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
      (diagnostico OTRASPATOLOGIAS)
    )
  )
  (modify ?PACIENTE
    (prediagnostico ASIGNADO)
  )
  (printout t "Asignado prediagnostico Adicciones-OTRASPATOLOGIAS" crlf)
)

(defrule antecedente-adicciones-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente ADICCIONES)
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
  (test (not (subsetp (create$ OTRASPATOLOGIAS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 OTRASPATOLOGIAS)
  (printout t "Insertado prediagnostico Adicciones-OTRASPATOLOGIAS" crlf)
)

(defrule antecedente-trastornosalimenticios
  (paciente_examen
    (dni ?dni)
    (antecedente TRASTORNOSALIMENTICIOS)
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
      (diagnostico OTRASPATOLOGIAS)
    )
  )
  (modify ?PACIENTE
    (prediagnostico ASIGNADO)
  )
  (printout t "Asignado prediagnostico TrastornosAlimenticios-OTRASPATOLOGIAS" crlf)
)

(defrule antecedente-trastornosalimenticios-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente TRASTORNOSALIMENTICIOS)
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
  (test (not (subsetp (create$ OTRASPATOLOGIAS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 OTRASPATOLOGIAS)
  (printout t "Insertado prediagnostico TrastornosAlimenticios-OTRASPATOLOGIAS" crlf)
)

(defrule antecedente-trastornosansiedad
  (paciente_examen
    (dni ?dni)
    (antecedente TRASTORNOSDEANSIEDAD)
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
      (diagnostico OTRASPATOLOGIAS)
    )
  )
  (modify ?PACIENTE
    (prediagnostico ASIGNADO)
  )
  (printout t "Asignado prediagnostico TrastornosAnsiedad-OTRASPATOLOGIAS" crlf)
)

(defrule antecedente-trastornosansiedad-asignado
  (paciente_examen
    (dni ?dni)
    (antecedente TRASTORNOSDEANSIEDAD)
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
  (test (not (subsetp (create$ OTRASPATOLOGIAS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 OTRASPATOLOGIAS)
  (printout t "Insertado prediagnostico TrastornosAnsiedad-OTRASPATOLOGIAS" crlf)
)
