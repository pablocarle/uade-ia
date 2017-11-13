package edu.uade.ia.tpo.view;

import edu.uade.ia.tpo.Diagnostic;
import edu.uade.ia.tpo.Exam;
import edu.uade.ia.tpo.Patient;
import edu.uade.ia.tpo.ShrinkClipsService;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Application entry point
 * */
public class MainFrame {

    private static final Rectangle DEFAULT_BOUNDS = new Rectangle(400, 100, 1024, 500);

    private ShrinkClipsService clipsService;

    private JFrame frame;

    private MainActionsPane actionsPane;
    private PatientListContentPane patientList;
    private PatientDataContentPane patientData;

    private PatientExamContentPane patientExam;
    private ActivityLogContentPane activityLog;

    private Patient selectedPatientForDiagnose;

    private StringBuilder log;
    private List<String> patients;

    private MainFrame() throws IOException, URISyntaxException {
        super();
        clipsService = ShrinkClipsService.get();
        initialize();

        initializeEvents();

        initializeLog();

        initializeSavedPatients();
    }

    private void initializeLog() {
        this.log = new StringBuilder();
        try {
            log.append(Files.readAllLines(Paths.get("psico.log")).stream().collect(Collectors.joining("\n")));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void initializeSavedPatients() {
        try {
            this.patients = Files.readAllLines(Paths.get("patients.csv"));
            this.patients.forEach(csvPatient -> clipsService.addPatient(Patient.fromCsv(csvPatient)));
        } catch (Exception e) {
            e.printStackTrace();
            this.patients = new ArrayList<>();
        }
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

        frame.addWindowListener(new WindowListener() {
            @Override
            public void windowOpened(WindowEvent e) {

            }

            @Override
            public void windowClosing(WindowEvent e) {
                closeFiles();
            }

            @Override
            public void windowClosed(WindowEvent e) {
                closeFiles();
            }

            @Override
            public void windowIconified(WindowEvent e) {

            }

            @Override
            public void windowDeiconified(WindowEvent e) {

            }

            @Override
            public void windowActivated(WindowEvent e) {

            }

            @Override
            public void windowDeactivated(WindowEvent e) {

            }
        });
    }

    private void showActivityLog(ActionEvent event) {
        frame.setVisible(false);
        frame.setContentPane(activityLog.getView());
        if (log.length() == 0) {
            activityLog.getActivityLog().setText("No hay log");
        } else {
            activityLog.getActivityLog().setText(log.toString());
        }
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

        results.append(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
        results.append("\n\n");
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
        addToActivityLog(results.toString());
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
                Patient patient = patientData.buildPatient();
                clipsService.addPatient(patient);
                JOptionPane.showMessageDialog(null, "Paciente creado exitosamente");
                frame.setVisible(false);
                frame.setContentPane(actionsPane.getView());
                frame.setVisible(true);
                addToSavedPatients(patient);
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
        frame.setResizable(true);
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

    private void closeFiles() {
        try {
            Files.write(Paths.get("psico.log"), Arrays.stream(log.toString().split("\n")).collect(Collectors.toList()));
            System.out.println("Escrito psico.log");
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            Files.write(Paths.get("patients.csv"), patients);
            System.out.println("Escrito patients.csv");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addToActivityLog(final String diagnostic) {
        log.append("\n");
        log.append("===========================================");
        log.append("\n\n");
        log.append(diagnostic);
        log.append("\n\n");
        log.append("===========================================");
    }

    private void addToSavedPatients(final Patient patient) {
        patients.add(
            patient.toCsv()
        );
    }
}
