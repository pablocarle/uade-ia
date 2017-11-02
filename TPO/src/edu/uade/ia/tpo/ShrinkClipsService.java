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

    }

    public static ShrinkClipsService get() {
        if (instance == null) {
            instance = new ShrinkClipsService();
        }
        return instance;
    }

    public void addPatient(Patient patient) {

    }

    public void addPatientExam(Patient patient, Exam exam) {

    }
}
