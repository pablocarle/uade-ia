package edu.uade.ia.tpo.view;

import edu.uade.ia.tpo.Antecedent;
import edu.uade.ia.tpo.Exam;
import edu.uade.ia.tpo.Symptom;
import edu.uade.ia.tpo.SymptomCategory;

import javax.swing.*;
import java.awt.*;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class PatientExamContentPane {
    private JPanel view;
    private JComboBox<Antecedent> antecedentComboBox;
    private JButton evaluarButton;
    private JButton cancelarButton;
    private JTextArea resultTextArea;
    private JComboBox<Symptom> physicalSymptoms;
    private JComboBox<Symptom> stateOfMindSymptoms;
    private JComboBox<Symptom> feelingsSymptoms;
    private JComboBox<Symptom> perturbationSymptoms;
    private JComboBox<Symptom> desiresSymptoms;
    private JComboBox<Symptom> behaviouralSymptoms;

    private MultipleSelectionComboBoxRenderer physicalSymptomsRenderer;
    private MultipleSelectionComboBoxRenderer stateOfMindSymptomsRenderer;
    private MultipleSelectionComboBoxRenderer feelingsSymptomsRenderer;
    private MultipleSelectionComboBoxRenderer perturbationSymptomsRenderer;
    private MultipleSelectionComboBoxRenderer desiresSymptomsRenderer;
    private MultipleSelectionComboBoxRenderer behaviouralSymptomsRenderer;

    public PatientExamContentPane() {
        super();
        initialize();
    }

    private void initialize() {
        final List<Symptom> auxSymptomList = new ArrayList<>();
        Arrays.stream(Symptom.values())
                .filter(symptom -> symptom.equals(Symptom.NINGUNO) || symptom.getCategory().equals(SymptomCategory.BEHAVIOUR))
                .forEach(symptom -> {
                    behaviouralSymptoms.addItem(symptom);
                    auxSymptomList.add(symptom);
                });
        behaviouralSymptomsRenderer = new MultipleSelectionComboBoxRenderer(auxSymptomList.toArray(new Symptom[0]));

        auxSymptomList.clear();
        Arrays.stream(Symptom.values())
                .filter(symptom -> symptom.equals(Symptom.NINGUNO) || symptom.getCategory().equals(SymptomCategory.DESIRES))
                .forEach(symptom -> {
                    desiresSymptoms.addItem(symptom);
                    auxSymptomList.add(symptom);
                });
        desiresSymptomsRenderer = new MultipleSelectionComboBoxRenderer(auxSymptomList.toArray(new Symptom[0]));

        auxSymptomList.clear();
        Arrays.stream(Symptom.values())
                .filter(symptom -> symptom.equals(Symptom.NINGUNO) || symptom.getCategory().equals(SymptomCategory.PERTURBATION))
                .forEach(symptom -> {
                    perturbationSymptoms.addItem(symptom);
                    auxSymptomList.add(symptom);
                });
        perturbationSymptomsRenderer = new MultipleSelectionComboBoxRenderer(auxSymptomList.toArray(new Symptom[0]));

        auxSymptomList.clear();
        Arrays.stream(Symptom.values())
                .filter(symptom -> symptom.equals(Symptom.NINGUNO) || symptom.getCategory().equals(SymptomCategory.FEELINGS))
                .forEach(symptom -> {
                    feelingsSymptoms.addItem(symptom);
                    auxSymptomList.add(symptom);
                });
        feelingsSymptomsRenderer = new MultipleSelectionComboBoxRenderer(auxSymptomList.toArray(new Symptom[0]));

        auxSymptomList.clear();
        Arrays.stream(Symptom.values())
                .filter(symptom -> symptom.equals(Symptom.NINGUNO) || symptom.getCategory().equals(SymptomCategory.STATE_OF_MIND))
                .forEach(symptom -> {
                    stateOfMindSymptoms.addItem(symptom);
                    auxSymptomList.add(symptom);
                });
        stateOfMindSymptomsRenderer = new MultipleSelectionComboBoxRenderer(auxSymptomList.toArray(new Symptom[0]));

        auxSymptomList.clear();
        Arrays.stream(Symptom.values())
                .filter(symptom -> symptom.equals(Symptom.NINGUNO) || symptom.getCategory().equals(SymptomCategory.PHYSICAL))
                .forEach(symptom -> {
                    physicalSymptoms.addItem(symptom);
                    auxSymptomList.add(symptom);
                });
        physicalSymptomsRenderer = new MultipleSelectionComboBoxRenderer(auxSymptomList.toArray(new Symptom[0]));

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

    JTextArea getResultTextArea() {
        return resultTextArea;
    }

    Optional<Exam> buildExam() {
        List<Symptom> selectedSymptoms = getSelectedSymptoms();
        if (selectedSymptoms.stream().allMatch(symptom -> symptom.equals(Symptom.NINGUNO))) {
            return Optional.empty();
        } else {
            return Optional.of(
                    new Exam(
                            selectedSymptoms.stream()
                                    .filter(symptom -> !symptom.equals(Symptom.NINGUNO))
                                    .distinct()
                                    .collect(Collectors.toList()),
                            (Antecedent) antecedentComboBox.getSelectedItem()
                    )
            );
        }
    }

    private List<Symptom> getSelectedSymptoms() {

    }

    private class MultipleSelectionComboBoxRenderer implements ListCellRenderer<Symptom> {

        private final Symptom[] symptoms;
        private final boolean[] selected;

        MultipleSelectionComboBoxRenderer(final Symptom[] symptoms) {
            super();
            this.symptoms = symptoms;
            this.selected = new boolean[symptoms.length];
        }

        @Override
        public Component getListCellRendererComponent(JList<? extends Symptom> list, Symptom value, int index, boolean isSelected, boolean cellHasFocus) {
            System.out.println(MessageFormat.format("ListCellRenderer. value: {0}. index: {1}. isSelected: {2}. cellHasFocus: {3}", value, index, isSelected, cellHasFocus));
            return null;
        }

        List<Symptom> getSelectedSymptoms() {
            final List<Symptom> retList = new ArrayList<>();
            for (int i = 0; i < selected.length; i++) {
                if (selected[i]) {
                    retList.add(symptoms[i]);
                }
            }
            return retList;
        }
    }
}
