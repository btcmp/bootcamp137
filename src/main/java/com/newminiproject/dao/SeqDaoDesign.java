package com.newminiproject.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SeqDaoDesign {

	@Autowired
	DataSource dataSource;
	
	public String addSeq() {
		String sql = "select codeGenerate.nextval from dual";
		PreparedStatement ps = null; //mengambil hasil 
		
		String code= "TRWODS";
		String CodeG = null;	//inisialisasi awal
		long hasil = 0;			//inisialisasi awal
		SimpleDateFormat formatter = new SimpleDateFormat("ddMMyy");
		Date date = new Date();
		String dt = formatter.format(date);
		
		try {
			ps = dataSource.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				hasil = rs.getLong(1);
				int angka = (int) hasil; 	//konversi dari long hasil ke int angka
				CodeG = code + dt + String.format("%05d", angka);
				//System.out.println("Generated Id");
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return CodeG;	
	}
	
	public Date requestDate() {
		Date dt = new Date();
		return dt;
	}
}
