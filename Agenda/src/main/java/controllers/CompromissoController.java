package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Compromissos;
import utils.Conexao;

public class CompromissoController {
	public Compromissos consultarByID(int id) {
		Connection con = Conexao.conectar();
		Compromissos compromisso = null;
    	try {
			PreparedStatement stm = con.prepareStatement("select * from tb_compromissos where id = ?");
			stm.setInt(1, id);
			ResultSet rs = stm.executeQuery();
			if(rs.next()) {
				compromisso = new Compromissos(rs.getInt("id"),rs.getInt("localID"),rs.getInt("contatoID"),rs.getString("data"),rs.getString("hora"),rs.getInt("status"));
			}
		} catch (SQLException e) {
		   e.printStackTrace();
		}
    	return compromisso;
	}
	
	public boolean alterar(Compromissos compromissos) {
    	Connection con = Conexao.conectar();
    	String sql = "update tb_compromissos set localID=?, contatoID=?, data=?,hora=?,status=? where id = ?";
    	try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, compromissos.getLocal());
			stm.setInt(2, compromissos.getContato());
			stm.setString(3, compromissos.getData());
			stm.setString(4, compromissos.getHora());
			stm.setInt(5, compromissos.getStatus());
			stm.setInt(6, compromissos.getId());
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
	
	public boolean excluir(Compromissos compromissos) {
    	Connection con = Conexao.conectar();
    	String sql = "delete from tb_compromissos where id = ?";
    	try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, compromissos.getId());
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
	
	public boolean salvar(Compromissos compromisso) {
    	Connection con = Conexao.conectar();
    	String sql = "insert into tb_compromissos(localID, contatoID, data, hora, status)values(?,?,?,?,?)";
    	try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, compromisso.getLocal());
			stm.setInt(2, compromisso.getContato());
			stm.setString(3, compromisso.getData());
			stm.setString(4, compromisso.getHora());
			stm.setInt(5, compromisso.getStatus());
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
	
	public List<Compromissos> getCompromissos(){
    	List<Compromissos> compromissos = new ArrayList<>();
    	Connection con = Conexao.conectar();
    	try {
			PreparedStatement stm = con.prepareStatement("select comp.id, cont.nome as contato, loca.nome as local, comp.data,comp.hora,stat.descricao\r\n"
					+ "  from tb_compromissos as comp\r\n"
					+ " inner join tb_contatos as cont on cont.id=comp.contatoID\r\n"
					+ " inner join tb_locais   as loca on loca.id=comp.localID\r\n"
					+ " inner join tb_status   as stat on stat.id=comp.status\r\n"
					+ " where comp.status\r\n"
					+ " order by data");
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				compromissos.add(new Compromissos(rs.getInt("id"),rs.getString("data"),rs.getString("hora"),rs.getString("local"),rs.getString("contato"),rs.getString("descricao")));
			}
		} catch (SQLException e) {
		   e.printStackTrace();
		}
    	finally {
			Conexao.fechar();
		}
    	
    	return compromissos;
    }
	
	public List<Compromissos> getCompromissosFiltrados(Compromissos compromisso) {
	    List<Compromissos> compromissos = new ArrayList<>();
	    Connection con = Conexao.conectar();
	    try {
	        // Montando a query base
	        String query = "SELECT comp.id, cont.nome AS contato, loca.nome AS local, comp.data, comp.hora, stat.descricao "
	                + "FROM tb_compromissos AS comp "
	                + "INNER JOIN tb_contatos AS cont ON cont.id = comp.contatoID "
	                + "INNER JOIN tb_locais AS loca ON loca.id = comp.localID "
	                + "INNER JOIN tb_status AS stat ON stat.id = comp.status "
	                + "WHERE 1 = 1 ";
	        if (compromisso.getStatus() != 0) {
	            query += "AND comp.status = ? ";
	        }
	        query += "ORDER BY comp.data"; 
	        PreparedStatement stm = con.prepareStatement(query);
	        int parameterIndex = 1;
	        if (compromisso.getStatus() != 0) {
	            stm.setInt(parameterIndex++, compromisso.getStatus());
	        }
	        ResultSet rs = stm.executeQuery();
	        while (rs.next()) {
	            compromissos.add(new Compromissos(
	                    rs.getInt("id"),
	                    rs.getString("data"),
	                    rs.getString("hora"),
	                    rs.getString("local"),
	                    rs.getString("contato"),
	                    rs.getString("descricao")
	            ));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        Conexao.fechar();
	    }

	    return compromissos;
	}

}
