package edu.uade.ia.tpo.view;

import edu.uade.ia.tpo.Patient;

import javax.swing.*;
import javax.swing.event.TableModelListener;
import javax.swing.table.TableModel;
import java.util.ArrayList;
import java.util.List;
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
            int row = patientTable.getSelectedRow();
            return Optional.of(new Patient(
                    patientTable.getValueAt(row, 0).toString(),
                    Long.valueOf(patientTable.getValueAt(row, 1).toString()),
                    Patient.Sexo.valueOf(patientTable.getValueAt(row, 2).toString()),
                    patientTable.getValueAt(row, 3).toString(),
                    Patient.ScholarshipLevel.valueOf(patientTable.getValueAt(row, 4).toString()),
                    patientTable.getValueAt(row, 5).toString(),
                    patientTable.getValueAt(row, 6).toString(),
                    patientTable.getValueAt(row, 7).toString(),
                    patientTable.getValueAt(row, 8).toString(),
                    Integer.valueOf(patientTable.getValueAt(row, 9).toString())
            ));
        } else {
            return Optional.empty();
        }
    }

    void loadPatients(Set<Patient> patients) {
        patientTable.setModel(new PatientListModel(patients));
    }

    private class PatientListModel implements TableModel {

        private final String[] columnNames = new String[]{
                "Nombre",
                "DNI",
                "Sexo",
                "Relacion Familiar",
                "Nivel de estudios",
                "Profesion",
                "Trabajo",
                "Aficiones",
                "Gustos",
                "Edad"
        };

        private final Class<?>[] columnClasses = new Class<?>[] {
                String.class,
                Long.class,
                String.class,
                String.class,
                String.class,
                String.class,
                String.class,
                String.class,
                String.class,
                Integer.class
        };

        private Object[][] data;

        PatientListModel(Set<Patient> patients) {
            super();
            data = new Object[patients.size()][columnNames.length];
            List<Patient> patientsList = new ArrayList<>(patients);
            int j;
            for (int i = 0; i < patients.size(); i++) {
                j = 0;
                data[i][j++] = patientsList.get(i).getName();
                data[i][j++] = patientsList.get(i).getDni();
                data[i][j++] = patientsList.get(i).getSex().name();
                data[i][j++] = patientsList.get(i).getFamilyRelation();
                data[i][j++] = patientsList.get(i).getScholarshipLevel().name();
                data[i][j++] = patientsList.get(i).getProfession();
                data[i][j++] = patientsList.get(i).getWork();
                data[i][j++] = patientsList.get(i).getHobbies();
                data[i][j++] = patientsList.get(i).getPersonalTastes();
                data[i][j] = patientsList.get(i).getAge();
            }
        }

        @Override
        public int getRowCount() {
            return data.length;
        }

        @Override
        public int getColumnCount() {
            return 10;
        }

        @Override
        public String getColumnName(int columnIndex) {
            return columnNames[columnIndex];
        }

        @Override
        public Class<?> getColumnClass(int columnIndex) {
            return columnClasses[columnIndex];
        }

        @Override
        public boolean isCellEditable(int rowIndex, int columnIndex) {
            return false;
        }

        @Override
        public Object getValueAt(int rowIndex, int columnIndex) {
            return data[rowIndex][columnIndex];
        }

        @Override
        public void setValueAt(Object aValue, int rowIndex, int columnIndex) {
            throw new RuntimeException("Unsupported operation");
        }

        @Override
        public void addTableModelListener(TableModelListener l) {
            //do nothing
        }

        @Override
        public void removeTableModelListener(TableModelListener l) {
            //do nothing
        }
    }
}
