package com.newminiproject.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SequenceDaoRole {

	@Autowired
	DataSource dataSource;//setting 
	
	public String addSeq() {
		String sql = "select codeGenerate2.nextval from dual"; 
		PreparedStatement ps=null;
		
		String code = "RO";
		String CodeG = null;
		long result = 0;
		
		try {
			ps = dataSource.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				result =  rs.getLong(1);
				int number = (int) result;
				CodeG = code + String.format ("%04d", number);
				//System.out.println("Generated Id: " + CodeG);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
				return CodeG;
	}
}
