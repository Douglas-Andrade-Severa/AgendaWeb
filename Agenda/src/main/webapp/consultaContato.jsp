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
					<th>Id</th>
					<th>Nome</th>
					<th>Email</th>
					<th>Ações</th>
				</tr>
			</thead>
			<tbody>
				<!-- preenche de forma dinamica -->
				<%
				ContatoController contatoController = new ContatoController();
				List<Contato> contatos = contatoController.getContatos();
				for (Contato contato : contatos) {
				%>
				<tr>
					<td><%=contato.getId()%></td>
					<td><%=contato.getNome()%></td>
					<td><%=contato.getEmail()%></td>
					<td>
					    <!-- Botões de editar e excluir com parâmetros -->
					    <a href='./editarContato.jsp?id=<%= contato.getId() %>' class='btn btn-outline-primary btn-sm'>Editar</a>
					    <a href="javascript:void(0);" onclick="confirmarExclusao(<%= contato.getId() %>)" class='btn btn-outline-danger btn-sm'>Excluir</a>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
			<script>
			    function confirmarExclusao(id) {
			        if (confirm('Tem certeza de que deseja excluir este contato?')) {
			            window.location.href = './recebeDadosEditar.jsp?id=' + id + '&operacao=excluir';
			        }
			    }
			</script>
		</table>
	</div>
	<%@ include file="./footer.jsp" %>
</body>
</html>