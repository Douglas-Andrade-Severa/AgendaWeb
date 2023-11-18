package models;

import java.time.LocalDate;
import java.time.LocalTime;

public class Compromissos {
	private int id;
    private int local;
    private int contato;
    private String data;
    private String hora;
    private int status;
    
    private String dslocal;
    private String dscontato;
    private String dsStatus;
    //principal manutenção
    public Compromissos(int id, int local, int contato, String data, String hora, int status) {
		this.id = id;
		this.local = local;
		this.contato = contato;
		this.data = data;
		this.hora = hora;
		this.status = status;
	}
    
    public Compromissos(int id, String data, String hora, String dslocal, String dscontato, String dsStatus) {
		this.id = id;
		this.data = data;
		this.hora = hora;
		this.dslocal = dslocal;
		this.dscontato = dscontato;
		this.dsStatus = dsStatus;
	}    

	public Compromissos() {
    	
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getLocal() {
		return local;
	}

	public void setLocal(int local) {
		this.local = local;
	}

	public int getContato() {
		return contato;
	}

	public void setContato(int contato) {
		this.contato = contato;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getHora() {
		return hora;
	}

	public void setHora(String hora) {
		this.hora = hora;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getDslocal() {
		return dslocal;
	}

	public void setDslocal(String dslocal) {
		this.dslocal = dslocal;
	}

	public String getDscontato() {
		return dscontato;
	}

	public void setDscontato(String dscontato) {
		this.dscontato = dscontato;
	}

	public String getDsStatus() {
		return dsStatus;
	}

	public void setDsStatus(String dsStatus) {
		this.dsStatus = dsStatus;
	}
}
