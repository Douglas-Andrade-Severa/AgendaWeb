<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String mensagem = request.getParameter("mensagem");
    String idAlerta = request.getParameter("idAlerta");
    String display = request.getParameter("display");
%>

<div id="<%= idAlerta %>" class="erro-alert" style="display: <%= display %>;">
    <span class="fechar-alerta" onclick="fecharAlerta('<%= idAlerta %>')">X</span>
    <div><%= mensagem %></div>
</div>

<script>
    function ocultarAlerta(idAlerta) {
        var alerta = document.getElementById(idAlerta);
        alerta.style.display = "none";
    }

    setTimeout(function() {
        ocultarAlerta('<%= idAlerta %>');
    }, 3000);

    function fecharAlerta(idAlerta) {
        ocultarAlerta(idAlerta);
    }
</script>
