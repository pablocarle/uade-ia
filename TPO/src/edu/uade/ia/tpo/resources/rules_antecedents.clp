(defrule antecedente-neurosis
  (paciente_examen
    (dni ?dni)
    (antecedente NEUROSIS)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ NEUROSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 NEUROSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico NEUROSIS" crlf)
)

(defrule antecedente-psicosis
  (paciente_examen
    (dni ?dni)
    (antecedente PSICOSIS)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PSICOSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico PSICOSIS" crlf)
)

(defrule antecedente-perversiones
  (paciente_examen
    (dni ?dni)
    (antecedente PERVERSIONES)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico PERVERSIONES" crlf)
)

(defrule antecedente-otraspatologias
  (paciente_examen
    (dni ?dni)
    (antecedente OTRASPATOLOGIAS)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ OTRASPATOLOGIAS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 OTRASPATOLOGIAS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico OTRASPATOLOGIAS" crlf)
)

(defrule antecedente-histerias
  (paciente_examen
    (dni ?dni)
    (antecedente HISTERIAS)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ NEUROSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 NEUROSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico Histerias-NEUROSIS" crlf)
)

(defrule antecedente-neurosisobsesiva
  (paciente_examen
    (dni ?dni)
    (antecedente NEUROSISOBSESIVA)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ NEUROSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 NEUROSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico NeurosisObsevisa-NEUROSIS" crlf)
)

(defrule antecedente-fobias
  (paciente_examen
    (dni ?dni)
    (antecedente FOBIAS)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ NEUROSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 NEUROSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico Fobias-NEUROSIS" crlf)
)

(defrule antecedente-paranoias
  (paciente_examen
    (dni ?dni)
    (antecedente PARANOIAS)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PSICOSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico Paranoias-PSICOSIS" crlf)
)

(defrule antecedente-esquizofrenia
  (paciente_examen
    (dni ?dni)
    (antecedente ESQUIZOFRENIA)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PSICOSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico Esquizofrenia-PSICOSIS" crlf)
)

(defrule antecedente-parafrenia
  (paciente_examen
    (dni ?dni)
    (antecedente PARAFRENIA)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PSICOSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico Parafrenia-PSICOSIS" crlf)
)

(defrule antecedente-psicosismaniacodepresiva
  (paciente_examen
    (dni ?dni)
    (antecedente PSICOSISMANIACODEPRESIVA)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PSICOSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico PsicosisManiacoDepresiva-PSICOSIS" crlf)
)

(defrule antecedente-melancolia
  (paciente_examen
    (dni ?dni)
    (antecedente MELANCOLIA)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PSICOSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico Melancolia-PSICOSIS" crlf)
)

(defrule antecedente-fetichismo
  (paciente_examen
    (dni ?dni)
    (antecedente FETICHISMO)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico Fetichismo-PERVERSIONES" crlf)
)

(defrule antecedente-sadismo
  (paciente_examen
    (dni ?dni)
    (antecedente SADISMO)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico Sadismo-PERVERSIONES" crlf)
)

(defrule antecedente-masoquismo
  (paciente_examen
    (dni ?dni)
    (antecedente MASOQUISMO)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico Masoquismo-PERVERSIONES" crlf)
)

(defrule antecedente-voyeurismo
  (paciente_examen
    (dni ?dni)
    (antecedente VOYEURISMO)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico Voyeurismo-PERVERSIONES" crlf)
)

(defrule antecedente-exhibicionismo
  (paciente_examen
    (dni ?dni)
    (antecedente EXHIBICIONISMO)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico Exhibicionismo-PERVERSIONES" crlf)
)

(defrule antecedente-adicciones
  (paciente_examen
    (dni ?dni)
    (antecedente ADICCIONES)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ OTRASPATOLOGIAS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 OTRASPATOLOGIAS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico Adicciones-OTRASPATOLOGIAS" crlf)
)

(defrule antecedente-trastornosalimenticios
  (paciente_examen
    (dni ?dni)
    (antecedente TRASTORNOSALIMENTICIOS)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ OTRASPATOLOGIAS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 OTRASPATOLOGIAS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico TrastornosAlimenticios-OTRASPATOLOGIAS" crlf)
)

(defrule antecedente-trastornosansiedad
  (paciente_examen
    (dni ?dni)
    (antecedente TRASTORNOSDEANSIEDAD)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ OTRASPATOLOGIAS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 OTRASPATOLOGIAS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado prediagnostico TrastornosAnsiedad-OTRASPATOLOGIAS" crlf)
)
