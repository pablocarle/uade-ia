(defrule presuncion-inestabilidad-emocional
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
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
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 INESTABILIDADEMOCIONAL))
  )
)

(defrule presuncion-histeria
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
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
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 HISTERIA))
  )
)

(defrule presuncion-impulsivo
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
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
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 IMPULSIVO))
  )
)

(defrule presuncion-obsesivo
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
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
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 OBSESIVO))
  )
)

; Inferencia 25
(defrule presuncion-neurosisobsesiva
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ NEUROSISOBSESIVA) $?diagnosticos)))
  (test
    (and
      (member$ IDEASOBSESIVAS $?sintomas)
      (member$ IMPULSIVO $?diagnosticos)
      (member$ OBSESIVO $?diagnosticos)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 NEUROSISOBSESIVA))
  )
)

(defrule presuncion-persecusion
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
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
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 PERSECUCION))
  )
)

; Inferencia 27
(defrule presuncion-fobia
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ FOBIA) $?diagnosticos)))
  (test
    (member$ PERSECUCION $?diagnosticos)
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 FOBIA))
  )
)

(defrule presuncion-percepcionalterada
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
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
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 PERCEPCIONALTERADA))
  )
)

(defrule presuncion-ausenciaemocional
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
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
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 AUSENCIAEMOCIONAL))
  )
)

; Inferencia 30
(defrule presuncion-esquizofrenia
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ ESQUIZOFRENIA) $?diagnosticos)))
  (test
    (and
      (member$ PERCEPCIONALTERADA $?diagnosticos)
      (member$ AUSENCIAEMOCIONAL $?diagnosticos)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 ESQUIZOFRENIA))
  )
)

(defrule presuncion-paranoia
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
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
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 PARANOIA))
  )
)

; inferencia 32
(defrule presuncion-animodepresivo
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
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
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 ESTADOSDEANIMODEPRESIVOS))
  )
)

; inferencia 33
(defrule presuncion-desmotivacion
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ DESMOTIVACION) $?diagnosticos)))
  (test
    (and
      (member$ PERDIDADEINTERES $?sintomas)
      (member$ PERDIDADECAPACIDADPARAELPLACER $?sintomas)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 DESMOTIVACION))
  )
)

; inferencia 34
(defrule presuncion-desgano
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ DESGANO) $?diagnosticos)))
  (test
    (and
      (member$ FALTADEENERGIA $?sintomas)
      (member$ FALTADEVOLUNTAD $?sintomas)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 DESGANO))
  )
)

; inferencia 35
(defrule presuncion-tendenciasuicida
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ TENDENCIASUICIDA) $?diagnosticos)))
  (test
    (and
      (member$ SENTIMIENTODECULPA $?sintomas)
      (member$ IDEASDESUICIDIO $?sintomas)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 TENDENCIASUICIDA))
  )
)

; inferencia 36
(defrule presuncion-hiperactividad
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ ESTADOSMANIACODEHIPERACTIVIDAD) $?diagnosticos)))
  (test
    (and
      (member$ INSOMNIO $?sintomas)
      (member$ ESTADOSDEANIMOIRRITABLES $?sintomas)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 ESTADOSMANIACODEHIPERACTIVIDAD))
  )
)

; inferencia 37
(defrule presuncion-aceleramiento
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ ACELERAMIENTO) $?diagnosticos)))
  (test
    (or
      (member$ VERBORRAGIA $?sintomas)
      (member$ PENSAMIENTOACELERADO $?sintomas)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 ACELERAMIENTO))
  )
)

; Inferencia 38
(defrule presuncion-psicosismaniacodepresiva
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PSICOSISMANIACODEPRESIVA) $?diagnosticos)))
  (test
    (and
      (member$ ESTADOSDEANIMODEPRESIVOS $?diagnosticos)
      (member$ DESMOTIVACION $?diagnosticos)
      (member$ DESGANO $?diagnosticos)
      (member$ TENDENCIASUICIDA $?diagnosticos)
      (member$ ESTADOSMANIACODEHIPERACTIVIDAD $?diagnosticos)
      (member$ ACELERAMIENTO $?diagnosticos)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 PSICOSISMANIACODEPRESIVA))
  )
)

; Inferencia 39
(defrule presuncion-estrestemporal
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ ESTRESTEMPORAL) $?diagnosticos)))
  (test
    (and
      (member$ MIEDOINTENSOTEMPORAL $?sintomas)
      (member$ MALESTARINTENSOTEMPORAL $?sintomas)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 ESTRESTEMPORAL))
  )
)

; Inferencia 40
(defrule presuncion-fuerteangustia
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ FUERTEANGUSTIA) $?diagnosticos)))
  (test
    (and
      (member$ PALPITACIONES $?sintomas)
      (member$ SUDORACION $?sintomas)
      (member$ SENSACIONDEAHOGO $?sintomas)
      (member$ OPRESIONTORACICA $?sintomas)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 FUERTEANGUSTIA))
  )
)

; Inferencia 41. Sobre presuncions
(defrule presuncion-ataquedepanico
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ ATAQUEDEPANICO) $?diagnosticos)))
  (test
    (and
      (member$ ESTRESTEMPORAL $?diagnosticos)
      (member$ FUERTEANGUSTIA $?diagnosticos)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 ATAQUEDEPANICO))
  )
)

; inferencia 42 / 43
(defrule presuncion-trastornoalimenticio
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ TRASTORNOSALIMENTICIOS) $?diagnosticos)))
  (test
    (or
      (member$ ANOREXIA $?sintomas)
      (member$ BULIMIA $?sintomas)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 TRASTORNOSALIMENTICIOS))
  )
)

; inferencia 44
(defrule diagnostico-otras-patologias-1
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (test
    (member$ ADICCIONES $?sintomas)
  )
  =>
  (assert
    (paciente_diagnostico
      (dni ?dni)
      (diagnostico OTRASPATOLOGIAS)
    )
  )
)

; Inferencia 45
(defrule presuncion-impulsividadsexual
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ IMPULSIVIDADSEXUAL) $?diagnosticos)))
  (test
    (or
      (member$ IMPULSOSSEXUALESINTENSOS $?sintomas)
      (member$ IMPULSOSSEXUALESRECURRENTES $?sintomas)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 IMPULSIVIDADSEXUAL))
  )
)

; Inferencia 46
(defrule presuncion-trastornosexual
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ TRASTORNOSEXUAL) $?diagnosticos)))
  (test
    (and
      (member$ FANTASIASSEXUALES $?sintomas)
      (member$ PLACERSEXUALCONOBJETOSACTIVIDADESOSITUACIONESPOCOHABITUALES $?sintomas)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 TRASTORNOSEXUAL))
  )
)

; Inferencia 47
(defrule presuncion-placeresasexuales
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ PLACERESASEXUALES) $?diagnosticos)))
  (test
    (or
      (member$ PLACERSEXUALCONUNTALISMAN $?sintomas)
      (member$ PLACERSEXUALCONORGANOSNOSEXUALES $?sintomas)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 PLACERESASEXUALES))
  )
)

; Inferencia 48
(defrule presuncion-fetichismo
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ FETICHISMO) $?diagnosticos)))
  (test
    (and
      (member$ IMPULSIVIDADSEXUAL $?diagnosticos)
      (member$ TRASTORNOSEXUAL $?diagnosticos)
      (member$ PLACERESASEXUALES $?diagnosticos)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 FETICHISMO))
  )
)

; Inferencia 49
(defrule presuncion-sadismo
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ SADISMO) $?diagnosticos)))
  (test
    (and
      (member$ IMPULSIVIDADSEXUAL $?diagnosticos)
      (member$ TRASTORNOSEXUAL $?diagnosticos)
      (member$ PLACERSEXUALATRAVESDELDOLORFISICO $?sintomas)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 SADISMO))
  )
)

; Inferencia 50
(defrule presuncion-exhibicionismo
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  ?PRES <- (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ EXHIBICIONISMO) $?diagnosticos)))
  (test
    (and
      (member$ IMPULSIVIDADSEXUAL $?diagnosticos)
      (member$ TRASTORNOSEXUAL $?diagnosticos)
      (member$ PRACTICASSEXUALESENPUBLICO $?sintomas)
    )
  )
  =>
  (modify ?PRES
    (diagnostico (insert$ (delete-member$ $?diagnosticos NOSE) 1 EXHIBICIONISMO))
  )
)

; Inferencia 51 / 52 / 53
(defrule diagnostico-neurosis
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  ?PACIENTE <- (paciente
    (dni ?dni)
    (diagnostico NOSE)
  )
  (test
    (or
      (member$ HISTERIA $?diagnosticos)
      (member$ NEUROSISOBSESIVA $?diagnosticos)
      (member$ FOBIA $?diagnosticos)
    )
  )
  =>
  (assert
    (paciente_diagnostico
      (dni ?dni)
      (diagnostico NEUROSIS)
    )
  )
  (modify ?PACIENTE
    (diagnostico ASIGNADO)
  )
)

; Inferencia 54 / 55 / 56
(defrule diagnostico-psicosis
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  ?PACIENTE <- (paciente
    (dni ?dni)
    (diagnostico NOSE)
  )
  (test
    (or
      (member$ ESQUIZOFRENIA $?diagnosticos)
      (member$ PARANOIA $?diagnosticos)
      (member$ PSICOSISMANIACODEPRESIVA $?diagnosticos)
    )
  )
  =>
  (assert
    (paciente_diagnostico
      (dni ?dni)
      (diagnostico PSICOSIS)
    )
  )
  (modify ?PACIENTE
    (diagnostico ASIGNADO)
  )
)

; Inferencia 57
(defrule diagnostico-otraspatologias-panico
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  ?PACIENTE <- (paciente
    (dni ?dni)
    (diagnostico NOSE)
  )
  (test
    (member$ ATAQUEDEPANICO $?diagnosticos)
  )
  =>
  (assert
    (paciente_diagnostico
      (dni ?dni)
      (diagnostico OTRASPATOLOGIAS)
    )
  )
  (modify ?PACIENTE
    (diagnostico ASIGNADO)
  )
)

; Inferencia 58 / 59 / 60
(defrule diagnostico-perversion
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  ?PACIENTE <- (paciente
    (dni ?dni)
    (diagnostico NOSE)
  )
  (test
    (or
      (member$ FETICHISMO $?diagnosticos)
      (member$ SADISMO $?diagnosticos)
      (member$ EXHIBICIONISMO $?diagnosticos)
    )
  )
  =>
  (assert
    (paciente_diagnostico
      (dni ?dni)
      (diagnostico PERVERSION)
    )
  )
  (modify ?PACIENTE
    (diagnostico ASIGNADO)
  )
)

; Inferencia 61 / 62 / 63
(defrule diagnostico-neurosis-antecedente
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  ?PACIENTE <- (paciente
    (dni ?dni)
    (diagnostico NOSE)
  )
  (test
    (and
      (member$ NEUROSIS $?diagnosticos)
      (or
        (and
          (member$ INESTABILIDADEMOCIONAL $?diagnosticos)
          (member$ HISTERIA $?diagnosticos)
        )
        (and
          (member$ PERSECUCION $?diagnosticos)
          (member$ IMPULSIVO $?diagnosticos)
        )
        (member$ FOBIA $?diagnosticos)
      )
    )
  )
  =>
  (assert
    (paciente_diagnostico
      (dni ?dni)
      (diagnostico NEUROSIS)
    )
  )
  (modify ?PACIENTE
    (diagnostico ASIGNADO)
  )
)

; Inferencia 64 / 65 / 66 / 67 / 68
(defrule diagnostico-psicosis-antecedente
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  ?PACIENTE <- (paciente
    (dni ?dni)
    (diagnostico NOSE)
  )
  (test
    (and
      (member$ PSICOSIS $?diagnosticos)
      (or
        (and
          (member$ PERCEPCIONALTERADA $?diagnosticos)
          (member$ PARANOIA $?diagnosticos)
        )
        (and
          (member$ ESQUIZOFRENIA $?diagnosticos)
          (member$ PARANOIA $?diagnosticos)
        )
        (and
          (member$ ESTADOSDEANIMODEPRESIVOS $?diagnosticos)
          (member$ DESMOTIVACION $?diagnosticos)
        )
        (and
          (member$ DESGANO $?diagnosticos)
          (member$ ESTADOSMANIACODEHIPERACTIVIDAD $?diagnosticos)
        )
        (member$ TENDENCIASUICIDA $?diagnosticos)
      )
    )
  )
  =>
  (assert
    (paciente_diagnostico
      (dni ?dni)
      (diagnostico PSICOSIS)
    )
  )
  (modify ?PACIENTE
    (diagnostico ASIGNADO)
  )
)

; Inferencia 69 / 70
(defrule diagnostico-otraspatologias-2
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  ?PACIENTE <- (paciente
    (dni ?dni)
    (diagnostico NOSE)
  )
  (test
    (and
      (member$ OTRASPATOLOGIAS $?diagnosticos)
      (or
        (member$ TRASTORNOSALIMENTICIOS $?diagnosticos)
        (and
          (member$ ESTRESTEMPORAL $?diagnosticos)
          (member$ FUERTEANGUSTIA $?diagnosticos)
        )
      )
    )
  )
  =>
  (assert
    (paciente_diagnostico
      (dni ?dni)
      (diagnostico OTRASPATOLOGIAS)
    )
  )
  (modify ?PACIENTE
    (diagnostico ASIGNADO)
  )
)

; Inferencia 71 / 72 / 73 / 74 / 75
(defrule diagnostico-perversion-antecedente-1
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  ?PACIENTE <- (paciente
    (dni ?dni)
    (diagnostico NOSE)
  )
  (test
    (and
      (member$ PERVERSIONES $?diagnosticos)
      (or
        (member$ SADISMO $?diagnosticos)
        (member$ EXHIBICIONISMO $?diagnosticos)
        (member$ FETICHISMO $?diagnosticos)
        (and
          (member$ TRASTORNOSEXUAL $?diagnosticos)
          (member$ PLACERESASEXUALES $?diagnosticos)
        )
        (member$ IMPULSIVIDADSEXUAL $?diagnosticos)
      )
    )
  )
  =>
  (assert
    (paciente_diagnostico
      (dni ?dni)
      (diagnostico PERVERSION)
    )
  )
  (modify ?PACIENTE
    (diagnostico ASIGNADO)
  )
)

; Inferencia 76
(defrule diagnostico-otraspatologias
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  ?PACIENTE <- (paciente
    (dni ?dni)
    (diagnostico NOSE)
  )
  (test
    (member$ TRASTORNOSALIMENTICIOS $?diagnosticos)
  )
  =>
  (assert
    (paciente_diagnostico
      (dni ?dni)
      (diagnostico OTRASPATOLOGIAS)
    )
  )
  (modify ?PACIENTE
    (diagnostico ASIGNADO)
  )
)
