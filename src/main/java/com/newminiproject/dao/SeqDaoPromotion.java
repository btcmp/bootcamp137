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
public class SeqDaoPromotion {

	@Autowired
	DataSource dataSource; //setting
	
	public String addSeq() {
		
		String sql = "select codeGenerate.nextval from dual";
		PreparedStatement ps = null;
		
		String code = "TRWOMP";
		String CodeG = null;
		long hasil = 0;
		SimpleDateFormat simple = new SimpleDateFormat("ddMMyy");
		Date date = new Date();
		String dt = simple.format(date);
		
		try {
			ps = dataSource.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				hasil = rs.getLong(1);
				int angka = (int) hasil;
				CodeG = code + dt + String.format("%05d", angka);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return CodeG;
	}
	
	public String convDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return sdf.format(date);
	}
}
