<%@page import="controllers.ContatoController"%>
<%@page import="models.Contato"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String campox = "";
String nome   = "";
String email  = "";

campox = "nome";
if (request.getParameter(campox) != null){
	nome = request.getParameter(campox);
}

campox = "email";
if (request.getParameter(campox) != null){
	email = request.getParameter(campox);
}

Contato contato = new Contato();
contato.setNome(nome);
contato.setEmail(email);

ContatoController contatoController = new ContatoController();
if (contatoController.salvar(contato)) {
	response.sendRedirect("./consultaContato.jsp");
}
%>