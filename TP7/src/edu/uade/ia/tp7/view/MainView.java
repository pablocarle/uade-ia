package edu.uade.ia.tp7.view;

import java.awt.EventQueue;
import java.awt.event.ItemEvent;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.*;

import edu.uade.ia.tp7.ClipsService;

public class MainView {

	private JFrame frmTp;
	private JTextField txtStripesAmount;
	
	private JButton btnExecute;
	private JLabel lblPais;
	private JLabel lblColores;
	private JLabel lblCategorias;
	private JLabel lblPatron;
	private JLabel lblCantidadDeBarras;
	private JButton btnRestart;
	private JButton btnClean;
	private JTextArea resultArea;
	private JComboBox<String> comboCountry;
	private JComboBox<String> comboPattern;
	private JComboBox<String> comboColors;
	private JComboBox<String> comboCategory;
	
	private ClipsService clips;

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
		this.clips = new ClipsService();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frmTp = new JFrame();
		frmTp.setTitle("TP 7");
		frmTp.setBounds(100, 100, 477, 577);
		frmTp.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		frmTp.getContentPane().setLayout(null);
		
		btnExecute = new JButton("Ejecutar");
		btnExecute.addActionListener(event -> {
			if (validate()) {
				List result = new ArrayList<>();
				try {
					result = clips.run(extractParams());
					displayResult(result);
				} catch (Exception e) {
					JOptionPane.showMessageDialog(null, "Error ejecutando CLIPS " + e.getMessage());
					e.printStackTrace();
				}
			}
		});
		btnExecute.setBounds(25, 179, 114, 25);
		frmTp.getContentPane().add(btnExecute);
		
		lblPais = new JLabel("Pais");
		lblPais.setBounds(25, 23, 66, 15);
		frmTp.getContentPane().add(lblPais);
		
		lblColores = new JLabel("Colores");
		lblColores.setBounds(25, 50, 66, 15);
		frmTp.getContentPane().add(lblColores);
		
		lblCategorias = new JLabel("Categoria");
		lblCategorias.setBounds(25, 77, 145, 15);
		frmTp.getContentPane().add(lblCategorias);
		
		lblPatron = new JLabel("Patron");
		lblPatron.setBounds(25, 104, 66, 15);
		frmTp.getContentPane().add(lblPatron);
		
		lblCantidadDeBarras = new JLabel("Cantidad de Barras");
		lblCantidadDeBarras.setBounds(25, 131, 167, 15);
		frmTp.getContentPane().add(lblCantidadDeBarras);
		
		btnRestart = new JButton("Reinicar");
		btnRestart.setBounds(174, 179, 114, 25);
		frmTp.getContentPane().add(btnRestart);
		
		btnClean = new JButton("Limpiar");
		btnClean.setBounds(300, 179, 114, 25);
		frmTp.getContentPane().add(btnClean);
		
		resultArea = new JTextArea();
		resultArea.setBounds(25, 231, 404, 284);
		frmTp.getContentPane().add(resultArea);
		
		comboCountry = new JComboBox<>();
		comboCountry.setBounds(247, 18, 167, 24);
		initializeCountries(comboCountry);
		comboCountry.addItemListener(event -> {
			if (event.getStateChange() == ItemEvent.SELECTED) {
				String country = (String) event.getItem();
				if (country != null && country.length() > 0) {
					initializeCategories(comboCategory, country);
				} else {
					initializeCategories(comboCategory, "");
				}
			}
		});
		frmTp.getContentPane().add(comboCountry);
		
		comboColors = new JComboBox<>();
		comboColors.setBounds(247, 45, 167, 24);
		//comboColors.setRenderer(new ComboRowRenderer());
		frmTp.getContentPane().add(comboColors);
		
		comboCategory = new JComboBox<>();
		comboCategory.setBounds(247, 72, 167, 24);
		frmTp.getContentPane().add(comboCategory);
		
		comboPattern = new JComboBox<>();
		comboPattern.setBounds(247, 99, 167, 24);
		initializePatterns(comboPattern);
		comboPattern.addItemListener(event -> {
			if (event.getStateChange() == ItemEvent.SELECTED) {
				String pattern = (String) event.getItem();
				if (pattern != null && pattern.contains("Barra")) {
					txtStripesAmount.setText("");
					txtStripesAmount.setEnabled(true);
				} else {
					txtStripesAmount.setText("");
					txtStripesAmount.setEnabled(false);
				}
			}
		});
		frmTp.getContentPane().add(comboPattern);
		
		txtStripesAmount = new JTextField();
		txtStripesAmount.setBounds(247, 129, 167, 19);
		txtStripesAmount.setEnabled(false);
		frmTp.getContentPane().add(txtStripesAmount);
		txtStripesAmount.setColumns(10);
	}

	private void displayResult(List result) {
		if (result.isEmpty()) {
			resultArea.setText("No hay coincidencias de equipos para los parametros ingresados");
		} else {
			resultArea.setText("Los siguientes pares equipos - camisetas cumplen con los parametros ingresados\n");
		}
	}

	private boolean validate() {
		Map<String, String> params = extractParams();
		return params.size() > 0 && params.entrySet().stream()
				.allMatch(entry -> entry.getValue() != null && entry.getValue().length() > 0);
	}

	private Map<String, String> extractParams() {

		return new HashMap<>();
	}

	private void initializeCountries(JComboBox<String> combo) {
		combo.addItem("");
		combo.addItem("Argentina");
		combo.addItem("Italia");
	}
	
	private void initializePatterns(JComboBox<String> combo) {
		combo.addItem("");
		combo.addItem("Barras Horizontales");
		combo.addItem("Barras Verticales");
		combo.addItem("Barras Diagonales");
		combo.addItem("Lisa");
	}
	
	private void initializeCategories(JComboBox<String> combo, String country) {
		combo.removeAllItems();
		switch (country.toLowerCase()) {
			case "argentina":
				combo.addItem("Primera A");
				combo.addItem("Primera B Nacional");
				break;
			case "italia":
				combo.addItem("Serie A");
				combo.addItem("Serie B");
				break;
			default:
				combo.addItem("");
				break;
		}
	}
}
