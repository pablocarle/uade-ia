package edu.uade.ia.tpo;

import net.sf.clipsrules.jni.Environment;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public final class ShrinkClipsService {

    private static ShrinkClipsService instance;

    private final Environment clips;

    private ShrinkClipsService() {
        super();
        this.clips = new Environment();
        initEnvironment();
    }

    private void initEnvironment() {
        clips.load("/edu/uade/ia/tpo/resources/templates.clp"); // Load templates
        clips.load("/edu/uade/ia/tpo/resources/rules.clp"); // Load rules
        clips.load("/edu/uade/ia/tpo/resources/default_facts.clp");// TODO Load test facts (eliminar para prueba real)
        clips.reset();
    }

    public static ShrinkClipsService get() {
        if (instance == null) {
            instance = new ShrinkClipsService();
        }
        return instance;
    }

    public void addPatient(Patient patient) {
        String assertion = "(assert (paciente " +
                " (nombre " + "\"" + patient.getName() + "\")" +
                " (dni " + patient.getDni() + ")" +
                " (sexo " + patient.getSex().name() + ")" +
                " (relacionFamiliar " + "\"" + patient.getFamilyRelation() + "\")" +
                " (nivelEstudios " + patient.getScholarshipLevel().name() + ")" +
                " (profesion " + "\"" + patient.getProfession() + "\")" +
                " (trabajo " + "\"" + patient.getWork() + "\")" +
                " (aficiones " + "\"" + patient.getHobbies() + "\")" +
                " (gustos " + "\"" + patient.getPersonalTastes() + "\")" +
                " (edad " + patient.getAge() + ")" +
                "))";
        clips.eval(assertion);
    }

    public void addPatientExam(Patient patient, Exam exam) {
        String assertion = "(assert (paciente_examen " +
                " (dni " + patient.getDni() + ")" +
                " (sintomas " + exam.getSymptoms()
                .stream()
                .map(Symptom::name)
                .collect(Collectors.joining(" "))
                .trim() + ")" +
                " (antecedente " + exam.getAntecedent().name() + ")))";
        clips.eval(assertion);
    }

    public List<Diagnostic> runDiagnostic(final Patient patient) {
        final List<Diagnostic> list = new ArrayList<>();

        clips.run();

        final String diagnosticsFind = buildFindDiagnosticFacts();

        return list;
    }

    private String buildFindDiagnosticFacts() {
        StringBuilder builder = new StringBuilder();
        builder.append("(find-all-facts (()) TRUE");


        return builder.toString();
    }
}
