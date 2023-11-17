<%@page import="controllers.LocalController"%>
<%@page import="models.Local"%>
<%@page import="controllers.ContatoController"%>
<%@page import="models.Contato"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%

int id          = 0;
int numero      = 0;
int cep         = 0;
String campox   = "";
String nome     = "";
String rua      = "";
String bairro   = "";
String cidade   = "";
String estado   = "";
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

Local local = new Local( id, nome, rua, numero, bairro, cidade, estado, cep);
LocalController localController = new LocalController();

if (operacao.trim().equals("") == false) {
    if (operacao.equals("excluir")) {
    	if (localController.excluir(local)) {
    		response.sendRedirect("./consultaLocal.jsp");
    	}
    }
}else{
	if (localController.alterar(local)) {
		response.sendRedirect("./consultaLocal.jsp");
	}
}

%>