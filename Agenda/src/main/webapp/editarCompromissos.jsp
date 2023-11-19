<%@page import="controllers.StatusController"%>
<%@page import="models.Status"%>
<%@page import="models.Compromissos"%>
<%@page import="controllers.CompromissoController"%>
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
    <title>Editar compromissos</title>
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
		<%
		int id = 0;
		String campox = "";
		campox = "id";
		if (request.getParameter(campox) != null) {
			if (request.getParameter(campox).equals("") == false) {
				id = Integer.parseInt(request.getParameter(campox).replaceAll(" ", ""));
			}
		}
		CompromissoController compromissoController = new CompromissoController();
		Compromissos compromisso = compromissoController.consultarByID(id);
		%>
		<h1 class="text-center mt-5 mb-5">Editar compromissos</h1>
		<form action="recebeDadosEditarCompromisso.jsp?" method="POST">
		    <div class="container mt-5">
		        <div class="row">	            
		            <div class="col-md-6">
		                <h4>ID</h4>
		                <div>
		                    <input type="text" class="form-control" readonly="readonly" name="id" id="id" value=<%out.print(compromisso.getId());%>>
		                </div>
		            </div>
		            <div class="col-md-6">
		                <h4>Selecione o status</h4>
		                <div class="input-group date" id="datepicker" data-target-input="nearest">
			                <select class="form-select" id="status" name="status">
							    <%
							    StatusController statusController = new StatusController();
							    List<Status> statusx = statusController.getStatus();
							    int statusId = compromisso.getStatus();
							    for (Status status : statusx) {
							    %>
							        <option value='<%= status.getId()%>' <%= status.getId() == statusId ? "selected" : "" %>><%= status.getNome() %></option>
							    <%
							    }
							    %>
							</select>
		            	</div>
		            </div>
		        </div>
		    </div>
		    <div class="container">
		        <div class="row">	            
		            <div class="container mt-5">
				        <div class="row">	            
				            <div class="col-md-6"> 
			                	<h4>Data</h4>
			                	<input type="date" class="form-control" id="data" name="data" value=<%out.print(compromisso.getData());%>>
			            	</div>
			            	<div class="col-md-6">
			                	<h4>Horário</h4>
			                	<input type="time" class="form-control" id="hora" name="hora" value=<%out.print(compromisso.getHora());%>>
			            	</div>
				        </div>
				    </div>
			    </div>
		    </div>
		    <div class="container mt-1">
		        <div class="row">	
					<div class="col-md-6">
					    <div class="erro-alert" id="mensagemErroData">
			                A data deve ser informado!
			                <span class="fechar-alerta" onclick="fecharAlerta('mensagemErroData')">X</span>
			            </div>
			    	</div>
			    	<div class="col-md-6">
			    		<div class="erro-alert" id="mensagemErroHora">
			            	O horário deve ser informado!
			                    <span class="fechar-alerta" onclick="fecharAlerta('mensagemErroHora')">X</span>
			            </div>
			    	</div>
			    </div>
			</div>
		    <div class="container mt-5">
		        <div class="row">	
					<div class="col-md-6">
		                <h4>Selecione o contato</h4>
		                <div class="input-group date" id="datepicker" data-target-input="nearest">
			                <select class="form-select" id="contato" name="contato">
							    <%
							    ContatoController contatoController = new ContatoController();
							    List<Contato> contatos = contatoController.getContatos();
							    int contatoId = compromisso.getContato();
							    for (Contato contato : contatos) {
							        %>
							        <option value='<%= contato.getId()%>' <%= contato.getId() == contatoId ? "selected" : "" %>><%= contato.getNome() %></option>
							    <%
							    }
							    %>
							</select>
		            	</div>				        
		            </div>
		            <div class="col-md-6">
		                <h4>Selecione o local</h4>
		                <div class="input-group date" id="datepicker" data-target-input="nearest">
			                <select class="form-select" id="local" name="local">
			                    <%
			                    LocalController localController = new LocalController();
			                    List<Local> locais = localController.getLocais();
			                    int localId = compromisso.getLocal();
			                    for (Local local : locais) {
			                    %>
			                        <option value='<%= local.getId() %>'  <%= local.getId() == localId ? "selected" : "" %>><%= local.getNome() %></option>
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
		<%@ include file="./footer.jsp" %>
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

            var mensagemErroData 	= document.getElementById("mensagemErroData");
            var mensagemErroHora 	= document.getElementById("mensagemErroHora");

			
            if (inputData.value.trim() == '') {
                mensagemErroData.style.display = "block";
                inputData.focus();
                return;
            } else {
                mensagemErroData.style.display = "none";
            }
            
            if (inputHora.value.trim() == '') {
                mensagemErroHora.style.display = "block";
                inputHora.focus();
                return;
            } else {
                mensagemErroHora.style.display = "none";
            }
            
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