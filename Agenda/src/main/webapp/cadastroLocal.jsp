<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Contatos</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<style>
.erro-alert {
	background-color: #ff5050;
	color: white;
	padding: 10px;
	border-radius: 5px;
	margin-top: 5px;
	display: none;
	position: relative;
}

.erro-alert .fechar-alerta {
	position: absolute;
	top: 5px;
	right: 10px;
	color: white;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container">
		<%@ include file="./menu.jsp"%>
		<h1 class="text-center mt-5 mb-5">Cadastrar Local</h1>
		<form action="recebeDados.jsp?" method="POST">
			<div class="input-group input-group-sm mb-3">
			  	<span class="input-group-text" id="inputGroup-sizing-sm">Nome</span>
				<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" name="nome" id="nome" required>
				<jsp:include page="mensagemErro.jsp">
					<jsp:param name="mensagem" value="O Nome deve ser informado!" />
					<jsp:param name="idAlerta" value="mensagemErroEmail" />
					<jsp:param name="display"  value="none" />
				</jsp:include>
			</div>
			<div class="input-group input-group-sm mb-3">
			  	<span class="input-group-text" id="inputGroup-sizing-sm">Rua</span>
				<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" name="rua" id="rua" required>
				<jsp:include page="mensagemErro.jsp">
					<jsp:param name="mensagem" value="A rua deve ser informado!" />
					<jsp:param name="idAlerta" value="mensagemErroEmail" />
					<jsp:param name="display"  value="none" />
				</jsp:include>
			</div>
			<div class="mt-5 d-flex justify-content-around">
			    <button onclick="validaDados()" class="btn btn-outline-primary">Enviar</button>
			    <input type="reset" class="btn btn-outline-danger" onclick="limparCampos()" />
			</div>
		</form>
		<%@ include file="./footer.jsp" %>
	</div>
	<script>
    function validaDados() {
        event.preventDefault();
        var inputNome = document.getElementById("nome");
        var inputEmail = document.getElementById("email");
        var mensagemErroNome = document.getElementById("mensagemErroNome");
        var mensagemErroEmail = document.getElementById("mensagemErroEmail");

        if (inputNome.value == '') {
            mensagemErroNome.style.display = "block";
            inputNome.focus();
            return;
        }
        if (inputEmail.value == '') {
            mensagemErroEmail.style.display = "block";
            inputEmail.focus();
            return;
        }
        // Se tudo estiver preenchido, envia o formulário
        document.getElementsByTagName("form")[0].submit();
    }
    function limparCampos() {
        document.getElementById("nome").value = ""; // Limpa o campo de nome
        document.getElementById("email").value = ""; // Limpa o campo de e-mail

        // Esconder os alertas de erro, caso eles estejam visíveis
        document.getElementById("mensagemErroNome").style.display = "none";
        document.getElementById("mensagemErroEmail").style.display = "none";
    }
</script>
</body>
</html>
