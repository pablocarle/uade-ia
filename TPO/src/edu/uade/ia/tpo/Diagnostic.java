package edu.uade.ia.tpo;

public class Diagnostic {

    private Patient patient;
    private String result;

    public Diagnostic(final Patient patient, final String result) {
        super();
        this.patient = patient;
        this.result = result;
    }

    public Patient getPatient() {
        return patient;
    }

    public String getResult() {
        return result;
    }
}
