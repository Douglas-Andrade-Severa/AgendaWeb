package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	static Connection con = null;
	public static Connection conectar() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3307/dbagenda","root","root");			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}		
		return con;		
	}
	
	public static void fechar() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}