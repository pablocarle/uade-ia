package edu.uade.ia.tpo.view;

import javax.swing.*;

public class MainActionsPane {
    private JButton nuevoPacienteButton;
    private JButton evaluarPacienteButton;
    private JPanel view;
    private JButton registroDeActividadesButton;

    public MainActionsPane() {
        super();
    }

    public JButton getNuevoPacienteButton() {
        return nuevoPacienteButton;
    }

    public JButton getEvaluarPacienteButton() {
        return evaluarPacienteButton;
    }

    public JButton getRegistroDeActividadesButton() {
        return registroDeActividadesButton;
    }

    public JPanel getView() {
        return view;
    }
}
