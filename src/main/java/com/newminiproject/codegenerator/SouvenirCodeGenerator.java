package com.newminiproject.codegenerator;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.id.IdentifierGenerator;

public class SouvenirCodeGenerator implements IdentifierGenerator {

	public Serializable generate(SessionImplementor session, Object object) throws HibernateException {
		// TODO Auto-generated method stub
		String prefix = "SV";
		Connection connection = session.connection();
		
		try {
			Statement statement = connection.createStatement();
			
			ResultSet rs = statement.executeQuery("select count(code) as code from demo.Souvenir");
			
			 if(rs.next()) {
				 int id=rs.getInt(1)+101;
	             String generatedId = prefix + new Integer(id).toString();
	             System.out.println("Generated Id: " + generatedId);
	             return generatedId;
			 }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
