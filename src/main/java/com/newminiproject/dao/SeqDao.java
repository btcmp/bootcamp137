package com.newminiproject.dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class SeqDao {
	@Autowired
	DataSource dataSource;//setting 
	
	public String addSeq() {
		String sql = "select codeGenerate3.nextval from dual"; 
		PreparedStatement ps=null;
		
		String code = "CP";
		String CodeG = null;//inisialisai awal harus null karena string
		long hasil = 0;//inisaialisasi awal harus 0 karena angka
		SimpleDateFormat format = new SimpleDateFormat("ddMMyy");
		Date date = new Date();
		String dt = format.format(date);
		try {
			ps = dataSource.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();//hasil query masuk sini
			if(rs.next()) {
				hasil =  rs.getLong(1);// ambil data dari nextval sesuai urutan colomn
				int angka = (int) hasil;
				CodeG = code + String.format ("%04d", angka);
				//System.out.println("Generated Id: " + CodeG);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
				return CodeG;
	}
}
