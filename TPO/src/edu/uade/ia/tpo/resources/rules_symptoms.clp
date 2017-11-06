(defrule prediagnostico-inestabilidad-emocional
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ INESTABILIDADEMOCIONAL) $?diagnosticos)))
  (test
    (and
      (member$ GANASDELLORAR $?sintomas)
      (member$ GANASDEREIR $?sintomas)
      (member$ CAMBIOSDEESTADODEANIMO $?sintomas)
    )
  )
  =>
  (insert$ $?diagnosticos 1 INESTABILIDADEMOCIONAL)
  (delete-member$ $?diagnosticos NOSE)
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
  (test (not (subsetp (create$ HISTERIA) $?diagnosticos)))
  (test
    (and
      (member$ DOLENCIASCORPORALES $?sintomas)
      (member$ INESTABILIDADEMOCIONAL $?sintomas)
    )
  )
  =>
  (insert$ $?diagnosticos 1 HISTERIA)
  (delete-member$ $?diagnosticos NOSE)
)

(defrule prediagnostico-impulsivo
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ IMPULSIVO) $?diagnosticos)))
  (test
    (or
      (member$ IMPULSOS $?sintomas)
      (member$ SINTOMASCOMPULSIVOS $?sintomas)
    )
  )
  =>
  (insert$ $?diagnosticos 1 IMPULSIVO)
  (delete-member$ $?diagnosticos NOSE)
)

(defrule prediagnostico-obsesivo
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ OBSESIVO) $?diagnosticos)))
  (test
    (and
      (member$ REORDENACOSASPREVIAMENTEORDENADAS $?sintomas)
      (member$ ANSIEDAD $?sintomas)
    )
  )
  =>
  (insert$ $?diagnosticos 1 OBSESIVO)
  (delete-member$ $?diagnosticos NOSE)
)

; TODO Regla 25. Verificar contra los prediagnosticos
(defrule prediagnostico-neurosisobsesiva
  ()
  =>

)

(defrule prediagnostico-persecusion
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERSECUCION) $?diagnosticos)))
  (test
    (and
      (member$ IMAGENESRECURRENTES $?sintomas)
      (member$ TEMORESESPECIFICOS $?sintomas)
    )
  )
  =>
  (insert$ $?diagnosticos 1 PERSECUCION)
  (delete-member$ $?diagnosticos NOSE)
)

; TODO Regla 27. Verificar contra los prediagnosticos
(defrule prediagnostico-fobia
  ()
  =>

)

(defrule prediagnostico-percepcionalterada
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PERCEPCIONALTERADA) $?diagnosticos)))
  (test
    (and
      (member$ DELIRIOS $?sintomas)
      (member$ ALUCIONACIONES $?sintomas)
    )
  )
  =>
  (insert$ $?diagnosticos 1 PERCEPCIONALTERADA)
  (delete-member$ $?diagnosticos NOSE)
)

(defrule prediagnostico-ausenciaemocional
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ AUSENCIAEMOCIONAL) $?diagnosticos)))
  (test
    (and
      (member$ DESORGANIZADO $?sintomas)
      (member$ COMPORTAMIENTOCATATONICO $?sintomas)
    )
  )
  =>
  (insert$ $?diagnosticos 1 AUSENCIAEMOCIONAL)
  (delete-member$ $?diagnosticos NOSE)
)

; TODO Regla 30, mezcla entre sintoma y prediagnostico
(defrule prediagnostico-esquizofrenia
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ ESQUIZOFRENIA) $?diagnosticos)))
  (test
    (and
      (member$ PERCEPCIONALTERADA $?sintomas)
      (member$ AUSENCIAEMOCIONAL $?sintomas)
    )
  )
  =>
  (insert$ $?diagnosticos 1 PERSECUCION)
  (delete-member$ $?diagnosticos NOSE)
)

(defrule prediagnostico-paranoia
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PARANOIA) $?diagnosticos)))
  (test
    (and
      (member$ DELIRIOSDEPERSECUCION $?sintomas)
      (member$ EROTOMANIA $?sintomas)
      (member$ DELIRIOSDEGRANDEZA $?sintomas)
    )
  )
  =>
  (insert$ $?diagnosticos 1 PARANOIA)
  (delete-member$ $?diagnosticos NOSE)
)

; inferencia 30
(defrule prediagnostico-animodepresivo
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_prediagnostico
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ ESTADOSDEANIMODEPRESIVOS) $?diagnosticos)))
  (test
    (or
      (member$ SENTIMIENTOSDEVACIO $?sintomas)
      (member$ SENTIMIENTOSDETRISTEZA $?sintomas)
    )
  )
  =>
  (insert$ $?diagnosticos 1 ESTADOSDEANIMODEPRESIVOS)
  (delete-member$ $?diagnosticos NOSE)
)
