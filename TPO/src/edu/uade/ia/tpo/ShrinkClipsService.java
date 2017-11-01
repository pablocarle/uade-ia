package edu.uade.ia.tpo;

public final class ShrinkClipsService {

    private static ShrinkClipsService instance;

    private ShrinkClipsService() {
        super();
    }

    public static ShrinkClipsService get() {
        if (instance == null) {
            instance = new ShrinkClipsService();
        }
        return instance;
    }

    public void addPatient() {

    }
}
