<%@page import="java.lang.module.Configuration"%>
<%@page import="models.Local"%>
<%@page import="controllers.LocalController"%>
<%@page import="models.Status"%>
<%@page import="controllers.StatusController"%>
<%@page import="models.Compromissos"%>
<%@page import="java.awt.Component"%>
<%@page import="controllers.CompromissoController"%>
<%@page import="controllers.ContatoController"%>
<%@page import="models.Contato"%>
<%@page import="utils.Conexao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String campox    = "";
String dataID    = "";
String horaID    = "";
int    localID   =  0;
int    contatoID =  0;
int    statusID  =  0;

campox = "data";
if (request.getParameter(campox) != null){
	dataID = request.getParameter(campox);
}

campox = "hora";
if (request.getParameter(campox) != null){
	horaID = request.getParameter(campox);
}

campox = "local";
if (request.getParameter(campox) != null) {
	if (request.getParameter(campox).equals("") == false) {
		localID = Integer.parseInt(request.getParameter(campox).replaceAll(" ", ""));
	}
}

campox = "contato";
if (request.getParameter(campox) != null) {
	if (request.getParameter(campox).equals("") == false) {
		contatoID = Integer.parseInt(request.getParameter(campox).replaceAll(" ", ""));
	}
}

campox = "status";
if (request.getParameter(campox) != null) {
	if (request.getParameter(campox).equals("") == false) {
		statusID = Integer.parseInt(request.getParameter(campox).replaceAll(" ", ""));
	}
}

Compromissos compromisso = new Compromissos();
compromisso.setData(dataID);
compromisso.setHora(horaID);
compromisso.setLocal(localID);
compromisso.setContato(contatoID);
compromisso.setStatus(statusID);

CompromissoController compromissoController = new CompromissoController();
List<Compromissos> compromissos = compromissoController.getCompromissosFiltrados(compromisso);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consulta Contato</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>  

<body>
	<div class="container">
		<%@ include file="./menu.jsp"%>
		<form action="consultaCompromisso.jsp" method="GET">
	        <div class="row mb-3">
	            <div class="col-md-2">
	                <label for="data">Data:</label>
	                <input type="date" class="form-control" id="data" name="data" value='<%= dataID %>'>
	            </div>
	            <div class="col-md-2">
	                <label for="hora">Hora:</label>
	                <input type="time" class="form-control" id="hora" name="hora" value='<%= horaID %>'>
	            </div>
	            <div class="col-md-2">
	                <label for="local">Local:</label>
	                <select class="form-select" id="local" name="local">
	                	<option value="">Selecione um local</option>
	                    <%						    
	                    	LocalController localController = new LocalController(); 
						    List<Local> locais = localController.getLocais();
						    for (Local local : locais) {
						    %>
						        <option value='<%= local.getId()%>' <%= local.getId() == localID ? "selected" : "" %>><%= local.getNome() %></option>
						    <%
						    }
					    %>
	                </select>
	            </div>
	            <div class="col-md-2">
	                <label for="contato">Contato:</label>
	                <select class="form-select" id="contato" name="contato">
	                	<option value="">Selecione um contato</option> <!-- Opção em branco -->
	                    <%						    
	                    	ContatoController contatoController =  new ContatoController();
						    List<Contato> contatos = contatoController.getContatos();
						    for (Contato contato : contatos) {
						    %>
						        <option value='<%= contato.getId()%>' <%= contato.getId() == contatoID ? "selected" : "" %>><%= contato.getNome() %></option>
						    <%
						    }
					    %>
	                </select>
	            </div>
	            <div class="col-md-2">
	                <label for="status">Status:</label>
	                <select class="form-select" id="status" name="status">
	                	<option value="">Selecione um status</option> <!-- Opção em branco -->
	                    <%
						    StatusController statusController = new StatusController();
						    List<Status> statusx = statusController.getStatus();
						    for (Status status : statusx) {
						    %>
						        <option value='<%= status.getId()%>' <%= status.getId() == statusID ? "selected" : "" %>><%= status.getNome() %></option>					        
						    <%
						    }
					    %>
	                </select>
	            </div>
	            <div class="col-md-2 mt-4">
	                <button type="submit" class="btn btn-primary">Filtrar</button>
	            </div>
	        </div>
	    </form>
		<table class="table table-striped table-hover">
			<thead class="table-info">
				<tr>
					<th>Contato</th>
					<th>Local</th>
					<th>Data</th>
					<th>Hora</th>
					<th>Status</th>
					<th>Ação</th>
				</tr>
			</thead>
			<tbody>
				<!-- preenche de forma dinamica -->
				<% for (Compromissos compromissox : compromissos) {	%>
						<tr>
							<td><%=compromissox.getDscontato()%></td>
							<td><%=compromissox.getDslocal()%></td>
							<td><%=compromissox.getData()%></td>
							<td><%=compromissox.getHora()%></td>
							<td><%=compromissox.getDsStatus()%></td>
							<td>
							    <!-- Botões de editar e excluir com parâmetros -->
							    <a href='./editarCompromissos.jsp?id=<%= compromissox.getId() %>' class='btn btn-outline-primary btn-sm'>Editar</a>
							    <a href="javascript:void(0);" onclick="confirmarExclusao(<%= compromissox.getId() %>)" class='btn btn-outline-danger btn-sm'>Excluir</a>
							</td>
						</tr>
				<% } %>
			</tbody>
			<script>
			    function confirmarExclusao(id) {
			        if (confirm('Tem certeza de que deseja excluir este compromisso?')) {
			            window.location.href = './recebeDadosEditarCompromisso.jsp?id=' + id + '&operacao=excluir';
			        }
			    }
			</script>
		</table>
	</div>
	<%@ include file="./footer.jsp" %>
</body>
</html>