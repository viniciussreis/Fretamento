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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incluir Motorista</title>
    </head>
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
</html>
