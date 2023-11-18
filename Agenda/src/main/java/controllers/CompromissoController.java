package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Compromissos;
import models.Contato;
import utils.Conexao;

public class CompromissoController {
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
					+ " where comp.status < 5\r\n"
					+ " order by data, hora asc");
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
}
