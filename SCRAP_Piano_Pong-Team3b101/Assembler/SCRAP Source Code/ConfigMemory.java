import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JTextField;
import java.awt.GridBagLayout;
import java.awt.GridBagConstraints;
import javax.swing.JLabel;
import java.awt.Insets;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class ConfigMemory extends JDialog {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final JPanel contentPanel = new JPanel();
	private static JTextField jumpRegister;
	private static JTextField lastAddressLocation;
	private static JTextField jumpTableRegister;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			ConfigMemory dialog = new ConfigMemory();
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(false);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public ConfigMemory() {
		setTitle("Memory Configuration");
		setBounds(100, 100, 316, 158);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		GridBagLayout gbl_contentPanel = new GridBagLayout();
		gbl_contentPanel.columnWidths = new int[]{0, 0, 0};
		gbl_contentPanel.rowHeights = new int[]{0, 0, 0, 0};
		gbl_contentPanel.columnWeights = new double[]{0.0, 1.0, Double.MIN_VALUE};
		gbl_contentPanel.rowWeights = new double[]{0.0, 0.0, 0.0, Double.MIN_VALUE};
		contentPanel.setLayout(gbl_contentPanel);
		{
			JLabel lblJumpTableRegister = new JLabel("Jump Table Register [rx]:");
			GridBagConstraints gbc_lblJumpTableRegister = new GridBagConstraints();
			gbc_lblJumpTableRegister.anchor = GridBagConstraints.EAST;
			gbc_lblJumpTableRegister.insets = new Insets(0, 0, 5, 5);
			gbc_lblJumpTableRegister.gridx = 0;
			gbc_lblJumpTableRegister.gridy = 0;
			contentPanel.add(lblJumpTableRegister, gbc_lblJumpTableRegister);
		}
		{
			jumpTableRegister = new JTextField();
			jumpTableRegister.setText(scrapAssembler.getJumpTableRegister());
			GridBagConstraints gbc_txtR = new GridBagConstraints();
			gbc_txtR.insets = new Insets(0, 0, 5, 0);
			gbc_txtR.fill = GridBagConstraints.HORIZONTAL;
			gbc_txtR.gridx = 1;
			gbc_txtR.gridy = 0;
			contentPanel.add(jumpTableRegister, gbc_txtR);
			jumpTableRegister.setColumns(10);
		}
		{
			JLabel lblJumpAddressRegister = new JLabel("Jump Address Register [ry]:");
			GridBagConstraints gbc_lblJumpAddressRegister = new GridBagConstraints();
			gbc_lblJumpAddressRegister.insets = new Insets(0, 0, 5, 5);
			gbc_lblJumpAddressRegister.anchor = GridBagConstraints.EAST;
			gbc_lblJumpAddressRegister.gridx = 0;
			gbc_lblJumpAddressRegister.gridy = 1;
			contentPanel.add(lblJumpAddressRegister, gbc_lblJumpAddressRegister);
		}
		{
			jumpRegister = new JTextField();
			jumpRegister.setText(scrapAssembler.getJumpAddressRegister());
			GridBagConstraints gbc_txtR = new GridBagConstraints();
			gbc_txtR.fill = GridBagConstraints.HORIZONTAL;
			gbc_txtR.insets = new Insets(0, 0, 5, 0);
			gbc_txtR.gridx = 1;
			gbc_txtR.gridy = 1;
			contentPanel.add(jumpRegister, gbc_txtR);
			jumpRegister.setColumns(10);
		}
		{
			JLabel lblJumpTableAdress = new JLabel("Last Memory Address:");
			GridBagConstraints gbc_lblJumpTableAdress = new GridBagConstraints();
			gbc_lblJumpTableAdress.anchor = GridBagConstraints.EAST;
			gbc_lblJumpTableAdress.insets = new Insets(0, 0, 0, 5);
			gbc_lblJumpTableAdress.gridx = 0;
			gbc_lblJumpTableAdress.gridy = 2;
			contentPanel.add(lblJumpTableAdress, gbc_lblJumpTableAdress);
		}
		{
			lastAddressLocation = new JTextField();
			lastAddressLocation.setText(scrapAssembler.getLastAddressLocation()+"");
			GridBagConstraints gbc_textField_1 = new GridBagConstraints();
			gbc_textField_1.fill = GridBagConstraints.HORIZONTAL;
			gbc_textField_1.gridx = 1;
			gbc_textField_1.gridy = 2;
			contentPanel.add(lastAddressLocation, gbc_textField_1);
			lastAddressLocation.setColumns(10);
		}
		{
			JPanel buttonPane = new JPanel();
			buttonPane.setLayout(new FlowLayout(FlowLayout.RIGHT));
			getContentPane().add(buttonPane, BorderLayout.SOUTH);
			{
				JButton okButton = new JButton("OK");
				okButton.addActionListener(new ActionListener() {
					public void actionPerformed(ActionEvent e) {
						scrapAssembler.setLastAddressLocation(Long.parseLong(getlastAddressLocation()));
						scrapAssembler.setJumpAddressRegister(getJumpRegister());
						scrapAssembler.setJumpTableRegister(jumpTableRegister.getText());
						assemblerGUI.coseConfigStackJump();
					}
				});
				okButton.setActionCommand("OK");
				buttonPane.add(okButton);
				getRootPane().setDefaultButton(okButton);
			}
			{
				JButton cancelButton = new JButton("Cancel");
				cancelButton.addActionListener(new ActionListener() {
					public void actionPerformed(ActionEvent e) {
						assemblerGUI.coseConfigStackJump();
					}
				});
				cancelButton.setActionCommand("Cancel");
				buttonPane.add(cancelButton);
			}
		}
	}

	public static String getJumpRegister() {
		return jumpRegister.getText();
	}

	public static void setJumpRegister(String jumpRegister) {
		ConfigMemory.jumpRegister.setText(jumpRegister);
	}

	public static String getlastAddressLocation() {
		return lastAddressLocation.getText();
	}

	public static void setlastAddressLocation(String lastAddressLocation) {
		ConfigMemory.lastAddressLocation.setText(lastAddressLocation);
	}
	

}
