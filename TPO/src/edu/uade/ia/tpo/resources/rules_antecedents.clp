(defrule antecedente-neurosis
  (paciente_examen
    (dni ?dni)
    (antecedente NEUROSIS)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ NEUROSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 NEUROSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion NEUROSIS" crlf)
)

(defrule antecedente-psicosis
  (paciente_examen
    (dni ?dni)
    (antecedente PSICOSIS)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PSICOSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion PSICOSIS" crlf)
)

(defrule antecedente-perversiones
  (paciente_examen
    (dni ?dni)
    (antecedente PERVERSIONES)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion PERVERSIONES" crlf)
)

(defrule antecedente-otraspatologias
  (paciente_examen
    (dni ?dni)
    (antecedente OTRASPATOLOGIAS)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ OTRASPATOLOGIAS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 OTRASPATOLOGIAS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion OTRASPATOLOGIAS" crlf)
)

(defrule antecedente-histerias
  (paciente_examen
    (dni ?dni)
    (antecedente HISTERIAS)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ NEUROSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 NEUROSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion Histerias-NEUROSIS" crlf)
)

(defrule antecedente-neurosisobsesiva
  (paciente_examen
    (dni ?dni)
    (antecedente NEUROSISOBSESIVA)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ NEUROSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 NEUROSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion NeurosisObsevisa-NEUROSIS" crlf)
)

(defrule antecedente-fobias
  (paciente_examen
    (dni ?dni)
    (antecedente FOBIAS)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ NEUROSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 NEUROSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion Fobias-NEUROSIS" crlf)
)

(defrule antecedente-paranoias
  (paciente_examen
    (dni ?dni)
    (antecedente PARANOIAS)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PSICOSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion Paranoias-PSICOSIS" crlf)
)

(defrule antecedente-esquizofrenia
  (paciente_examen
    (dni ?dni)
    (antecedente ESQUIZOFRENIA)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PSICOSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion Esquizofrenia-PSICOSIS" crlf)
)

(defrule antecedente-parafrenia
  (paciente_examen
    (dni ?dni)
    (antecedente PARAFRENIA)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PSICOSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion Parafrenia-PSICOSIS" crlf)
)

(defrule antecedente-psicosismaniacodepresiva
  (paciente_examen
    (dni ?dni)
    (antecedente PSICOSISMANIACODEPRESIVA)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PSICOSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion PsicosisManiacoDepresiva-PSICOSIS" crlf)
)

(defrule antecedente-melancolia
  (paciente_examen
    (dni ?dni)
    (antecedente MELANCOLIA)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PSICOSIS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion Melancolia-PSICOSIS" crlf)
)

(defrule antecedente-fetichismo
  (paciente_examen
    (dni ?dni)
    (antecedente FETICHISMO)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion Fetichismo-PERVERSIONES" crlf)
)

(defrule antecedente-sadismo
  (paciente_examen
    (dni ?dni)
    (antecedente SADISMO)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion Sadismo-PERVERSIONES" crlf)
)

(defrule antecedente-masoquismo
  (paciente_examen
    (dni ?dni)
    (antecedente MASOQUISMO)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion Masoquismo-PERVERSIONES" crlf)
)

(defrule antecedente-voyeurismo
  (paciente_examen
    (dni ?dni)
    (antecedente VOYEURISMO)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion Voyeurismo-PERVERSIONES" crlf)
)

(defrule antecedente-exhibicionismo
  (paciente_examen
    (dni ?dni)
    (antecedente EXHIBICIONISMO)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 PERVERSIONES)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion Exhibicionismo-PERVERSIONES" crlf)
)

(defrule antecedente-adicciones
  (paciente_examen
    (dni ?dni)
    (antecedente ADICCIONES)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ OTRASPATOLOGIAS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 OTRASPATOLOGIAS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion Adicciones-OTRASPATOLOGIAS" crlf)
)

(defrule antecedente-trastornosalimenticios
  (paciente_examen
    (dni ?dni)
    (antecedente TRASTORNOSALIMENTICIOS)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ OTRASPATOLOGIAS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 OTRASPATOLOGIAS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion TrastornosAlimenticios-OTRASPATOLOGIAS" crlf)
)

(defrule antecedente-trastornosansiedad
  (paciente_examen
    (dni ?dni)
    (antecedente TRASTORNOSDEANSIEDAD)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ OTRASPATOLOGIAS) $?diagnosticos)))
  =>
  (insert$ $?diagnosticos 1 OTRASPATOLOGIAS)
  (delete-member$ $?diagnosticos NOSE)
  (printout t "Insertado presuncion TrastornosAnsiedad-OTRASPATOLOGIAS" crlf)
)
