package edu.uade.ia.tpo;

import java.util.List;

/**
 * Examen de paciente
 * */
public class Exam {

    private List<Symptom> symptoms;
    private Antecedent antecedent;

    public Exam(List<Symptom> symptoms, Antecedent antecedent) {
        this.symptoms = symptoms;
        this.antecedent = antecedent;
    }

    public List<Symptom> getSymptoms() {
        return symptoms;
    }

    public Antecedent getAntecedent() {
        return antecedent;
    }
}
