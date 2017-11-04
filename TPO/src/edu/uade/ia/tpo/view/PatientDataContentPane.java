package edu.uade.ia.tpo.view;

import edu.uade.ia.tpo.Patient;

import javax.swing.*;

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
    private JButton cancelarButton;
    private JButton aceptarButton;

    public PatientDataContentPane() {
        super();
    }

    public JPanel getView() {
        return view;
    }

    public JTextField getName() {
        return name;
    }

    public JTextField getDni() {
        return dni;
    }

    public JTextField getFamilyRelation() {
        return familyRelation;
    }

    public JComboBox getSex() {
        return sex;
    }

    public JComboBox getStudyLevel() {
        return studyLevel;
    }

    public JTextField getAge() {
        return age;
    }

    public JTextField getProfession() {
        return profession;
    }

    public JTextField getWork() {
        return work;
    }

    public JTextField getHobbies() {
        return hobbies;
    }

    public JTextField getTastes() {
        return tastes;
    }

    public JButton getCancelarButton() {
        return cancelarButton;
    }

    public JButton getAceptarButton() {
        return aceptarButton;
    }

    public boolean isValidForm() {
        return false;
    }

    public Patient buildPatient() {
        return null; //TODO
    }
}
