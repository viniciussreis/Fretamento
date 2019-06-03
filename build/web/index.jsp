<%-- 
    Document   : index
    Created on : 27/05/2019, 23:05:09
    Author     : Vinicius Reis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% session.setAttribute("pageTitle", "Home"); %>
    <%@include file="../WEB-INF/jspf/header.jspf" %>
    <body>
        <h2>Projeto POO - Fretamento</h2>
        <ul>
            <li><a href="linha/pesquisaLinhas.jsp">Linha</a></li>
            <li><a href="motorista/pesquisaMotoristas.jsp">Motorista</a></li>
            <li><a href="onibus/pesquisaOnibus.jsp">Onibus</a></li>
            <li><a href="passageiro/pesquisaPassageiros.jsp">Passageiros</a></li>
        </ul>
    </body>
</html>
