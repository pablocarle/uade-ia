package edu.uade.ia.tpo.view;

import javax.swing.*;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public class PatientDataContentPane {
    private JTextField name;
    private JTextField dni;
    private JTextField familyRelation;
    private JComboBox sex;
    private JComboBox studyLevel;
    private JTextField age;
    private JTextField profession;
    private JTextField work;
    private JTextField hobbies;
    private JTextField tastes;
    private JPanel view;

    public PatientDataContentPane() {
        dni.addKeyListener(new KeyAdapter() {
            @Override
            public void keyPressed(KeyEvent e) {

                super.keyPressed(e);
            }
        });
    }

    public JPanel getView() {
        return view;
    }
}
