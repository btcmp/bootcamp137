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
public class SeqDaoTSouvenir {
	
	@Autowired
	DataSource dataSource;
	
	public String addSeq(){
		String sql = "select codeGenerator2.nextval from dual";
		PreparedStatement ps=null;
		
		String code = "TRSV";
		String CodeG = null; // inisialisasi awal harus null 
		long hasilTr = 0; // inisaiasi awal harus nol
		SimpleDateFormat formatter = new SimpleDateFormat("ddMMyy");
		Date date = new Date();
		String dt = formatter.format(date);
		try {
			ps = dataSource.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery(); // hasil query masuk sini
			if(rs.next()) {
				hasilTr = rs.getLong(1);
				int angka = (int) hasilTr; // parsing dari long ke int
				CodeG = code + dt + String.format("%04d", angka);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return CodeG;
	}
	
}
