<%-- 
    Document   : formularioOnibus
    Created on : 28/05/2019, 20:29:52
    Author     : tawan.reis
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fretamento.bo.Motorista"%>
<%@page import="br.com.fretamento.bo.Onibus"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    try {
        int id = 0;
        ArrayList<Motorista> listaDeMotoristas = Motorista.getListaMotoristas();

        Onibus onibus = new Onibus();
        if (request.getParameter("cadastrar") != null) {
            int idMotorista = Integer.parseInt(request.getParameter("idMotorista"));
            String placa = request.getParameter("placa");
            String numeracao = request.getParameter("numeracao");

            Onibus.incluir(idMotorista, placa, numeracao);
            response.sendRedirect("pesquisaOnibus.jsp");
        }

        if (request.getParameter("id") != null) {
            id = Integer.parseInt(request.getParameter("id"));
            onibus = onibus.getOnibusById(id);
        }

        if (request.getParameter("alterar") != null) {
            onibus.setIdMotorista(Integer.parseInt(request.getParameter("idMotorista")));
            onibus.setNumeracao(request.getParameter("numeracao"));
            onibus.setPlaca(request.getParameter("placa"));
            
            Onibus.atualizar(onibus, id);
           
            response.sendRedirect("pesquisaOnibus.jsp");
        }  
%>

<html>
    <% session.setAttribute("pageTitle", "Form ônibus"); %>
    <%@include file="../WEB-INF/jspf/header.jspf" %>
    <%@include file="../WEB-INF/jspf/navbar.jspf" %>
    <body>
        <h1>Formulário <%= request.getParameter("id") == null ? "Adicionar" : "Editar"%> Linha</h1>
        <hr>
        <form>
            <label>Placa</label> 
            <input type="text" name="placa" id="placa" value="<%= onibus.getPlaca()%>"/>

            <label>Motorista</label>
            <select name="idMotorista">
                <option></option>
                <% for (Motorista motorista : listaDeMotoristas) {%>
                <option value="<%= motorista.getId()%>" <%= onibus.getId() == motorista.getId() ? "selected" : ""%>><%= motorista.getNome() %></option>
                <% }%>
            </select>
            <label>Numeracao</label>
            <input type="text" name="numeracao" id="numeracao" value="<%= onibus.getNumeracao()%>"/>
            <%if (request.getParameter("id") == null) {%>
                <input type="submit" value="Cadastrar" name="cadastrar"/>
            <%} else {%>
                <input type="submit" value="Alterar" name="alterar" />
            <%}%>
                <input type="hidden" name="id" value="<%= id%>"/>
        </form>
    </body>
</html>
<%
} catch (Exception e) {%>
    <h1><%= e.getMessage()%></h1>
<%}
%>
