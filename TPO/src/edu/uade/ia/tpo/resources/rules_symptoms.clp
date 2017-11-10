(defrule presuncion-inestabilidad-emocional
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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

(defrule presuncion-histeria
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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

(defrule presuncion-impulsivo
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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

(defrule presuncion-obsesivo
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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

; TODO Regla 25. Verificar contra los presuncions
;(defrule presuncion-neurosisobsesiva
;  ()
;  =>
;
;)

(defrule presuncion-persecusion
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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

; TODO Regla 27. Verificar contra los presuncions
;(defrule presuncion-fobia
;  ()
;  =>
;
;)

(defrule presuncion-percepcionalterada
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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

(defrule presuncion-ausenciaemocional
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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

; TODO Regla 30, mezcla entre sintoma y presuncion
(defrule presuncion-esquizofrenia
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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

(defrule presuncion-paranoia
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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

; inferencia 32
(defrule presuncion-animodepresivo
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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

; inferencia 33
(defrule presuncion-desmotivacion
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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
  (insert$ $?diagnosticos 1 DESMOTIVACION)
  (delete-member$ $?diagnosticos NOSE)
)

; inferencia 34
(defrule presuncion-desgano
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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
  (insert$ $?diagnosticos 1 DESGANO)
  (delete-member$ $?diagnosticos NOSE)
)

; inferencia 35
(defrule presuncion-tendenciasuicida
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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
  (insert$ $?diagnosticos 1 TENDENCIASUICIDA)
  (delete-member$ $?diagnosticos NOSE)
)

; inferencia 36
(defrule presuncion-hiperactividad
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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
  (insert$ $?diagnosticos 1 ESTADOSMANIACODEHIPERACTIVIDAD)
  (delete-member$ $?diagnosticos NOSE)
)

; inferencia 37
(defrule presuncion-aceleramiento
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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
  (insert$ $?diagnosticos 1 ACELERAMIENTO)
  (delete-member$ $?diagnosticos NOSE)
)

; TODO Inferencia 38 mezcla
;(defrule presuncion-psicosismaniacodepresiva
;  ()
;  =>
;
;)

; Inferencia 39
(defrule presuncion-estrestemporal
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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
  (insert$ $?diagnosticos 1 ESTRESTEMPORAL)
  (delete-member$ $?diagnosticos NOSE)
)

; Inferencia 40
(defrule presuncion-fuerteangustia
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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
  (insert$ $?diagnosticos 1 FUERTEANGUSTIA)
  (delete-member$ $?diagnosticos NOSE)
)

; TODO Inferencia 41. Sobre presuncions
(defrule presuncion-ataquedepanico
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ ATAQUEDEPANICO) $?diagnosticos)))
  (test
    (and
      (member$ ESTRES $?sintomas)
      (member$ SUDORACION $?sintomas)
    )
  )
  =>
  (insert$ $?diagnosticos 1 ATAQUEDEPANICO)
  (delete-member$ $?diagnosticos NOSE)
)

; inferencia 42 / 43
(defrule presuncion-trastornoalimenticio
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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
  (insert$ $?diagnosticos 1 TRASTORNOSALIMENTICIOS)
  (delete-member$ $?diagnosticos NOSE)
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
  (paciente_presuncion
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
  (insert$ $?diagnosticos 1 IMPULSIVIDADSEXUAL)
  (delete-member$ $?diagnosticos NOSE)
)

; Inferencia 46
(defrule presuncion-trastornosexual
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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
  (insert$ $?diagnosticos 1 TRASTORNOSEXUAL)
  (delete-member$ $?diagnosticos NOSE)
)

; Inferencia 47
(defrule presuncion-placeresasexuales
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
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
  (insert$ $?diagnosticos 1 PLACERESASEXUALES)
  (delete-member$ $?diagnosticos NOSE)
)

; TODO Inferencia 48 mezcla
;(defrule presuncion-fetichismo
;  ()
;  =>
;
;)

; TODO Inferencia 49 Mezcla
(defrule presuncion-sadismo
  (paciente_examen
    (dni ?dni)
    (sintomas $?sintomas)
  )
  (paciente_presuncion
    (dni ?dni)
    (diagnostico $?diagnosticos)
  )
  (test (not (subsetp (create$ SADISMO) $?diagnosticos)))
  (test
    (or
      (member$ PLACERSEXUALCONUNTALISMAN $?sintomas)
      (member$ PLACERSEXUALCONORGANOSNOSEXUALES $?sintomas)
    )
  )
  =>
  (insert$ $?diagnosticos 1 PLACERESASEXUALES)
  (delete-member$ $?diagnosticos NOSE)
)

; TODO Inferencia 50 Mezcla
(defrule presuncion-exhibicionismo
  ()
  =>

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

; inferencia (TODO)
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
