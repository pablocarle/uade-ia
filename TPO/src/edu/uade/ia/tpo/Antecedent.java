package edu.uade.ia.tpo;

public enum Antecedent {

    NINGUNO("Ninguno"),
    NEUROSIS("Neurosis"),
    PSICOSIS("Psicosis"),
    PERVERSIONES("Perversiones"),
    OTRASPATOLOGIAS("Otras patologias"),
    HISTERIAS("Histerias"),
    NEUROSISOBSESIVA("Neurosis obsesiva"),
    FOBIAS("Fobias"),
    PARANOIAS("Paranoias"),
    ESQUIZOFRENIA("Esquizofrenia"),
    PARAFRENIA("Parafrenia"),
    PSICOSISMANIACODEPRESIVA("Psicosis maniacodepresiva"),
    MELANCOLIA("Melancolia"),
    FETICHISMO("Fetichismo"),
    SADISMO("Sadismo"),
    MASOQUISMO("Masoquismo"),
    VOYEURISMO("Voyeurismo"),
    EXHIBICIONISMO("Exhibicionismo"),
    ADICCIONES("Adicciones"),
    TRASTORNOSALIMENTICIOS("Trastornos alimenticios"),
    TRASTORNOSDEANSIEDAD("Trastornos de ansiedad");

    private final String pretty;

    Antecedent(String pretty) {
        this.pretty = pretty;
    }

    public String getPretty() {
        return this.pretty;
    }

}
