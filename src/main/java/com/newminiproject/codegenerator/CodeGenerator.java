package com.newminiproject.codegenerator;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CodeGenerator {

	@Autowired
	DataSource dataSource;
	
	public String sequence(){
		String sql = "Select codeGenerator.nextval from dual";
		PreparedStatement ps = null;
		
		String code = "SV";
		String codeG = null;
		long hasil = 0;
		
		try{
			ps = dataSource.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				hasil = rs.getLong(1);
				int angka = (int) hasil;
				codeG = code + String.format("%04d", angka);
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
		
		return codeG;
	}
	
	public String sequenceTransaction(){
		String sql = "Select codeGenerator.nextval from dual";
		PreparedStatement ps = null;
		
		String code = "TRSV";
		String codeG = null;
		long hasil = 0;
		SimpleDateFormat formatter = new SimpleDateFormat("ddMMyy");  
		Date date = new Date();  
		String dt = formatter.format(date);  
		
		try{
			ps = dataSource.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				hasil = rs.getLong(1);
				int angka = (int) hasil;
				codeG = code + dt + String.format("%05d", angka);
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
		
		return codeG;
	}
	
	public String requestDate(){
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();
		return format.format(date);
	}
	
	public Date requestDateSystem(){
		Date date = new Date();
		return date;
	}
}
