package edu.uade.ia.tpo;

public enum Symptom {
    GANASDELLORAR("Ganas de Llorar"),
    GANASDEREIR("Ganas de Reir"),
    CAMBIOSDEESTADODEANIMO("Cambios de estado de animo"),
    INESTABILIDADEMOCIONAL("Inestabilidad emocional"),
    DOLENCIASCORPORALES("Dolencias corporales"),
    IMPULSOS("Impulsos"),
    SINTOMASCOMPULSIVOS("Sintomas compulsivos"),
    IMPULSIVO("Impulsivo"),
    REORDENACOSASPREVIAMENTEORDENADAS("Reordena cosas previamente ordenadas"),
    ANSIEDAD("Ansiedad"),
    OBSESIVO("Obsesivo"),
    IDEASOBSESIVAS("Ideas obsesivas"),
    NEUROSISOBSESIVA("Neurosis obsesiva"),
    IMAGENESRECURRENTES("Imagenes recurrentes"),
    TEMORESESPECIFICOS("Temores especificos"),
    PERSECUCION("Persecucion"),
    FOBIA("Fobia"),
    DELIRIOS("Delirios"),
    ALUCIONACIONES("Alucinaciones"),
    PERCEPCIONALTERADA("Percepcion alterada"),
    DESORGANIZADO("Desorganizado"),
    COMPORTAMIENTOCATATONICO("Comportamiento catatonico"),
    AUSENCIAEMOCIONAL("Ausencia emocional"),
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
    PENSAMIENTOACELERADO("PEnsamiento acelerado"),
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

    Symptom(String pretty) {
        this.pretty = pretty;
    }

    public String getPretty() {
        return this.pretty;
    }

    @Override
    public String toString() {
        return pretty;
    }
}
