<%@page import="models.Compromissos"%>
<%@page import="java.awt.Component"%>
<%@page import="controllers.CompromissoController"%>
<%@page import="controllers.ContatoController"%>
<%@page import="models.Contato"%>
<%@page import="utils.Conexao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<%
				CompromissoController compromissoController = new CompromissoController();
				List<Compromissos> compromissos = compromissoController.getCompromissos();
				for (Compromissos compromisso : compromissos) {
				%>
				<tr>
					<td><%=compromisso.getDscontato()%></td>
					<td><%=compromisso.getDslocal()%></td>
					<td><%=compromisso.getData()%></td>
					<td><%=compromisso.getHora()%></td>
					<td><%=compromisso.getDsStatus()%></td>
					<td>
					    <!-- Botões de editar e excluir com parâmetros -->
					    <a href='./editarCompromissos.jsp?id=<%= compromisso.getId() %>' class='btn btn-outline-primary btn-sm'>Editar</a>
					    <a href="javascript:void(0);" onclick="confirmarExclusao(<%= compromisso.getId() %>)" class='btn btn-outline-danger btn-sm'>Excluir</a>
					</td>
				</tr>
				<%
				}
				%>
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