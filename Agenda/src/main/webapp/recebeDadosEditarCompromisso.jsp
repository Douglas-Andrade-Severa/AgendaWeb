<%@page import="controllers.CompromissoController"%>
<%@page import="models.Compromissos"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%

int id          =  0;
String campox   = "";
String data     = "";
String hora     = "";
int contato     =  0;
int local	    =  0;
int status		=  0;
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

campox = "status";
if (request.getParameter(campox) != null) {
	if (request.getParameter(campox).equals("") == false) {
		status = Integer.parseInt(request.getParameter(campox).replaceAll(" ", ""));
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

Compromissos compromissos = new Compromissos(id,local,contato,data,hora,status);
CompromissoController compromissoController = new CompromissoController();

if (operacao.trim().equals("") == false) {
    if (operacao.equals("excluir")) {
    	if (compromissoController.excluir(compromissos)) {
    		response.sendRedirect("./consultaCompromisso.jsp");
    	}
    }
}else{
	if (compromissoController.alterar(compromissos)) {
		response.sendRedirect("./consultaCompromisso.jsp");
	}
}

%>