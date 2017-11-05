package edu.uade.ia.tpo.view;

import edu.uade.ia.tpo.Antecedent;
import edu.uade.ia.tpo.Exam;
import edu.uade.ia.tpo.Symptom;
import edu.uade.ia.tpo.SymptomCategory;
import sun.swing.DefaultLookup;

import javax.swing.*;
import java.awt.*;
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

        physicalSymptoms.setRenderer(physicalSymptomsRenderer);
        stateOfMindSymptoms.setRenderer(stateOfMindSymptomsRenderer);
        feelingsSymptoms.setRenderer(feelingsSymptomsRenderer);
        perturbationSymptoms.setRenderer(perturbationSymptomsRenderer);
        desiresSymptoms.setRenderer(desiresSymptomsRenderer);
        behaviouralSymptoms.setRenderer(behaviouralSymptomsRenderer);
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
        List<Symptom> selectedSymptoms = new ArrayList<>();
        selectedSymptoms.addAll(physicalSymptomsRenderer.getSelectedSymptoms());
        selectedSymptoms.addAll(stateOfMindSymptomsRenderer.getSelectedSymptoms());
        selectedSymptoms.addAll(feelingsSymptomsRenderer.getSelectedSymptoms());
        selectedSymptoms.addAll(perturbationSymptomsRenderer.getSelectedSymptoms());
        selectedSymptoms.addAll(desiresSymptomsRenderer.getSelectedSymptoms());
        selectedSymptoms.addAll(behaviouralSymptomsRenderer.getSelectedSymptoms());
        return selectedSymptoms;
    }

    private void createUIComponents() {
        physicalSymptoms = new JComboBox<>();
        stateOfMindSymptoms = new JComboBox<>();
        feelingsSymptoms = new JComboBox<>();
        perturbationSymptoms = new JComboBox<>();
        desiresSymptoms = new JComboBox<>();
        behaviouralSymptoms = new JComboBox<>();
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
        public Component getListCellRendererComponent(final JList<? extends Symptom> list, final Symptom value, final int index, final boolean isSelected, final boolean cellHasFocus) {
            //System.out.println(MessageFormat.format("ListCellRenderer. value: {0}. index: {1}. isSelected: {2}. cellHasFocus: {3}", value, index, isSelected, cellHasFocus));
            final LayoutManager manager = new FlowLayout(FlowLayout.LEFT);
            final JPanel component = new JPanel(manager);
            final JLabel label = new JLabel(value.getPretty());
            final JCheckBox checkBox = new JCheckBox();

            final Color bg = DefaultLookup.getColor(label, label.getUI(), "List.dropCellBackground");
            final Color fg = DefaultLookup.getColor(label, label.getUI(), "List.dropCellForeground");

            if (isSelected) {
                if (index >= 0) {
                    selected[index] = !selected[index];
                }
                label.setBackground(bg == null ? list.getSelectionBackground() : bg);
                label.setForeground(fg == null ? list.getSelectionForeground() : fg);
            } else {
                label.setBackground(list.getBackground());
                label.setForeground(list.getForeground());
            }

            if (index >= 0) {
                checkBox.setSelected(selected[index]);
            }

            component.add(checkBox);
            component.add(label);

            return component;
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
