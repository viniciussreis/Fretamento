<%-- 
    Document   : listaLinhas
    Created on : 28/05/2019, 00:31:50
    Author     : Vinicius Reis
--%>

<%@page import="br.com.fretamento.bo.Linha"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Java DB</h1>
        <h2>Linhas existentes</h2>
        <%try{%>
        <% ArrayList<Linha> listaDeLinhas = Linha.getListaLinhas(); %>
        <%if(listaDeLinhas != null && !listaDeLinhas.isEmpty()){ %>
        <table border="1">
            <tr>
                <th>ID Linha</th>
                <th>ID Onibus</th>
                <th>Numero da Linha</th>
                <th>Quantidade</th>
                <th>Valor</th>
            </tr>
            <% for(Linha linha: listaDeLinhas){%>
            <tr>
                <td><%=linha.getId()%></td>
                <td><%=linha.getIdOnibus()%></td>
                <td><%=linha.getNumero()%></td>
                <td><%=linha.getOrigem()%></td>
                <td><%=linha.getDestino()%></td>
            </tr>
            <%}%>
        <%}else{%>
        <h3>Não existem linhas cadastradas</h3>
        <% } %>
        </table>
        <%}catch(Exception e){%>
        <h3 style="color: red"> <%= e.getMessage() %> </h3>
        <%}%>
    </body>
</html>
