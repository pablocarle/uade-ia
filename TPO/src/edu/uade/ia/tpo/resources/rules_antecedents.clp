(defrule antecedente-neurosis
  (paciente_examen
    (dni ?dni)
    (antecedente NEUROSIS)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ NEUROSIS) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 NEUROSIS))
  )
  (printout t "Insertado presuncion NEUROSIS" crlf)
)

(defrule antecedente-psicosis
  (paciente_examen
    (dni ?dni)
    (antecedente PSICOSIS)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 PSICOSIS))
  )
  (printout t "Insertado presuncion PSICOSIS" crlf)
)

(defrule antecedente-perversiones
  (paciente_examen
    (dni ?dni)
    (antecedente PERVERSIONES)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 PERVERSIONES))
  )
  (printout t "Insertado presuncion PERVERSIONES" crlf)
)

(defrule antecedente-otraspatologias
  (paciente_examen
    (dni ?dni)
    (antecedente OTRASPATOLOGIAS)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ OTRASPATOLOGIAS) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 OTRASPATOLOGIAS))
  )
  (printout t "Insertado presuncion OTRASPATOLOGIAS" crlf)
)

(defrule antecedente-histerias
  (paciente_examen
    (dni ?dni)
    (antecedente HISTERIAS)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ NEUROSIS) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 NEUROSIS))
  )
  (printout t "Insertado presuncion Histerias-NEUROSIS" crlf)
)

(defrule antecedente-neurosisobsesiva
  (paciente_examen
    (dni ?dni)
    (antecedente NEUROSISOBSESIVA)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ NEUROSIS) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 NEUROSIS))
  )
  (printout t "Insertado presuncion NeurosisObsevisa-NEUROSIS" crlf)
)

(defrule antecedente-fobias
  (paciente_examen
    (dni ?dni)
    (antecedente FOBIAS)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ NEUROSIS) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 NEUROSIS))
  )
  (printout t "Insertado presuncion Fobias-NEUROSIS" crlf)
)

(defrule antecedente-paranoias
  (paciente_examen
    (dni ?dni)
    (antecedente PARANOIAS)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 PSICOSIS))
  )
  (printout t "Insertado presuncion Paranoias-PSICOSIS" crlf)
)

(defrule antecedente-esquizofrenia
  (paciente_examen
    (dni ?dni)
    (antecedente ESQUIZOFRENIA)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 PSICOSIS))
  )
  (printout t "Insertado presuncion Esquizofrenia-PSICOSIS" crlf)
)

(defrule antecedente-parafrenia
  (paciente_examen
    (dni ?dni)
    (antecedente PARAFRENIA)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 PSICOSIS))
  )
  (printout t "Insertado presuncion Parafrenia-PSICOSIS" crlf)
)

(defrule antecedente-psicosismaniacodepresiva
  (paciente_examen
    (dni ?dni)
    (antecedente PSICOSISMANIACODEPRESIVA)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 PSICOSIS))
  )
  (printout t "Insertado presuncion PsicosisManiacoDepresiva-PSICOSIS" crlf)
)

(defrule antecedente-melancolia
  (paciente_examen
    (dni ?dni)
    (antecedente MELANCOLIA)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSIS) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 PSICOSIS))
  )
  (printout t "Insertado presuncion Melancolia-PSICOSIS" crlf)
)

(defrule antecedente-fetichismo
  (paciente_examen
    (dni ?dni)
    (antecedente FETICHISMO)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 PERVERSIONES))
  )
  (printout t "Insertado presuncion Fetichismo-PERVERSIONES" crlf)
)

(defrule antecedente-sadismo
  (paciente_examen
    (dni ?dni)
    (antecedente SADISMO)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 PERVERSIONES))
  )
  (printout t "Insertado presuncion Sadismo-PERVERSIONES" crlf)
)

(defrule antecedente-masoquismo
  (paciente_examen
    (dni ?dni)
    (antecedente MASOQUISMO)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 PERVERSIONES))
  )
  (printout t "Insertado presuncion Masoquismo-PERVERSIONES" crlf)
)

(defrule antecedente-voyeurismo
  (paciente_examen
    (dni ?dni)
    (antecedente VOYEURISMO)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 PERVERSIONES))
  )
  (printout t "Insertado presuncion Voyeurismo-PERVERSIONES" crlf)
)

(defrule antecedente-exhibicionismo
  (paciente_examen
    (dni ?dni)
    (antecedente EXHIBICIONISMO)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERVERSIONES) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 PERVERSIONES))
  )
  (printout t "Insertado presuncion Exhibicionismo-PERVERSIONES" crlf)
)

(defrule antecedente-adicciones
  (paciente_examen
    (dni ?dni)
    (antecedente ADICCIONES)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ OTRASPATOLOGIAS) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 OTRASPATOLOGIAS))
  )
  (printout t "Insertado presuncion Adicciones-OTRASPATOLOGIAS" crlf)
)

(defrule antecedente-trastornosalimenticios
  (paciente_examen
    (dni ?dni)
    (antecedente TRASTORNOSALIMENTICIOS)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ OTRASPATOLOGIAS) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 OTRASPATOLOGIAS))
  )
  (printout t "Insertado presuncion TrastornosAlimenticios-OTRASPATOLOGIAS" crlf)
)

(defrule antecedente-trastornosansiedad
  (paciente_examen
    (dni ?dni)
    (antecedente TRASTORNOSDEANSIEDAD)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ OTRASPATOLOGIAS) $?diagnosticos)))
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 OTRASPATOLOGIAS))
  )
  (printout t "Insertado presuncion TrastornosAnsiedad-OTRASPATOLOGIAS" crlf)
)
