<%-- 
    Document   : pesquisaOnibus
    Created on : 28/05/2019, 20:29:44
    Author     : tawan.reis
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fretamento.bo.Onibus"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% Onibus onibusSelecionado = new Onibus();%>

<%
    try {
        if (request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            onibusSelecionado.deletar(id);
            response.sendRedirect(request.getRequestURI());
        }
    } catch (Exception e) {
        System.out.println("erro no método deletar" + e);
    }
%>
<html>
    <% session.setAttribute("pageTitle", "Listagem de ônibus"); %>
    <%@include file="../WEB-INF/jspf/header.jspf" %>
    <%@include file="../WEB-INF/jspf/navbar.jspf" %>
    
    <body>
        <div class="text-left mb-3 text-center">
            <h2>Onibus existentes</h2>
            <a href="formularioOnibus.jsp">
                <i class="fa fa-plus"></i>
            </a>
        </div>
        <%try {%>
        <% ArrayList<Onibus> listaDeOnibus = Onibus.getListaOnibus(); %>
        <%if (listaDeOnibus != null && !listaDeOnibus.isEmpty()) { %>
        <div class="container">
            <div class="row m-auto text-center pt-2 text-secondary" style="background-color: aliceblue; height: 40px;">
                <div class="col-2">ID Onibus</div>
                <div class="col-2">ID Motorista</div>
                <div class="col-2">Númeração</div>
                <div class="col-2">Placa</div>
                <div class="col-2">Opções</div>
            </div>
            <% for (Onibus onibus : listaDeOnibus) {%>
            <div class="row m-auto text-center pt-2 text-truncate" style="height: 40px">
                <div class="col-2 mt-2">
                    <%=onibus.getId()%>
                </div>
                <div class="col-2 mt-2">
                    <%=onibus.getIdMotorista()%>
                </div>
                <div class="col-2 mt-2">
                    <%=onibus.getNumeracao()%>
                </div>
                <div class="col-2 mt-2">
                    <%=onibus.getPlaca()%>
                </div>
                <div class="col-2 mt-2">
                    <a href="formularioOnibus.jsp?id=<%= onibus.getId()%>">
                        <i style="color: gray" class="fa fa-edit"></i>
                    </a>
                    <a href="pesquisaOnibus.jsp?id=<%= onibus.getId()%>">
                        <i style="color: red" class="ml-2 fa fa-trash" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
            <%}%>
            <%} else {%>
            <h3>Não existem onibus cadastradas</h3>
            <% } %>
            <%} catch (Exception e) {%>
            <h3 style="color: red"> <%= e.getMessage()%> </h3>
            <%}%>
        </div>
    </body>
</html>
