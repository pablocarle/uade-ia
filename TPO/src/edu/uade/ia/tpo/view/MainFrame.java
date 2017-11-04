package edu.uade.ia.tpo.view;

import edu.uade.ia.tpo.ShrinkClipsService;

import javax.swing.*;
import java.awt.*;

public class MainFrame {

    private ShrinkClipsService clipsService;

    private JFrame frame;

    public MainFrame() {
        super();
        clipsService = ShrinkClipsService.get();
        initialize();
    }

    private void initialize() {
        frame = new JFrame();
        frame.setTitle("PsicoSoft");
        frame.setBounds(100, 100, 600, 800);
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setResizable(false);
        frame.setLayout(new GridBagLayout());

        //TODO Hacer un setContentPane con el GUI armado en el builder
        //frame.setContentPane(new MainViewContentPane().getView());
        frame.getContentPane().add(new PatientDataContentPane().getView());
    }

    public static void main(String[] args) {
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
