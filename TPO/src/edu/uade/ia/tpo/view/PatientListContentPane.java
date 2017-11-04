package edu.uade.ia.tpo.view;

import edu.uade.ia.tpo.Patient;

import javax.swing.*;
import javax.swing.text.html.Option;
import java.util.Optional;
import java.util.Set;

public class PatientListContentPane {
    private JPanel view;
    private JTable patientTable;
    private JButton evaluarButton;
    private JButton cancelarButton;

    public PatientListContentPane() {
        super();
        initTable();
    }

    private void initTable() {
        //patientTable.addColumn(new TableColumn().setHeaderValue(""););
        patientTable.setColumnSelectionAllowed(false);
        patientTable.setRowSelectionAllowed(true);
        patientTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    }

    public JPanel getView() {
        return view;
    }

    public JButton getEvaluarButton() {
        return evaluarButton;
    }

    public JButton getCancelarButton() {
        return cancelarButton;
    }

    public Optional<Patient> getSelectedPatient() {
        int selectionCount = patientTable.getSelectedRowCount();
        if (selectionCount == 1) {
            return Optional.of(new Patient(
                    "",
                    1L,
                    Patient.Sexo.FEMENINO,
                    "",
                    Patient.ScholarshipLevel.POSGRADO,
                    "",
                    "",
                    "",
                    "",
                    1
            ));
        } else {
            return Optional.empty();
        }
    }

    public void loadPatients(Set<Patient> patients) {
        int row = 0;
        int column;
        for (Patient patient : patients) {
            column = 0;


        }
    }
}
