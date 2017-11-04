package edu.uade.ia.tpo.view;

import edu.uade.ia.tpo.Patient;

import javax.swing.*;
import java.util.Arrays;

public class PatientDataContentPane {
    private JTextField name;
    private JTextField dni;
    private JTextField familyRelation;
    private JComboBox<String> sex;
    private JComboBox<String> studyLevel;
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
        initData();
    }

    private void initData() {
        Arrays.stream(Patient.Sexo.values())
                .map(Patient.Sexo::name)
                .forEach(name -> sex.addItem(name));

        Arrays.stream(Patient.ScholarshipLevel.values())
                .map(Patient.ScholarshipLevel::name)
                .forEach(name -> studyLevel.addItem(name));
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
        if (isValidForm()) {
            return new Patient(
                    name.getText(),
                    Long.valueOf(dni.getText()),
                    Patient.Sexo.valueOf(String.valueOf(sex.getSelectedItem())),
                    familyRelation.getText(),
                    Patient.ScholarshipLevel.valueOf(String.valueOf(studyLevel.getSelectedItem())),
                    profession.getText(),
                    work.getText(),
                    hobbies.getText(),
                    tastes.getText(),
                    Integer.valueOf(age.getText())
            );
        } else {
            throw new RuntimeException("Formulario invalido de paciente");
        }
    }
}
