package edu.uade.ia.tpo.view;

import javax.swing.*;

public class ActivityLogContentPane {
    private JPanel view;
    private JTextArea activityLog;
    private JButton volverButton;

    public ActivityLogContentPane() {
        super();
    }

    public JPanel getView() {
        return view;
    }

    public JTextArea getActivityLog() {
        return activityLog;
    }

    public JButton getVolverButton() {
        return volverButton;
    }
}
