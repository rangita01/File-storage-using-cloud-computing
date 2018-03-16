package com.pojo;

import java.awt.Component;
import java.io.File;

import javax.swing.JFileChooser;

public class a {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		
		JFileChooser chooser = new JFileChooser();
		chooser.setMultiSelectionEnabled(true);
		Component frame = null;
		chooser.showOpenDialog(frame);
		File[] files = chooser.getSelectedFiles();
		
		for(int i=0; i<files.length;i++)
		{
			System.out.println(i+"  "+files[i]);
		}
		
	}

}
