package edu.uade.ia.tp7.view;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JTextArea;
import javax.swing.JComboBox;
import javax.swing.JTextField;

public class MainView {

	private JFrame frmTp;
	private JTextField txtStripesAmount;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					MainView window = new MainView();
					window.frmTp.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public MainView() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frmTp = new JFrame();
		frmTp.setTitle("TP 7");
		frmTp.setBounds(100, 100, 461, 577);
		frmTp.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmTp.getContentPane().setLayout(null);
		
		JButton btnExecute = new JButton("Ejecutar");
		btnExecute.setBounds(25, 179, 114, 25);
		frmTp.getContentPane().add(btnExecute);
		
		JLabel lblPais = new JLabel("Pais");
		lblPais.setBounds(25, 23, 66, 15);
		frmTp.getContentPane().add(lblPais);
		
		JLabel lblColores = new JLabel("Colores");
		lblColores.setBounds(25, 50, 66, 15);
		frmTp.getContentPane().add(lblColores);
		
		JLabel lblCategorias = new JLabel("Categoria");
		lblCategorias.setBounds(25, 77, 145, 15);
		frmTp.getContentPane().add(lblCategorias);
		
		JLabel lblPatron = new JLabel("Patron");
		lblPatron.setBounds(25, 104, 66, 15);
		frmTp.getContentPane().add(lblPatron);
		
		JLabel lblCantidadDeBarras = new JLabel("Cantidad de Barras");
		lblCantidadDeBarras.setBounds(25, 131, 167, 15);
		frmTp.getContentPane().add(lblCantidadDeBarras);
		
		JButton btnRestart = new JButton("Reinicar");
		btnRestart.setBounds(174, 179, 114, 25);
		frmTp.getContentPane().add(btnRestart);
		
		JButton btnClean = new JButton("Limpiar");
		btnClean.setBounds(300, 179, 114, 25);
		frmTp.getContentPane().add(btnClean);
		
		JTextArea resultArea = new JTextArea();
		resultArea.setBounds(25, 231, 404, 284);
		frmTp.getContentPane().add(resultArea);
		
		JComboBox comboCountry = new JComboBox();
		comboCountry.setBounds(247, 18, 167, 24);
		frmTp.getContentPane().add(comboCountry);
		
		JComboBox comboColors = new JComboBox();
		comboColors.setBounds(247, 45, 167, 24);
		frmTp.getContentPane().add(comboColors);
		
		JComboBox comboCategory = new JComboBox();
		comboCategory.setBounds(247, 72, 167, 24);
		frmTp.getContentPane().add(comboCategory);
		
		JComboBox comboPattern = new JComboBox();
		comboPattern.setBounds(247, 99, 167, 24);
		frmTp.getContentPane().add(comboPattern);
		
		txtStripesAmount = new JTextField();
		txtStripesAmount.setBounds(247, 129, 167, 19);
		frmTp.getContentPane().add(txtStripesAmount);
		txtStripesAmount.setColumns(10);
	}
}
