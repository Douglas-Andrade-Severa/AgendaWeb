<%@page import="models.Local"%>
<%@page import="controllers.LocalController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Local</title>
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
		<%
		int id = 0;
		String campox = "";
		campox = "id";
		if (request.getParameter(campox) != null) {
			if (request.getParameter(campox).equals("") == false) {
				id = Integer.parseInt(request.getParameter(campox).replaceAll(" ", ""));
			}
		}
		LocalController localController = new LocalController();
		Local local = localController.consultarByID(id);
		%>

		<h1 class="text-center mt-5 mb-5">Editar Local</h1>
		<form action="recebeDadosEditarLocal.jsp?" method="POST">
			<div>
				<label class="form-label">ID</label> <input class="form-control" type="text" readonly="readonly" name="id" value=<%out.print(local.getId());%>>
			</div>
	        <div class="row mb-3">
	            <div class="col">
	                <label for="nome" class="form-label">Informe nome</label>
	                <input type="text" class="form-control" placeholder="Informe nome" name="nome" id="nome" value=<%out.print(local.getNome());%>>
	                <!-- Mensagem de erro -->
	                <div class="erro-alert" id="mensagemErroNome">
	                    O nome do local deve ser informado!
	                    <span class="fechar-alerta" onclick="fecharAlerta('mensagemErroNome')">X</span>
	                </div>
	            </div>
	            <div class="col">
	                <label for="cep" class="form-label">Informe o CEP</label>
	                <input type="text" maxlength="9" onkeyup="handleZipCode(event)" class="form-control" placeholder="Informe o CEP" name="cep" id="cep" onblur="verEndereco()" value=<%out.print(local.getCep());%>>
	                <!-- Mensagem de erro -->
	                <div class="erro-alert" id="mensagemErroCep">
	                    O CEP deve ser informado!
	                    <span class="fechar-alerta" onclick="fecharAlerta('mensagemErroCep')">X</span>
	                </div>
	            </div>
	        </div>
	        <div class="row mb-3">
	            <!-- Repita a estrutura para os outros campos -->
	            <div class="col">
	                <label for="rua" class="form-label">Informe a rua</label>
	                <input type="text" class="form-control" placeholder="Informe a rua" name="rua" id="rua" readonly style="background-color: #f2f2f2; color: #888; cursor: not-allowed;" value=<%out.print(local.getRua());%>>
	                <!-- Mensagem de erro -->
	                <div class="erro-alert" id="mensagemErroRua">
	                    A rua deve ser informada!
	                    <span class="fechar-alerta" onclick="fecharAlerta('mensagemErroRua')">X</span>
	                </div>
	            </div>
	            <div class="col">
	                <label for="numero" class="form-label">Informe o número</label>
	                <input type="number" class="form-control" placeholder="Informe o número" name="numero" id="numero" value=<%out.print(local.getNumero());%>>
	                <!-- Mensagem de erro -->
	                <div class="erro-alert" id="mensagemErroNumero">
	                    O número deve ser informado!
	                    <span class="fechar-alerta" onclick="fecharAlerta('mensagemErroNumero')">X</span>
	                </div>
	            </div>
	        </div>
	        <div class="row mb-3">
	            <div class="col">
	                <label for="bairro" class="form-label">Informe o bairro</label>
	                <input type="text" class="form-control" placeholder="Informe o bairro" name="bairro" id="bairro" readonly style="background-color: #f2f2f2; color: #888; cursor: not-allowed;" value=<%out.print(local.getBairro());%>>
	                <!-- Mensagem de erro -->
	                <div class="erro-alert" id="mensagemErroBairro">
	                    O bairro deve ser informado!
	                    <span class="fechar-alerta" onclick="fecharAlerta('mensagemErroBairro')">X</span>
	                </div>
	            </div>
	            <div class="col">
	                <label for="cidade" class="form-label">Informe a cidade</label>
	                <input type="text" class="form-control" placeholder="Informe a cidade" name="cidade" id="cidade" readonly style="background-color: #f2f2f2; color: #888; cursor: not-allowed;" value=<%out.print(local.getCidade());%>>
	                <!-- Mensagem de erro -->
	                <div class="erro-alert" id="mensagemErroCidade">
	                    A cidade deve ser informada!
	                    <span class="fechar-alerta" onclick="fecharAlerta('mensagemErroCidade')">X</span>
	                </div>
	            </div>
	            <div class="col">
	                <label for="estado" class="form-label">Informe o estado</label>
	                <input type="text" class="form-control" placeholder="Informe o estado" name="estado" id="estado" readonly style="background-color: #f2f2f2; color: #888; cursor: not-allowed;" value=<%out.print(local.getEstado());%>>
	                <!-- Mensagem de erro -->
	                <div class="erro-alert" id="mensagemErroEstado">
	                    O estado deve ser informado!
	                    <span class="fechar-alerta" onclick="fecharAlerta('mensagemErroEstado')">X</span>
	                </div>
	            </div>
	        </div>
	        <div class="mt-5 d-flex justify-content-around">
	            <button onclick="validaDados()" class="btn btn-outline-primary">Enviar</button>
	            <input type="reset" class="btn btn-outline-danger" onclick="limparCampos()" />
	        </div>
	    </form>
	    <%@ include file="./footer.jsp" %>
	</div>
<script>
	async function verEndereco() {
	    var inputCep = document.getElementById("cep").value;
	    var cepWithoutDash = inputCep.replace("-", ""); // Remove o traço do CEP
	
	    var url = "http://viacep.com.br/ws/" + cepWithoutDash + "/json/";
	
	    fetch(url)
	        .then(response => response.json())
	        .then(data => {
	            console.log(data);
	            document.getElementById("rua").value = data.logradouro;
	            document.getElementById("bairro").value = data.bairro;
	            document.getElementById("cidade").value = data.localidade;
	            document.getElementById("estado").value = data.uf;
	        })
	        .catch(error => {
	            console.error('Erro:', error);
	        });
	}


	const handleZipCode = (event) => {
		let input = event.target
	  	input.value = zipCodeMask(input.value)
	}
	const zipCodeMask = (value) => {
	  	if (!value) return ""
	  	value = value.replace(/\D/g,'')
	  	value = value.replace(/(\d{5})(\d)/,'$1-$2')
	  	return value
	}
    function validaDados() {
        event.preventDefault();
        var inputNome = document.getElementById("nome");
        var inputRua = document.getElementById("rua");
        var inputNumero = document.getElementById("numero");
        var inputCep = document.getElementById("cep");
        var inputBairro = document.getElementById("bairro");
        var inputCidade = document.getElementById("cidade");
        var inputEstado = document.getElementById("estado");

        var mensagemErroNome = document.getElementById("mensagemErroNome");
        var mensagemErroRua = document.getElementById("mensagemErroRua");
        var mensagemErroNumero = document.getElementById("mensagemErroNumero");
        var mensagemErroCep = document.getElementById("mensagemErroCep");
        var mensagemErroBairro = document.getElementById("mensagemErroBairro");
        var mensagemErroCidade = document.getElementById("mensagemErroCidade");
        var mensagemErroEstado = document.getElementById("mensagemErroEstado");

        if (inputNome.value.trim() === '') {
            mensagemErroNome.style.display = "block";
            inputNome.focus();
            return;
        } else {
            mensagemErroNome.style.display = "none";
        }

        if (inputRua.value.trim() === '') {
            mensagemErroRua.style.display = "block";
            inputRua.focus();
            return;
        } else {
            mensagemErroRua.style.display = "none";
        }

        if (inputNumero.value.trim() === '') {
            mensagemErroNumero.style.display = "block";
            inputNumero.focus();
            return;
        } else {
            mensagemErroNumero.style.display = "none";
        }

        if (inputCep.value.trim() === '') {
            mensagemErroCep.style.display = "block";
            inputCep.focus();
            return;
        } else {
            mensagemErroCep.style.display = "none";
        }

        if (inputBairro.value.trim() === '') {
            mensagemErroBairro.style.display = "block";
            inputBairro.focus();
            return;
        } else {
            mensagemErroBairro.style.display = "none";
        }
        
        if (inputCidade.value.trim() === '') {
            mensagemErroCidade.style.display = "block";
            inputCidade.focus();
            return;
        } else {
            mensagemErroCidade.style.display = "none";
        }
        
        if (inputEstado.value.trim() === '') {
            mensagemErroEstado.style.display = "block";
            inputEstado.focus();
            return;
        } else {
            mensagemErroEstado.style.display = "none";
        }       

        // Se todos os campos estiverem preenchidos, envia o formulário
        document.getElementsByTagName("form")[0].submit();
    }

    function limparCampos() {
        document.getElementById("nome").value = "";
        document.getElementById("rua").value = "";
        document.getElementById("numero").value = "";
        document.getElementById("cep").value = "";
        document.getElementById("bairro").value = "";
        document.getElementById("cidade").value = "";
        document.getElementById("estado").value = "";

        var mensagensErro = document.querySelectorAll(".erro-alert");
        mensagensErro.forEach(function(elemento) {
            elemento.style.display = "none";
        });
    }

    function fecharAlerta(id) {
        document.getElementById(id).style.display = "none";
    }
</script>
</body>
</html>