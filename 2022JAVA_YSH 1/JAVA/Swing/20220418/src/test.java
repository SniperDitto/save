import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import pkg.DB.DBUse;
import pkg.DB.QueryKind;

import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.awt.event.ActionEvent;
import javax.swing.JTextField;
import java.awt.FlowLayout;
import javax.swing.JLabel;
import java.awt.Font;
import java.awt.TextArea;

import javax.swing.JTextArea;

public class test extends JFrame {

	private JPanel contentPane;
	private JTextField userName;
	private JTextField contents;
	private JTextField userPW;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					test frame = new test();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public test() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 904, 509);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		
		JLabel lblNewLabel = new JLabel("memo.");
		lblNewLabel.setFont(new Font("D2Coding", Font.PLAIN, 25));
		lblNewLabel.setBounds(406, 10, 110, 50);
		contentPane.add(lblNewLabel);
		
		JLabel lblNewLabel_1 = new JLabel("제목");
		lblNewLabel_1.setBounds(94, 98, 77, 34);
		contentPane.add(lblNewLabel_1);
		
		userName = new JTextField();
		userName.setBounds(265, 70, 116, 21);
		contentPane.add(userName);
		userName.setColumns(10);
		
		JLabel lblNewLabel_2 = new JLabel("작성자");
		lblNewLabel_2.setBounds(183, 73, 70, 15);
		contentPane.add(lblNewLabel_2);
		
		contents = new JTextField();
		contents.setBounds(183, 98, 479, 34);
		contentPane.add(contents);
		contents.setColumns(10);
		
		JLabel lblNewLabel_3 = new JLabel("비밀번호");
		lblNewLabel_3.setBounds(416, 73, 57, 15);
		contentPane.add(lblNewLabel_3);
		
		userPW = new JTextField();
		userPW.setBounds(520, 70, 116, 21);
		contentPane.add(userPW);
		userPW.setColumns(10);
		
		JTextArea contentArea = new JTextArea();
		contentArea.setBounds(112, 157, 628, 175);
		contentPane.add(contentArea);
		
		JButton btnNewButton = new JButton("완.");
		btnNewButton.setBounds(674, 98, 78, 34);
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//버튼 클릭시 실행될 내용
				String text = "";
				text += "작성자 : "+userName.getText()+"\n";
				text += "내용 : "+contents.getText();
				contentArea.setText(text);
			}
		});
		contentPane.setLayout(null);
		contentPane.add(btnNewButton);
		
		
		
		
	}
}
