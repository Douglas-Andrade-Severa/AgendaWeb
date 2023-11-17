<%@page import="controllers.LocalController"%>
<%@page import="models.Local"%>
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
					<th>Rua</th>
					<th>Número</th>
					<th>Bairro</th>
					<th>Cidade</th>
					<th>Estado</th>
					<th>Cep</th>
					<th>Ações</th>
				</tr>
			</thead>
			<tbody>
				<!-- preenche de forma dinamica -->
				<%
				LocalController localController = new LocalController();
				List<Local> locais = localController.getLocais();
				for (Local local : locais) {
				%>
				<tr>
					<td><%=local.getId()%></td>
					<td><%=local.getNome()%></td>
					<td><%=local.getRua()%></td>
					<td><%=local.getNumero()%></td>
					<td><%=local.getBairro()%></td>
					<td><%=local.getCidade()%></td>
					<td><%=local.getEstado()%></td>
					<td><%=local.getCep()%></td>
					<td>
					    <!-- Botões de editar e excluir com parâmetros -->
					    <a href='./editarLocal.jsp?id=<%= local.getId() %>' class='btn btn-outline-primary btn-sm'>Editar</a>
					    <a href="javascript:void(0);" onclick="confirmarExclusao(<%= local.getId() %>)" class='btn btn-outline-danger btn-sm'>Excluir</a>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
			<script>
			    function confirmarExclusao(id) {
			        if (confirm('Tem certeza de que deseja excluir este contato?')) {
			            window.location.href = './recebeDadosEditarLocal.jsp?id=' + id + '&operacao=excluir';
			        }
			    }
			</script>
		</table>
	</div>
	<%@ include file="./footer.jsp" %>
</body>
</html>