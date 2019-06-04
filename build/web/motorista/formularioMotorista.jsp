<%-- 
    Document   : formularioMotorista
    Created on : 28/05/2019, 20:29:31
    Author     : tawan.reis
--%>

<%@page import="br.com.fretamento.bo.Motorista"%>
<%
    try {
        int id = 0;
         
        Motorista motorista = new Motorista();
        
        if (request.getParameter("cadastrar") != null) {
            String nome = request.getParameter("nome");
            String rg = request.getParameter("registroGeral");
            String cnh = request.getParameter("cnh");
            String endereco = request.getParameter("endereco");

            Motorista.incluir(nome, cnh, rg, endereco);
            response.sendRedirect("pesquisaMotoristas.jsp");
        }

        if (request.getParameter("id") != null) {
            id = Integer.parseInt(request.getParameter("id"));
            motorista = Motorista.getMotoristaById(id);
        }

        if (request.getParameter("alterar") != null) {
            
            motorista.setNome(request.getParameter("nome"));
            motorista.setEndereco(request.getParameter("endereco"));
            motorista.setCnh(request.getParameter("cnh"));
            motorista.setRegistroGeral(request.getParameter("registroGeral"));
            
            Motorista.atualizar(motorista, id);

            response.sendRedirect("pesquisaMotoristas.jsp");
        }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% session.setAttribute("pageTitle", "Form motorista");%>
    <%@include file="../WEB-INF/jspf/header.jspf" %>
    <body>
        <h1>Formulário para adição de Motorista</h1>
        <form>
            <label>Nome</label>
            <input type="text" name="nome" id="nome" value="<%= motorista.getNome()%>"/>
            <label>CNH</label>
            <input type="text" name="cnh" id="cnh" value="<%= motorista.getCnh()%>"/>
            <label>RG</label>
            <input type="text" name="registroGeral" id="registroGeral" value="<%= motorista.getRegistroGeral()%>"/>
            <label>Endereço</label>
            <input type="text" name="endereco" id="endereco" value="<%= motorista.getEndereco()%>"/>

            <%if (request.getParameter("id") == null) {%>
                <input type="submit" value="Cadastrar" name="cadastrar"/>
            <%} else {%>
                <input type="submit" value="Alterar" name="alterar" />
            <%}%>
                <input type="hidden" name="id" value="<%= id%>"/>
        </form>
        <%} catch (Exception e) {%>
        <%= e.getMessage()%>
        <%}%>
    </body>
</html>
