<%-- 
    Document   : formularioMotorista
    Created on : 28/05/2019, 20:29:31
    Author     : tawan.reis
--%>

<%@page import="br.com.fretamento.bo.Motorista"%>
<%
    Motorista motorista = new Motorista();
    int id =0;
    String nome = "";
    String cnh = "";
    String registroGeral = "";
    String endereco = "";
    
    String valorBotao = "Cadastrar";
    
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% session.setAttribute("pageTitle", "Form motorista"); %>
    <%@include file="../WEB-INF/jspf/header.jspf" %>
    <body>
        <h1>Formulário para adição de Motorista</h1>
        <form action="pesquisaMotoristas.jsp">
            <label>Nome</label>
            <input type="text" name="nome" id="nome" value="<%=nome%>"/>
            <label>CNH</label>
            <input type="text" name="cnh" id="cnh" value="<%=cnh%>"/>
            <label>RG</label>
            <input type="text" name="registroGeral" id="registroGeral" value="<%=registroGeral%>"/>
            <label>Endereço</label>
            <input type="text" name="endereco" id="endereco" value="<%=endereco%>"/>
            
            <input type="submit" value="<%= valorBotao%>" name="cadastrar"/>

            <% if (valorBotao.equals("Salvar")) {%>
            <input type="hidden" name="index" value="<%= id%>">
            <% }%>
        </form>
    </body>
    <body>
        <h1>Formulário <%= request.getParameter("id") == null ? "Adicionar" : "Editar"%> Motorista</h1>
        <hr>
        <form>
            <label>Número da Linha</label>
            <input type="text" name="numeroLinha" id="numeroLinha" value="<%= linha.getNumero()%>"/>

            <label>Onibus</label>
            <select name="idOnibus">
                <option></option>
                <% for (Onibus onibus : listaDeOnibus) {%>
                <option value="<%= onibus.getId()%>" <%= linha.getIdOnibus() == onibus.getId() ? "selected" : ""%>><%= onibus.getNumeracao()%></option>
                <% }%>
            </select>

            <label>Origem</label>
            <input type="text" name="origem" id="origem" value="<%= linha.getOrigem()%>"/>
            <label>Destino</label>
            <input type="text" name="destino" id="destido" value="<%= linha.getDestino()%>"/>
            <%if (request.getParameter("id") == null) {%>
            <input type="submit" value="Cadastrar" name="cadastrar"/>
            <%} else {%>
            <input type="submit" value="Alterar" name="alterar" />
            <%}%>
            <input type="hidden" name="id" value="<%= id%>"/>
        </form>
    </body>
</html>
