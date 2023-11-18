<%@page import="controllers.CompromissoController"%>
<%@page import="models.Compromissos"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
String campox = "";
String data   = "";
String hora   = "";
int contato   =  0;
int local	  =  0;

campox = "contato";
if (request.getParameter(campox) != null) {
	if (request.getParameter(campox).equals("") == false) {
		contato = Integer.parseInt(request.getParameter(campox).replaceAll(" ", ""));
	}
}
campox = "local";
if (request.getParameter(campox) != null) {
	if (request.getParameter(campox).equals("") == false) {
		local = Integer.parseInt(request.getParameter(campox).replaceAll(" ", ""));
	}
}

campox = "data";
if (request.getParameter(campox) != null){
	data = request.getParameter(campox);
}

campox = "hora";
if (request.getParameter(campox) != null){
	hora = request.getParameter(campox);
}

Compromissos compromissos = new Compromissos();
compromissos.setContato(contato);
compromissos.setLocal(local);
compromissos.setStatus(1);
compromissos.setData(data);
compromissos.setHora(hora);

CompromissoController compromissoController = new CompromissoController();
if (compromissoController.salvar(compromissos)) {
	response.sendRedirect("./consultaCompromisso.jsp");
}
%>