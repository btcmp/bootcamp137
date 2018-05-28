package com.newminiproject.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SeqDaoProduct {
	
	@Autowired
	DataSource dataSource;
	
	public String addSeq(){
		String sql = "select codeGenerator2.nextval from dual";
		PreparedStatement ps=null;
		
		String code = "PR";
		String CodeG = null; // inisialisasi awal harus null 
		long hasil = 0; // inisaiasi awal harus nol
		
		try {
			ps = dataSource.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery(); // hasil query masuk sini
			if(rs.next()) {
				hasil = rs.getLong(1);
				int angka = (int) hasil; // parsing dari long ke int
				CodeG = code + String.format("%04d", angka);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return CodeG;
	}
}
