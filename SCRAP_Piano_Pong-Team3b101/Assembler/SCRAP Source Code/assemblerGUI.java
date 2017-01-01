import java.awt.EventQueue;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

import com.jgoodies.forms.layout.FormLayout;
import com.jgoodies.forms.layout.ColumnSpec;
import com.jgoodies.forms.layout.RowSpec;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.JButton;
import javax.swing.JEditorPane;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Color;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import com.jgoodies.forms.layout.FormSpecs;
import javax.swing.JFileChooser;
import java.io.FileWriter;
import java.io.FileReader;
import java.io.BufferedWriter;
import java.io.BufferedReader;
import java.io.IOException;
import java.awt.Font;
import javax.swing.JPanel;
import java.awt.event.InputMethodListener;
import java.awt.event.WindowAdapter;
import java.awt.event.InputMethodEvent;
import javax.swing.ScrollPaneConstants;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

import java.awt.Component;
import java.awt.Dimension;
import java.awt.event.WindowEvent;


public class assemblerGUI {

	private JFrame frmScrapAssembler;
	final static ConfigMemory optionWindow = new ConfigMemory();
	private static boolean unsavedChanges = false;


	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					assemblerGUI window = new assemblerGUI();
					window.frmScrapAssembler.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public assemblerGUI() {
		initialize();
	}
    
	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frmScrapAssembler = new JFrame();
		frmScrapAssembler.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		frmScrapAssembler.addWindowListener(new WindowAdapter() {
			@Override
            public void windowClosed(WindowEvent e) {
                super.windowClosed(e);
            }

            @Override
            public void windowClosing(WindowEvent e) {
                super.windowClosing(e);
                if(isUnsavedChanges()){
	                int quit = JOptionPane.showConfirmDialog(frmScrapAssembler, "Assembly has unsaved changes. Still exit?");
	                if(quit == JOptionPane.YES_OPTION){
	                	frmScrapAssembler.dispose();
	                }
                }
                else{
                	frmScrapAssembler.dispose();
                }

            }
		});
		frmScrapAssembler.setResizable(false);
		frmScrapAssembler.setTitle("SCRAP Assembler! Alpha v0.3 by Team 3'b101");
		frmScrapAssembler.setBounds(100, 100, 935, 633);
		FormLayout formLayout = new FormLayout(new ColumnSpec[] {
				FormSpecs.RELATED_GAP_COLSPEC,
				FormSpecs.RELATED_GAP_COLSPEC,
				FormSpecs.DEFAULT_COLSPEC,
				FormSpecs.RELATED_GAP_COLSPEC,
				FormSpecs.RELATED_GAP_COLSPEC,
				ColumnSpec.decode("max(50dlu;default):grow"),
				FormSpecs.RELATED_GAP_COLSPEC,
				FormSpecs.RELATED_GAP_COLSPEC,},
			new RowSpec[] {
				FormSpecs.LABEL_COMPONENT_GAP_ROWSPEC,
				FormSpecs.RELATED_GAP_ROWSPEC,
				FormSpecs.MIN_ROWSPEC,
				FormSpecs.RELATED_GAP_ROWSPEC,
				RowSpec.decode("max(19dlu;default)"),
				FormSpecs.UNRELATED_GAP_ROWSPEC,
				RowSpec.decode("fill:0px:grow"),
				FormSpecs.RELATED_GAP_ROWSPEC,
				FormSpecs.LABEL_COMPONENT_GAP_ROWSPEC,});
		formLayout.setColumnGroups(new int[][]{new int[]{1, 4, 5}});
		formLayout.setRowGroups(new int[][]{new int[]{1, 2, 4, 6, 8, 9}});
		formLayout.setRowGroup(new int[] {1, 2, 4, 6, 8, 9});
		formLayout.setColumnGroup(new int[] {1, 4, 5});
		frmScrapAssembler.getContentPane().setLayout(formLayout);
		
		
		
		JPanel panel = new JPanel();
		frmScrapAssembler.getContentPane().add(panel, "3, 3, center, fill");
		
		JPanel panel_2 = new JPanel();
		frmScrapAssembler.getContentPane().add(panel_2, "6, 3, fill, fill");
		
		
		JPanel panel_5 = new JPanel();
		frmScrapAssembler.getContentPane().add(panel_5, "6, 7, fill, fill");
		panel_5.setLayout(new FormLayout(new ColumnSpec[] {
				ColumnSpec.decode("max(50dlu;default):grow"),},
			new RowSpec[] {
				RowSpec.decode("fill:pref:grow"),}));
		
		final JTextArea txtrBinary = new JTextArea();
		txtrBinary.setMaximumSize(new Dimension(2147483647, 650));
		txtrBinary.setMinimumSize(new Dimension(4, 17));
		JScrollPane scrollPane_1 = new JScrollPane(txtrBinary);
		scrollPane_1.setMaximumSize(new Dimension(32767, 400));
		panel_5.add(scrollPane_1, "1, 1, fill, fill");
		scrollPane_1.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
		scrollPane_1.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
				
		scrollPane_1.setViewportView(txtrBinary);
		txtrBinary.setDragEnabled(true);
		txtrBinary.setText("binary");
		txtrBinary.setBackground(Color.LIGHT_GRAY);
		
		
		JPanel panel_3 = new JPanel();
		frmScrapAssembler.getContentPane().add(panel_3, "6, 5, fill, fill");
		JButton btnCopyButton = new JButton("Copy Binary");
		panel_3.add(btnCopyButton);
		
				
				btnCopyButton.addActionListener(new ActionListener() {
					public void actionPerformed(ActionEvent arg0) {
						txtrBinary.selectAll();
						txtrBinary.copy();
					}
				});
		
		JPanel panel_4 = new JPanel();
		frmScrapAssembler.getContentPane().add(panel_4, "3, 7, fill, fill");
		panel_4.setLayout(new FormLayout(new ColumnSpec[] {
				ColumnSpec.decode("default:grow"),},
			new RowSpec[] {
				RowSpec.decode("fill:pref:grow"),}));
		final JTextArea txtrAssembly = new JTextArea();
		txtrAssembly.setMaximumSize(new Dimension(2147483647, 650));
		txtrAssembly.setMinimumSize(new Dimension(4, 17));
		
		JScrollPane scrollPane = new JScrollPane( txtrAssembly );
		scrollPane.setMaximumSize(new Dimension(32767, 400));
		panel_4.add(scrollPane, "1, 1, fill, fill");
		scrollPane.setAutoscrolls(true);
		scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
		scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
				
		scrollPane.setViewportView(txtrAssembly);
		txtrAssembly.setDragEnabled(true);		
		txtrAssembly.setText("assembly");


		txtrAssembly.getDocument().addDocumentListener(new DocumentListener() {
			  public void changedUpdate(DocumentEvent e) {
			    changed();
			  }
			  public void removeUpdate(DocumentEvent e) {
			    changed();
			  }
			  public void insertUpdate(DocumentEvent e) {
			    changed();
			  }

			  public void changed() {
				  setUnsavedChanges(true);
			  }
			});
		
		JButton btnSaveBinary = new JButton("Save Binary");
		panel_2.add(btnSaveBinary);
		btnSaveBinary.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				 txtrBinary.setText(scrapAssembler.toBinary(txtrAssembly.getText()));
				 FileNameExtensionFilter filter = new FileNameExtensionFilter("Text files", "txt", "TXT");
			      JFileChooser c = new JFileChooser();
			      c.setAcceptAllFileFilterUsed(true);
			      c.setFileFilter(filter);
			      int rVal = c.showSaveDialog(null);
			      if (rVal == JFileChooser.APPROVE_OPTION) {
			    	  try {
						FileWriter fileWriter = new FileWriter(c.getSelectedFile().getAbsolutePath());
						BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
						bufferedWriter.write(scrapAssembler.toBinary(txtrAssembly.getText()));
						bufferedWriter.close();
						
					} catch (IOException e1) {}
			      }
			}
		});
		
		JPanel panel_1 = new JPanel();
		frmScrapAssembler.getContentPane().add(panel_1, "3, 5, fill, fill");
		
	
		JButton btnScrapAssemble = new JButton("SCRAP Assemble!");
		panel_1.add(btnScrapAssemble);
		btnScrapAssemble.setMaximumSize(new Dimension(90, 23));
		btnScrapAssemble.setMinimumSize(new Dimension(90, 23));
		btnScrapAssemble.setAlignmentX(Component.CENTER_ALIGNMENT);
		btnScrapAssemble.setFont(new Font("Tahoma", Font.BOLD, 12));
		btnScrapAssemble.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				txtrBinary.setText(scrapAssembler.toBinary(txtrAssembly.getText()));
			}
		});
	
		

		
		JButton button = new JButton("Open Assembly Code");
		panel.add(button);
		button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				 FileNameExtensionFilter filter = new FileNameExtensionFilter("Text files", "txt", "TXT"); 
			      JFileChooser c = new JFileChooser();
			      c.setAcceptAllFileFilterUsed(true);
			      c.setFileFilter(filter);
			      int rVal = c.showOpenDialog(null);
			      if (rVal == JFileChooser.APPROVE_OPTION) {
			    	  try {
						FileReader fileReader = new FileReader(c.getSelectedFile().getAbsolutePath());
						BufferedReader bufferedReader = new BufferedReader(fileReader);
						txtrAssembly.read(bufferedReader, c.getSelectedFile());
						bufferedReader.close();
						setUnsavedChanges(false);
					} catch (IOException e1) {}
			      }
			      txtrAssembly.getDocument().addDocumentListener(new DocumentListener() {
					  public void changedUpdate(DocumentEvent e) {
					    changed();
					  }
					  public void removeUpdate(DocumentEvent e) {
					    changed();
					  }
					  public void insertUpdate(DocumentEvent e) {
					    changed();
					  }

					  public void changed() {
						  setUnsavedChanges(true);
					  }
					});
			}
		});
		
		JButton btnSaveAssemblyCode = new JButton("Save Assembly Code");
		panel.add(btnSaveAssemblyCode);
		btnSaveAssemblyCode.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				txtrBinary.setText(scrapAssembler.toBinary(txtrAssembly.getText()));
				 FileNameExtensionFilter filter = new FileNameExtensionFilter("Text files", "txt", "TXT");
			      JFileChooser c = new JFileChooser();
			      c.setAcceptAllFileFilterUsed(true);
			      c.setFileFilter(filter);
			      int rVal = c.showSaveDialog(null);
			      if (rVal == JFileChooser.APPROVE_OPTION) {
			    	  try {
						FileWriter fileWriter = new FileWriter(c.getSelectedFile().getAbsolutePath());
						BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
						bufferedWriter.write(txtrAssembly.getText());
						bufferedWriter.close();
						setUnsavedChanges(false);
					} catch (IOException e1) {}
			      }
			}
		});
		
		
		
		JButton btnMemConfig = new JButton("Memory Config");
		btnMemConfig.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				ConfigMemory.setlastAddressLocation(scrapAssembler.getLastAddressLocation()+"");
				ConfigMemory.setJumpRegister(scrapAssembler.getJumpAddressRegister()+"");
				optionWindow.setVisible(true);
			}
		});
		panel.add(btnMemConfig);;
		

	}

	public static void coseConfigStackJump() {
		optionWindow.setVisible(false);
		
	}
	
	public static boolean isUnsavedChanges() {
		return unsavedChanges;
	}

	public static void setUnsavedChanges(boolean unsavedChanges) {
		assemblerGUI.unsavedChanges = unsavedChanges;
	}

}
