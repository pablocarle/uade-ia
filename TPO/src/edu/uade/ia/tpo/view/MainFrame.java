package edu.uade.ia.tpo.view;

import edu.uade.ia.tpo.ShrinkClipsService;

import javax.swing.*;

public class MainFrame {

    private ShrinkClipsService clipsService;

    public MainFrame() {
        super();
        clipsService = ShrinkClipsService.get();
    }

    public static void main(String[] args) {
        JFrame frame = new JFrame();

        

        frame.setVisible(true);
    }

}
