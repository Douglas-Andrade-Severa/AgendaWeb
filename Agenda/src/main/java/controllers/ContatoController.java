package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Contato;
import utils.Conexao;

public class ContatoController {
	/*static List<Contato> contatos = new ArrayList<Contato>();*/
	
	public ContatoController() {
		/*contatos.add(new Contato(1, "maria", "maria@gmail.com"));
		contatos.add(new Contato(2, "jose", "jose@gmail.com"));
		contatos.add(new Contato(3, "Antonio", "antonio@gmail.com"));
		contatos.add(new Contato(4, "joao", "joao@gmail.com"));*/
	}
	
	public Contato consultarByID(int id) {
		Connection con = Conexao.conectar();
		Contato contato = null;
    	try {
			PreparedStatement stm = con.prepareStatement("select * from tb_contatos where id = ?");
			stm.setInt(1, id);
			ResultSet rs = stm.executeQuery();
			if(rs.next()) {
				contato = new Contato(rs.getInt("id"),rs.getString("nome"),rs.getString("email"));				
			}
		} catch (SQLException e) {
		   e.printStackTrace();
		}
    	return contato;
	}
	
	public boolean alterar(Contato ct) {
    	Connection con = Conexao.conectar();
    	String sql = "update tb_contatos set nome = ?, email = ? where id = ?";
    	try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, ct.getNome());
			stm.setString(2, ct.getEmail());
			stm.setInt(3, ct.getId());
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
	
	public boolean excluir(Contato ct) {
    	Connection con = Conexao.conectar();
    	String sql = "delete from tb_contatos where id = ?";
    	try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, ct.getId());
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
	
    public boolean salvar(Contato ct) {
    	Connection con = Conexao.conectar();
    	String sql = "insert into tb_contatos(nome, email)values(?,?)";
    	try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, ct.getNome());
			stm.setString(2, ct.getEmail());
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
    
    public List<Contato> getContatos(){
    	List<Contato> contatos = new ArrayList<>();
    	Connection con = Conexao.conectar();
    	try {
			PreparedStatement stm = con.prepareStatement("select * from tb_contatos");
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				contatos.add(new Contato(rs.getInt("id"),rs.getString("nome"),rs.getString("email")));				
			}
		} catch (SQLException e) {
		   e.printStackTrace();
		}
    	finally {
			Conexao.fechar();
		}
    	
    	return contatos;
    }
}