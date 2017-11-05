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
        boolean nameRequired = name.getText() != null  && name.getText().trim().length() > 0;
        boolean dniRequiredAndIsNumber = dni.getText() != null && dni.getText().trim().length() > 0
                && dni.getText().matches("\\d+");
        boolean sexRequired = sex.getSelectedItem() != null && String.valueOf(sex.getSelectedItem()).trim().length() > 0;
        boolean familyRelationRequired = familyRelation.getText() != null && familyRelation.getText().trim().length() > 0;
        boolean scholarshipLevelRequired = studyLevel.getSelectedItem() != null && String.valueOf(studyLevel.getSelectedItem()).trim().length() > 0;
        boolean professionRequired = profession.getText() != null && profession.getText().trim().length() > 0;
        boolean workRequired = work.getText() != null && work.getText().trim().length() > 0;
        boolean hobbiesRequired = hobbies.getText() != null && hobbies.getText().trim().length() > 0;
        boolean tastesRequired = tastes.getText() != null && tastes.getText().trim().length() > 0;
        boolean ageRequiredAndIsNumber = age.getText() != null && age.getText().trim().length() > 0
                && age.getText().matches("\\d+");

        return nameRequired && sexRequired && familyRelationRequired && scholarshipLevelRequired
                && professionRequired && workRequired && hobbiesRequired && tastesRequired
                && ageRequiredAndIsNumber && dniRequiredAndIsNumber;
    }

    Patient buildPatient() {
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
