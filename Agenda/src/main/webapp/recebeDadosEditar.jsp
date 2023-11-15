<%@page import="controllers.ContatoController"%>
<%@page import="models.Contato"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%

int id = 0;
String campox   = "";
String email    = "";
String nome     = "";
String operacao = "";

campox = "operacao";
if (request.getParameter(campox) != null) {
	operacao = request.getParameter(campox);
}

campox = "id";
if (request.getParameter(campox) != null) {
	if (request.getParameter(campox).equals("") == false) {
		id = Integer.parseInt(request.getParameter(campox).replaceAll(" ", ""));
	}
}

campox = "nome";
if (request.getParameter(campox) != null) {
	nome = request.getParameter(campox);
}

campox = "email";
if (request.getParameter(campox) != null) {
	email = request.getParameter(campox);
}

Contato contato = new Contato(id, nome, email);
ContatoController contatoController = new ContatoController();

if (operacao.trim().equals("") == false) {
    if (operacao.equals("excluir")) {
    	if (contatoController.excluir(contato)) {
    		response.sendRedirect("./consultaContato.jsp");
    	}
    }
}else{
	if (contatoController.alterar(contato)) {
		response.sendRedirect("./consultaContato.jsp");
	}
}

%>