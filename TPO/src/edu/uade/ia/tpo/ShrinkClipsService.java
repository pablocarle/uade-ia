package edu.uade.ia.tpo;

import net.sf.clipsrules.jni.Environment;

public final class ShrinkClipsService {

    private static ShrinkClipsService instance;

    private final Environment clips;

    private ShrinkClipsService() {
        super();
        this.clips = new Environment();
        initEnvironment();
    }

    private void initEnvironment() {
        clips.reset();
    }

    public static ShrinkClipsService get() {
        if (instance == null) {
            instance = new ShrinkClipsService();
        }
        return instance;
    }

    public void addPatient(Patient patient) throws Exception {
        StringBuilder assertion = new StringBuilder();



        clips.eval(assertion.toString());
    }

    public void addPatientExam(Patient patient, Exam exam) throws Exception {



    }
}
