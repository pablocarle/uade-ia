package edu.uade.ia.tpo.view;

import edu.uade.ia.tpo.Antecedent;
import edu.uade.ia.tpo.Symptom;

import javax.swing.*;
import java.util.Arrays;

public class PatientExamContentPane {
    private JPanel view;
    private JList<String> symptomList;
    private JComboBox<String> antecedentComboBox;
    private JButton evaluarButton;
    private JButton cancelarButton;

    public PatientExamContentPane() {
        super();
        initData();
    }

    private void initData() {
        symptomList.setListData(
                Arrays.stream(Symptom.values())
                        .map(Symptom::getPretty)
                        .toArray(String[]::new));

        Arrays.stream(Antecedent.values())
                .map(Antecedent::getPretty)
                .forEach(prettyAntecedent -> antecedentComboBox.addItem(prettyAntecedent));
    }

    public JPanel getView() {
        return view;
    }

    public JList<String> getSymptomList() {
        return symptomList;
    }

    public JComboBox<String> getAntecedentComboBox() {
        return antecedentComboBox;
    }

    public JButton getEvaluarButton() {
        return evaluarButton;
    }

    public JButton getCancelarButton() {
        return cancelarButton;
    }
}
