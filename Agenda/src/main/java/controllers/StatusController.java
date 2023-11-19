package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Status;
import utils.Conexao;

public class StatusController {
	public List<Status> getStatus(){
    	List<Status> status = new ArrayList<>();
    	Connection con = Conexao.conectar();
    	try {
			PreparedStatement stm = con.prepareStatement("select * from tb_status order by id asc");
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				status.add(new Status(rs.getInt("id"),rs.getString("descricao")));
			}
		} catch (SQLException e) {
		   e.printStackTrace();
		}
    	finally {
			Conexao.fechar();
		}
    	
    	return status;
    }
}
