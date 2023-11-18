<%@page import="controllers.ContatoController"%>
<%@page import="models.Contato"%>
<%@page import="java.util.List"%>
<%@ page import="controllers.LocalController" %>
<%@ page import="models.Local" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro compromissos</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/css/tempusdominus-bootstrap-4.min.css">
    <style>
        .form-select {
            border: 2px solid #ccc;
            border-radius: 5px;
            padding: 8px;
            font-size: 16px;
            width: 100%; /* Largura total */
        }
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
		<h1 class="text-center mt-5 mb-5">Cadastrar compromissos</h1>
			<form action="recebeDadosCompromisso.jsp?" method="POST">
		    <div class="container mt-5">
		        <div class="row">	            
		            <div class="col-md-6">
		                <h4>Data</h4>
		                <div class="input-group date" id="datepicker" data-target-input="nearest">
		                    <input type="text" class="form-control datetimepicker-input" data-target="#datepicker" placeholder="Selecione a data" name="data" onkeypress="return isNumberKey(event)"/>
		                    <div class="input-group-append" data-target="#datepicker" data-toggle="datetimepicker">
		                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-6">
		                <h4>Horário</h4>
		                <div class="input-group date" id="timepicker" data-target-input="nearest">
		                    <input type="text" class="form-control datetimepicker-input" data-target="#timepicker" placeholder="Selecione a hora" name="hora" onkeypress="return isNumberKey(event)"/>
		                    <div class="input-group-append" data-target="#timepicker" data-toggle="datetimepicker">
		                        <div class="input-group-text"><i class="fa fa-clock-o"></i></div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    <div class="container mt-5">
		        <div class="row">	
					<div class="col-md-6">
		                <h4>Selecione o contato</h4>
		                <div class="input-group date" id="datepicker" data-target-input="nearest">
			                <select class="form-select " id="contato" name="contato">
			                    <%
			                    ContatoController contatoController = new ContatoController();
			    				List<Contato> contatos = contatoController.getContatos();
			                    for (Contato contato : contatos) {
			                    %>
			                        <option value='<%= contato.getId() %>'><%= contato.getNome() %></option>
			                    <%
			                    }
			                    %>
			                </select>
		            	</div>
				        <div class="erro-alert" id="mensagemErroContato">
		                    O Contato deve ser informado!
		                    <span class="fechar-alerta" onclick="fecharAlerta('mensagemErroContato')">X</span>
		                </div>
		            </div>
		            <div class="col-md-6">
		                <h4>Selecione o local</h4>
		                <div class="input-group date" id="datepicker" data-target-input="nearest">
			                <select class="form-select" id="local" name="local">
			                    <%
			                    LocalController localController = new LocalController();
			                    List<Local> locais = localController.getLocais();
			                    for (Local local : locais) {
			                    %>
			                        <option value='<%= local.getId() %>'><%= local.getNome() %></option>
			                    <%
			                    }
			                    %>
			                </select>
		            	</div>
		            	<div class="erro-alert" id="mensagemErroLocal">
		                    O Local deve ser informado!
		                    <span class="fechar-alerta" onclick="fecharAlerta('mensagemErroLocal')">X</span>
		                </div>
		            </div>
				</div>
		    </div>
		    <div class="mt-5 d-flex justify-content-around">
	            <button onclick="validaDados()" class="btn btn-outline-primary">Enviar</button>
	            <input type="reset" class="btn btn-outline-danger" onclick="limparCampos()" />
	        </div>
		</form>
	</div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/js/tempusdominus-bootstrap-4.min.js"></script>
    <script>
        $(function () {
            $('#datepicker').datetimepicker({
                format: 'DD/MM/YYYY',
                icons: {
                    time: 'fa fa-clock-o',
                    date: 'fa fa-calendar',
                    up: 'fa fa-arrow-up',
                    down: 'fa fa-arrow-down',
                    previous: 'fa fa-chevron-left',
                    next: 'fa fa-chevron-right',
                    today: 'fa fa-calendar-check-o',
                    clear: 'fa fa-trash',
                    close: 'fa fa-times'
                }
            });

            $('#timepicker').datetimepicker({
                format: 'HH:mm',
                icons: {
                    time: 'fa fa-clock-o',
                    date: 'fa fa-calendar',
                    up: 'fa fa-arrow-up',
                    down: 'fa fa-arrow-down',
                    previous: 'fa fa-chevron-left',
                    next: 'fa fa-chevron-right',
                    today: 'fa fa-calendar-check-o',
                    clear: 'fa fa-trash',
                    close: 'fa fa-times'
                }
            });
        });
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
        function validaDados() {
            event.preventDefault();
            var inputData    = document.getElementById("data");
            var inputHora    = document.getElementById("hora");
            var inputContato = document.getElementById("contato");
            var inputLocal   = document.getElementById("local");

            var mensagemErroData 	= document.getElementById("mensagemErroData");
            var mensagemErroHora 	= document.getElementById("mensagemErroHora");
            var mensagemErroContato = document.getElementById("mensagemErroContato");
            var mensagemErroLocal   = document.getElementById("mensagemErroLocal");
			
            if (inputContato.value.trim() === '') {
                mensagemErroContato.style.display = "block";
                inputContato.focus();
                return;
            } else {
                mensagemErroContato.style.display = "none";
            }
            
            if (inputLocal.value.trim() === '') {
                mensagemErroLocal.style.display = "block";
                inputLocal.focus();
                return;
            } else {
                mensagemErroLocal.style.display = "none";
            }
            // Se todos os campos estiverem preenchidos, envia o formulário
            document.getElementsByTagName("form")[0].submit();
        }

        function limparCampos() {
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
