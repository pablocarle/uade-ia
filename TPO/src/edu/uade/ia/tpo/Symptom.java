package edu.uade.ia.tpo;

public enum Symptom {

    NINGUNO("Ninguno", null),
    GANASDELLORAR("Ganas de Llorar", SymptomCategory.STATE_OF_MIND),
    GANASDEREIR("Ganas de Reir", SymptomCategory.STATE_OF_MIND),
    CAMBIOSDEESTADODEANIMO("Cambios de estado de animo", SymptomCategory.STATE_OF_MIND),
    INESTABILIDADEMOCIONAL("Inestabilidad emocional", SymptomCategory.STATE_OF_MIND),
    DOLENCIASCORPORALES("Dolencias corporales", SymptomCategory.PHYSICAL),
    IMPULSOS("Impulsos", SymptomCategory.DESIRES),
    SINTOMASCOMPULSIVOS("Sintomas compulsivos", SymptomCategory.BEHAVIOUR),
    IMPULSIVO("Impulsivo", SymptomCategory.DESIRES),
    REORDENACOSASPREVIAMENTEORDENADAS("Reordena cosas previamente ordenadas", SymptomCategory.BEHAVIOUR),
    ANSIEDAD("Ansiedad", SymptomCategory.PERTURBATION),
    OBSESIVO("Obsesivo", SymptomCategory.PERTURBATION),
    IDEASOBSESIVAS("Ideas obsesivas", SymptomCategory.PERTURBATION),
    NEUROSISOBSESIVA("Neurosis obsesiva", SymptomCategory.PERTURBATION),
    IMAGENESRECURRENTES("Imagenes recurrentes", SymptomCategory.PERTURBATION),
    TEMORESESPECIFICOS("Temores especificos", SymptomCategory.PERTURBATION),
    PERSECUCION("Persecucion", SymptomCategory.PERTURBATION),
    FOBIA("Fobia", SymptomCategory.PERTURBATION),
    DELIRIOS("Delirios", SymptomCategory.PERTURBATION),
    ALUCIONACIONES("Alucinaciones", SymptomCategory.PERTURBATION),
    PERCEPCIONALTERADA("Percepcion alterada", SymptomCategory.PERTURBATION),
    DESORGANIZADO("Desorganizado", SymptomCategory.BEHAVIOUR),
    COMPORTAMIENTOCATATONICO("Comportamiento catatonico", SymptomCategory.BEHAVIOUR),
    AUSENCIAEMOCIONAL("Ausencia emocional", ),
    ESQUIZOFRENIA("Esquizofrenia"),
    DELIRIOSDEPERSECUCION("Delirios de persecucion"),
    EROTOMANIA("Erotomania"),
    DELIRIOSDEGRANDEZA("Delirios de grandeza"),
    PARANOIA("Paranoia"),
    SENTIMIENTOSDEVACIO("Sentimientos de vacio"),
    SENTIMIENTOSDETRISTEZA("Sentimientos de tristeza"),
    ESTADOSDEANIMODEPRESIVOS("Estados de animo depresivos"),
    PERDIDADEINTERES("Perdida de interes"),
    PERDIDADECAPACIDADPARAELPLACER("Perdida de capacidad para el placer"),
    FALTADEVOLUNTAD("Falta de voluntad"),
    FALTADEENERGIA("Falta de energia"),
    SENTIMIENTODECULPA("Sentimiento de culpa"),
    IDEASDESUICIDIO("Ideas de suicidio"),
    TENDENCIASUICIDA("Tendencia suicida"),
    INSOMNIO("Insomnio"),
    ESTADOSDEANIMOIRRITABLES("Estados de animo irritables"),
    ESTADOSMANIACODEHIPERACTIVIDAD("Estados maniaco de hiperactividad"),
    VERBORRAGIA("Verborragia"),
    PENSAMIENTOACELERADO("Pensamiento acelerado"),
    ACELERAMIENTO("Aceleramiento"),
    DESMOTIVACION("Desmotivacion"),
    DESGANO("Desgano"),
    PSICOSISMANIACODEPRESIVA("Psicosis maniaco-depresiva"),
    MIEDOINTENSOTEMPORAL("Miedo intenso-temporal"),
    MALESTARINTENSOTEMPORAL("Malestar intenso-temporal"),
    PALPITACIONES("Palpitaciones"),
    SUDORACION("Sudoracion"),
    SENSACIONDEAHOGO("Sensacion de ahogo"),
    OPRESIONTORACICA("Opresion toracica"),
    FUERTEANGUSTIA("Fuerte angustia"),
    ESTRESTEMPORAL("Estres temporal"),
    ATAQUEDEPANICO("Ataque de panico"),
    ANOREXIA("Anorexia"),
    BULIMIA("Bulimia"),
    TRASTORNOSALIMENTICIOS("Trastornos alimenticios"),
    ADICCIONES("Adicciones"),
    IMPULSOSSEXUALESINTENSOS("Impulsos sexuales intensos"),
    IMPULSOSSEXUALESRECURRENTES("Impulsos sexuales recurrentes"),
    FANTASIASSEXUALES("Fantasias sexuales"),
    PLACERSEXUALCONOBJETOSACTIVIDADESOSITUACIONESPOCOHABITUALES("Placer sexual con objetos actividades o situaciones poco habituales"),
    TRASTORNOSEXUAL("Trastorno sexual"),
    PLACERSEXUALCONUNTALISMAN("Placer sexual con un talisman"),
    PLACERSEXUALCONORGANOSNOSEXUALES("Placer sexual con organos no sexuales"),
    PLACERESASEXUALES("Placeres sexuales"),
    IMPULSIVIDADSEXUAL("Impulsividad sexual"),
    FETICHISMO("Fetichismo"),
    PLACERSEXUALATRAVESDELDOLORFISICO("Placer sexual a traves del dolor fisico"),
    SADISMO("Sadismo"),
    PRACTICASSEXUALESENPUBLICO("Practicas sexuales en publico"),
    EXHIBICIONISMO("Exhibisionismo"),
    HISTERIA("Histeria");

    private final String pretty;
    private final SymptomCategory category;

    Symptom(String pretty, SymptomCategory category) {
        this.pretty = pretty;
        this.category = category;
    }

    public String getPretty() {
        return this.pretty;
    }

    public SymptomCategory getCategory() {
        return category;
    }

    @Override
    public String toString() {
        return pretty;
    }
}
