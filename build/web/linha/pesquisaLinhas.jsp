<%-- 
    Document   : listaLinhas
    Created on : 28/05/2019, 00:31:50
    Author     : Vinicius Reis
--%>

<%@page import="br.com.fretamento.bo.Linha"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Linha linhaSelecionada = new Linha();%>

<%
    try {
        if (request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            linhaSelecionada.deletar(id);
            response.sendRedirect(request.getRequestURI());
        }
    } catch (Exception e) {
        System.out.println("erro no método deletar" + e);
    }
%>

<!DOCTYPE html>
<html>
    <% session.setAttribute("pageTitle", "Listagem de linhas"); %>
    <%@include file="../WEB-INF/jspf/header.jspf" %>
    <%@include file="../WEB-INF/jspf/navbar.jspf" %>
    <body>
        <div class="text-left mb-3 text-center">
            <h2>Linhas existentes</h2>
            <a href="formularioLinhas.jsp">
                <i class="fa fa-plus"></i>
            </a>
        </div>
        <%try {%>
        <% ArrayList<Linha> listaDeLinhas = Linha.getListaLinhas(); %>
        <%if (listaDeLinhas != null && !listaDeLinhas.isEmpty()) { %>
        <div class="container">
            <div class="row m-auto text-center pt-2 text-secondary" style="background-color: aliceblue; height: 40px;">
                <div class="col-2">ID Linha</div>
                <div class="col-2">ID Onibus</div>
                <div class="col-2">Número linha</div>
                <div class="col-2">Origem</div>
                <div class="col-2">Destino</div>
                <div class="col-2">Opções</div>
            </div>
            <% for (Linha linha : listaDeLinhas) {%>
            <div class="row m-auto text-center pt-2 text-truncate" style="height: 40px">
                <div class="col-2 mt-2">
                    <%=linha.getId()%>
                </div>
                <div class="col-2 mt-2">
                    <%=linha.getIdOnibus()%>
                </div>
                <div class="col-2 mt-2">
                    <%=linha.getNumero()%>
                </div>
                <div class="col-2 mt-2">
                    <%=linha.getOrigem()%>
                </div>
                <div class="col-2 mt-2">
                    <%=linha.getDestino()%>
                </div>
                <div class="col-2 mt-2">
                    <a href="formularioLinhas.jsp?id=<%= linha.getId()%>">
                        <i style="color: gray" class="fa fa-edit"></i>
                    </a>
                    <a href="pesquisaLinhas.jsp?id=<%= linha.getId()%>">
                        <i style="color: red" class="ml-2 fa fa-trash" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
            <%}%>
            <%} else {%>
            <h3>Não existem linhas cadastradas</h3>
            <% } %>
            <%} catch (Exception e) {%>
            <h3 style="color: red"> <%= e.getMessage()%> </h3>
            <%}%>
        </div>
    </body>
</html>
