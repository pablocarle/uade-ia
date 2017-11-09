package edu.uade.ia.tpo.view;

import edu.uade.ia.tpo.Diagnostic;
import edu.uade.ia.tpo.Exam;
import edu.uade.ia.tpo.Patient;
import edu.uade.ia.tpo.ShrinkClipsService;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.text.MessageFormat;
import java.util.List;
import java.util.Optional;

/**
 * Application entry point
 * */
public class MainFrame {

    private static final Rectangle DEFAULT_BOUNDS = new Rectangle(400, 100, 1024, 768);
    private static final Rectangle EXAM_BOUNDS = new Rectangle(400, 100, 1024, 768);

    private ShrinkClipsService clipsService;

    private JFrame frame;

    private MainActionsPane actionsPane;
    private PatientListContentPane patientList;
    private PatientDataContentPane patientData;

    private PatientExamContentPane patientExam;
    private ActivityLogContentPane activityLog;

    private Patient selectedPatientForDiagnose;

    public MainFrame() {
        super();
        clipsService = ShrinkClipsService.get();
        initialize();

        initializeEvents();
    }

    private void initializeEvents() {
        actionsPane.getNuevoPacienteButton()
                .addActionListener(this::newPatient);

        actionsPane.getEvaluarPacienteButton()
                .addActionListener(this::listPatientsForEvaluation);

        actionsPane.getRegistroDeActividadesButton()
                .addActionListener(this::showActivityLog);

        patientData.getCancelarButton()
                .addActionListener(this::returnToMain);

        patientData.getAceptarButton()
                .addActionListener(this::validateAndCreatePatient);

        patientList.getCancelarButton()
                .addActionListener(this::returnToMain);

        patientList.getEvaluarButton()
                .addActionListener(this::evaluatePatient);

        patientExam.getCancelarButton()
                .addActionListener(this::listPatientsForEvaluation);

        patientExam.getEvaluarButton()
                .addActionListener(this::diagnosePatient);

        activityLog.getVolverButton()
                .addActionListener(this::returnToMain);
    }

    private void showActivityLog(ActionEvent event) {
        frame.setVisible(false);
        frame.setContentPane(activityLog.getView());
        frame.setVisible(true);
    }

    /**
     * Diagnosticar paciente seleccionado
     * */
    private void diagnosePatient(ActionEvent event) {
        try {
            Optional<Exam> exam = patientExam.buildExam();
            if (exam.isPresent()) {
                clipsService.addPatientExam(selectedPatientForDiagnose, exam.get());
                java.util.List<Diagnostic> diagnostics = clipsService.runDiagnostic(selectedPatientForDiagnose);
                showDiagnostics(selectedPatientForDiagnose, exam.get(), diagnostics, patientExam.getResultTextArea());
            } else {
                JOptionPane.showMessageDialog(null, MessageFormat.format("", ""));
            }
        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, MessageFormat.format("Ocurrio un error en el diagnostico del paciente {0}. [{1}]", selectedPatientForDiagnose.getName(), e.getMessage()));
        }
    }

    private void showDiagnostics(Patient patient, Exam exam, List<Diagnostic> diagnostics, JTextArea resultArea) {
        final StringBuilder results = new StringBuilder();
        final long executionTimeMs = clipsService.getLastExecutionTime();

        results.append("Evaluación de diagnostico en ").append(executionTimeMs).append("ms\n\n");
        results.append("Paciente: ");
        results.append(patient.getName()).append("\n");
        results.append("Examen: \n");
        results.append(exam.toString());
        results.append("\n\n");

        if (diagnostics.isEmpty()) {
            results.append("No hay suficiente información para determinar un diagnóstico\n");
        } else {
            diagnostics.forEach(diagnostic -> {
                results.append("Diagnostico: ");
                results.append(diagnostic.getResult());
            });
        }
        resultArea.setText(results.toString());
    }

    /**
     * Evaluar paciente seleccionado en lista de pacientes
     *
     * */
    private void evaluatePatient(ActionEvent event) {
        final Optional<Patient> patientOptional = patientList.getSelectedPatient();
        String patientName = "";
        if (patientOptional.isPresent()) {
            try {
                selectedPatientForDiagnose = patientOptional.get();
                patientName = selectedPatientForDiagnose.getName();
                frame.setVisible(false);
                frame.setBounds(EXAM_BOUNDS);
                frame.setContentPane(patientExam.getView());
                frame.setVisible(true);
            } catch (Exception e) {
                e.printStackTrace();
                JOptionPane.showMessageDialog(null, MessageFormat.format("Ocurrio un error evaluando al paciente {0}. [{1}]", patientName, e.getMessage()));
            }
        } else {
            JOptionPane.showMessageDialog(null, "Debe seleccionar un paciente");
        }
    }

    private void listPatientsForEvaluation(ActionEvent event) {
        frame.setVisible(false);
        frame.setBounds(DEFAULT_BOUNDS);
        frame.setContentPane(patientList.getView());

        try {
            patientList.loadPatients(clipsService.getLoadedPatients());
        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, MessageFormat.format("Ocurrio un error buscando los pacientes cargados. [{0}]", e.getMessage()));
            frame.setContentPane(actionsPane.getView());
        }
        frame.setVisible(true);
    }

    private void validateAndCreatePatient(ActionEvent event) {
        if (patientData.isValidForm()) {
            try {
                clipsService.addPatient(patientData.buildPatient());
                JOptionPane.showMessageDialog(null, "Paciente creado exitosamente");
                frame.setVisible(false);
                frame.setBounds(DEFAULT_BOUNDS);
                frame.setContentPane(actionsPane.getView());
                frame.setVisible(true);
            } catch (Exception e) {
                e.printStackTrace();
                JOptionPane.showMessageDialog(null, "Ocurrio un error creando el paciente. [" + e.getMessage() + "]");
            }
        } else {
            JOptionPane.showMessageDialog(null, "Revise los datos ingresados");
        }
    }

    private void returnToMain(ActionEvent e) {
        frame.setVisible(false);
        frame.setContentPane(actionsPane.getView());
        frame.setVisible(true);
    }

    private void newPatient(ActionEvent e) {
        frame.setVisible(false);
        frame.setContentPane(patientData.getView());
        frame.setVisible(true);
    }

    private void initialize() {
        frame = new JFrame();
        frame.setTitle("PsicoSoft");
        frame.setBounds(DEFAULT_BOUNDS);
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setResizable(false);
        frame.setLayout(new GridBagLayout());

        actionsPane = new MainActionsPane();
        patientData = new PatientDataContentPane();
        patientList = new PatientListContentPane();
        patientExam = new PatientExamContentPane();
        activityLog = new ActivityLogContentPane();

        frame.setContentPane(actionsPane.getView());
    }

    public static void main(String[] args) {
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (ClassNotFoundException | UnsupportedLookAndFeelException | IllegalAccessException | InstantiationException e) {
            e.printStackTrace();
        }

        EventQueue.invokeLater(() -> {
            try {
                MainFrame wnd = new MainFrame();
                wnd.frame.setVisible(true);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }
}
