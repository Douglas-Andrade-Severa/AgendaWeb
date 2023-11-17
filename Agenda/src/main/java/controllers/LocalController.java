package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Contato;
import models.Local;
import utils.Conexao;

public class LocalController {
	
	public Local consultarByID(int id) {
		Connection con = Conexao.conectar();
		Local local = null;
    	try {
			PreparedStatement stm = con.prepareStatement("select * from tb_locais where id = ?");
			stm.setInt(1, id);
			ResultSet rs = stm.executeQuery();
			if(rs.next()) {
				local = new Local(rs.getInt("id"),rs.getString("nome"),rs.getString("rua"),rs.getInt("numero"),rs.getString("bairro"),rs.getString("cidade"),rs.getString("estado"),rs.getInt("cep"));
			}
		} catch (SQLException e) {
		   e.printStackTrace();
		}
    	return local;
	}
	
	public boolean alterar(Local local) {
    	Connection con = Conexao.conectar();
    	String sql = "update tb_locais set nome=?, rua=?, numero=?,bairro=?,cidade=?,estado=?,cep=? where id = ?";
    	try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, local.getNome());
			stm.setString(2, local.getRua());
			stm.setInt(3, local.getNumero());
			stm.setString(4, local.getBairro());
			stm.setString(5, local.getCidade());
			stm.setString(6, local.getEstado());
			stm.setInt(7, local.getCep());
			stm.setInt(8, local.getId());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;			
		}
    	finally {
			Conexao.fechar();
		}
    	return true;
    }
	
	public boolean excluir(Local local) {
    	Connection con = Conexao.conectar();
    	String sql = "delete from tb_locais where id = ?";
    	try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, local.getId());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;			
		}
    	finally {
			Conexao.fechar();
		}
    	return true;
    }
	
	public boolean salvar(Local local) {
    	Connection con = Conexao.conectar();
    	String sql = "insert into tb_locais(nome,rua,numero,bairro,cidade,estado,cep)values(?,?,?,?,?,?,?)";
    	try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, local.getNome());
			stm.setString(2, local.getRua());
			stm.setInt(3, local.getNumero());
			stm.setString(4, local.getBairro());
			stm.setString(5, local.getCidade());
			stm.setString(6, local.getEstado());
			stm.setInt(7, local.getCep());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;			
		}
    	finally {
			Conexao.fechar();
		}
    	return true;
    }
	
	public List<Local> getLocais(){
    	List<Local> locais = new ArrayList<>();
    	Connection con = Conexao.conectar();
    	try {
			PreparedStatement stm = con.prepareStatement("select * from tb_locais");
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				locais.add(new Local(rs.getInt("id"),rs.getString("nome"),rs.getString("rua"),rs.getInt("numero"),rs.getString("bairro"),rs.getString("cidade"),rs.getString("estado"),rs.getInt("cep")));
			}
		} catch (SQLException e) {
		   e.printStackTrace();
		}
    	finally {
			Conexao.fechar();
		}
    	
    	return locais;
    }
}
