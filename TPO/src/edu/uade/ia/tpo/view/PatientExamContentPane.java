package edu.uade.ia.tpo.view;

import edu.uade.ia.tpo.Antecedent;
import edu.uade.ia.tpo.Exam;
import edu.uade.ia.tpo.Symptom;

import javax.swing.*;
import java.util.Arrays;
import java.util.Optional;

public class PatientExamContentPane {
    private JPanel view;
    private JList<Symptom> symptomList;
    private JComboBox<Antecedent> antecedentComboBox;
    private JButton evaluarButton;
    private JButton cancelarButton;

    public PatientExamContentPane() {
        super();
        initData();
    }

    private void initData() {
        symptomList.setListData(Symptom.values());

        Arrays.stream(Antecedent.values())
                .forEach(antecedent -> antecedentComboBox.addItem(antecedent));
    }

    JPanel getView() {
        return view;
    }

    JButton getEvaluarButton() {
        return evaluarButton;
    }

    JButton getCancelarButton() {
        return cancelarButton;
    }

    Optional<Exam> buildExam() {
        if (antecedentComboBox.getSelectedItem() != null && !symptomList.getSelectedValuesList().isEmpty()) {
            return Optional.of(
                    new Exam(
                            symptomList.getSelectedValuesList(),
                            (Antecedent) antecedentComboBox.getSelectedItem()
                    )
            );
        } else {
            return Optional.empty();
        }
    }
}
