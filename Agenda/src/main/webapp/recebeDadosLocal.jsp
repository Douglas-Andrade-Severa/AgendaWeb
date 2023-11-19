<%@page import="controllers.LocalController"%>
<%@page import="models.Local"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
String campox = "";
String nome = "";
String rua = "";
int numero = 0;
String bairro = "";
String cidade = "";
String estado = "";
int cep = 0;

campox = "numero";
if (request.getParameter(campox) != null) {
	if (request.getParameter(campox).equals("") == false) {
		numero = Integer.parseInt(request.getParameter(campox).replaceAll(" ", ""));
	}
}

campox = "cep";
if (request.getParameter(campox) != null) {
	if (request.getParameter(campox).equals("") == false) {
		cep = Integer.parseInt(request.getParameter(campox).replaceAll("-", ""));
	}
}

campox = "nome";
if (request.getParameter(campox) != null){
	nome = request.getParameter(campox);
}

campox = "rua";
if (request.getParameter(campox) != null){
	rua = request.getParameter(campox);
}

campox = "bairro";
if (request.getParameter(campox) != null){
	bairro = request.getParameter(campox);
}

campox = "cidade";
if (request.getParameter(campox) != null){
	cidade = request.getParameter(campox);
}

campox = "estado";
if (request.getParameter(campox) != null){
	estado = request.getParameter(campox);
}

Local local = new Local();
local.setNome(nome);
local.setRua(rua);
local.setCidade(cidade);
local.setBairro(bairro);
local.setCidade(cidade);
local.setEstado(estado);
local.setNumero(numero);
local.setCep(cep);

LocalController localController = new LocalController();
if (localController.salvar(local)) {
	response.sendRedirect("./consultaLocal.jsp");
}
%>