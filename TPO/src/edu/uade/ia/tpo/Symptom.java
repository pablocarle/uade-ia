package edu.uade.ia.tpo;

public enum Symptom {

    NINGUNO("Ninguno", null),
    GANASDELLORAR("Ganas de Llorar", SymptomCategory.STATE_OF_MIND),
    GANASDEREIR("Ganas de Reir", SymptomCategory.STATE_OF_MIND),
    CAMBIOSDEESTADODEANIMO("Cambios de estado de animo", SymptomCategory.STATE_OF_MIND),
    DOLENCIASCORPORALES("Dolencias corporales", SymptomCategory.PHYSICAL),
    IMPULSOS("Impulsos", SymptomCategory.DESIRES),
    SINTOMASCOMPULSIVOS("Sintomas compulsivos", SymptomCategory.BEHAVIOUR),
    REORDENACOSASPREVIAMENTEORDENADAS("Reordena cosas previamente ordenadas", SymptomCategory.BEHAVIOUR),
    ANSIEDAD("Ansiedad", SymptomCategory.PERTURBATION),
    IDEASOBSESIVAS("Ideas obsesivas", SymptomCategory.PERTURBATION),
    IMAGENESRECURRENTES("Imagenes recurrentes", SymptomCategory.PERTURBATION),
    TEMORESESPECIFICOS("Temores especificos", SymptomCategory.PERTURBATION),
    DELIRIOS("Delirios", SymptomCategory.PERTURBATION),
    ALUCIONACIONES("Alucinaciones", SymptomCategory.PERTURBATION),
    DESORGANIZADO("Desorganizado", SymptomCategory.BEHAVIOUR),
    COMPORTAMIENTOCATATONICO("Comportamiento catatonico", SymptomCategory.BEHAVIOUR),
    DELIRIOSDEPERSECUCION("Delirios de persecucion", SymptomCategory.PERTURBATION),
    EROTOMANIA("Erotomania", SymptomCategory.PERTURBATION),
    DELIRIOSDEGRANDEZA("Delirios de grandeza", SymptomCategory.PERTURBATION),
    SENTIMIENTOSDEVACIO("Sentimientos de vacio", SymptomCategory.FEELINGS),
    SENTIMIENTOSDETRISTEZA("Sentimientos de tristeza", SymptomCategory.FEELINGS),
    PERDIDADEINTERES("Perdida de interes", SymptomCategory.BEHAVIOUR),
    PERDIDADECAPACIDADPARAELPLACER("Perdida de capacidad para el placer", SymptomCategory.PERTURBATION),
    FALTADEVOLUNTAD("Falta de voluntad", SymptomCategory.FEELINGS),
    FALTADEENERGIA("Falta de energia", SymptomCategory.FEELINGS),
    SENTIMIENTODECULPA("Sentimiento de culpa", SymptomCategory.FEELINGS),
    IDEASDESUICIDIO("Ideas de suicidio", SymptomCategory.DESIRES),
    INSOMNIO("Insomnio", SymptomCategory.PHYSICAL),
    ESTADOSDEANIMOIRRITABLES("Estados de animo irritables", SymptomCategory.STATE_OF_MIND),
    VERBORRAGIA("Verborragia", SymptomCategory.BEHAVIOUR),
    PENSAMIENTOACELERADO("Pensamiento acelerado", SymptomCategory.STATE_OF_MIND),
    MIEDOINTENSOTEMPORAL("Miedo intenso temporal", SymptomCategory.PERTURBATION),
    MALESTARINTENSOTEMPORAL("Malestar intenso temporal", SymptomCategory.PERTURBATION),
    PALPITACIONES("Palpitaciones", SymptomCategory.PHYSICAL),
    SUDORACION("Sudoracion", SymptomCategory.PHYSICAL),
    SENSACIONDEAHOGO("Sensacion de ahogo", SymptomCategory.PHYSICAL),
    OPRESIONTORACICA("Opresion toracica", SymptomCategory.PHYSICAL),
    ANOREXIA("Anorexia", SymptomCategory.BEHAVIOUR),
    BULIMIA("Bulimia", SymptomCategory.BEHAVIOUR),
    ADICCIONES("Adicciones", SymptomCategory.BEHAVIOUR),
    IMPULSOSSEXUALESINTENSOS("Impulsos sexuales intensos", SymptomCategory.DESIRES),
    IMPULSOSSEXUALESRECURRENTES("Impulsos sexuales recurrentes", SymptomCategory.DESIRES),
    FANTASIASSEXUALES("Fantasias sexuales", SymptomCategory.DESIRES),
    PLACERSEXUALCONOBJETOSACTIVIDADESOSITUACIONESPOCOHABITUALES("Placer sexual con objetos actividades o situaciones poco habituales", SymptomCategory.PERTURBATION),
    PLACERSEXUALCONUNTALISMAN("Placer sexual con un talisman", SymptomCategory.PERTURBATION),
    PLACERSEXUALCONORGANOSNOSEXUALES("Placer sexual con organos no sexuales", SymptomCategory.PERTURBATION),
    PLACERSEXUALATRAVESDELDOLORFISICO("Placer sexual a traves del dolor fisico", SymptomCategory.PERTURBATION),
    PRACTICASSEXUALESENPUBLICO("Practicas sexuales en publico", SymptomCategory.BEHAVIOUR);

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
