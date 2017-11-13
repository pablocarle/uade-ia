package edu.uade.ia.tpo;

import net.sf.clipsrules.jni.Environment;
import net.sf.clipsrules.jni.FactAddressValue;
import net.sf.clipsrules.jni.MultifieldValue;
import net.sf.clipsrules.jni.PrimitiveValue;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public final class ShrinkClipsService {

    private static ShrinkClipsService instance;

    private final Environment clips;

    private static final ThreadLocal<Long> lastExecutionTime = new ThreadLocal<>();

    private ShrinkClipsService() {
        super();
        this.clips = new Environment();
        initEnvironment();
    }

    private void initEnvironment() {
        clips.loadFromResource("/edu/uade/ia/tpo/resources/templates.clp"); // Load templates
        clips.loadFromResource("/edu/uade/ia/tpo/resources/rules_antecedents.clp"); // Load rules
        clips.loadFromResource("/edu/uade/ia/tpo/resources/rules_symptoms.clp"); // Load rules
        //clips.loadFromResource("/edu/uade/ia/tpo/resources/default_facts.clp");// Load test facts
        clips.reset();
    }

    public static ShrinkClipsService get() {
        if (instance == null) {
            instance = new ShrinkClipsService();
        }
        return instance;
    }

    public long getLastExecutionTime() {
        return lastExecutionTime.get();
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
        PrimitiveValue pv = clips.eval(assertion);
        System.out.println("Patient creation returned with: " + pv);
        assertion = "(assert (paciente_presuncion (dni " + patient.getDni() + ") (diagnostico NOSE)))";
        pv = clips.eval(assertion);
        System.out.println("Patient empty exam creation returned with: " + pv);
    }

    public void addPatientExam(Patient patient, Exam exam) {
        String assertion = "(assert (paciente_examen " +
                " (dni " + patient.getDni() + ")" +
                " (sintomas " + exam.getSymptoms()
                .stream()
                .distinct()
                .map(Symptom::name)
                .collect(Collectors.joining(" "))
                .trim() + ")" +
                " (antecedente " + exam.getAntecedent().name() + ")))";
        clips.eval(assertion);
    }

    public List<Diagnostic> runDiagnostic(final Patient patient) throws Exception {
        final long now = System.currentTimeMillis();
        final List<Diagnostic> list = new ArrayList<>();

        clips.run();

        final String diagnosticsFind = buildFindDiagnosticFacts(patient.getDni());
        PrimitiveValue pv = clips.eval(diagnosticsFind);
        if (pv instanceof MultifieldValue) {
            MultifieldValue mv = (MultifieldValue) pv;
            for (Object o : mv.multifieldValue()) {
                FactAddressValue value = (FactAddressValue) o;
                list.add(new Diagnostic(patient, value.getFactSlot("diagnostico").toString()));
            }
        } else {
            throw new Exception("Ocurrio un error al diagnosticar. Resultado: " + pv);
        }
        lastExecutionTime.set(System.currentTimeMillis() - now);
        return list;
    }

    private String buildFindDiagnosticFacts(long dni) {
        return ("(find-all-facts ((?var paciente_diagnostico)) (eq ?var:dni " + dni + "))");
    }

    public Set<Patient> getLoadedPatients() throws Exception {
        Set<Patient> loadedPatients = new HashSet<>();
        PrimitiveValue pv = clips.eval("(find-all-facts ((?var paciente)) TRUE)");
        if (pv instanceof MultifieldValue) {
            MultifieldValue mv = (MultifieldValue) pv;
            for (Object o : mv.multifieldValue()) {
                FactAddressValue value = (FactAddressValue) o;
                loadedPatients.add(
                        new Patient(
                                value.getFactSlot("nombre").toString(),
                                Long.valueOf(value.getFactSlot("dni").toString()),
                                Patient.Sexo.valueOf(value.getFactSlot("sexo").toString()),
                                value.getFactSlot("relacionFamiliar").toString(),
                                Patient.ScholarshipLevel.valueOf(value.getFactSlot("nivelEstudios").toString()),
                                value.getFactSlot("profesion").toString(),
                                value.getFactSlot("trabajo").toString(),
                                value.getFactSlot("aficiones").toString(),
                                value.getFactSlot("gustos").toString(),
                                Integer.valueOf(value.getFactSlot("edad").toString())
                        )
                );
            }
        }
        return loadedPatients;
    }
}
