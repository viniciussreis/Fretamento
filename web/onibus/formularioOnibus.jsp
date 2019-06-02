<%-- 
    Document   : formularioOnibus
    Created on : 28/05/2019, 20:29:52
    Author     : tawan.reis
--%>

<%@page import="br.com.fretamento.bo.Onibus"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Onibus onibus = new Onibus();
    int id =0;
    int idMotorista =0;
    String placa = "";
    String numeracao = "";
    
    String valorBotao = "Cadastrar";
    
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incluir Ônibus</title>
    </head>
    <body>
        <h1>Formulário para adição de Ônibus</h1>
        <form action="pesquisaOnibus.jsp"> 
            <label>Placa</label> 
            <input type="text" name="placa" id="placa" value="<%=placa%>" />
            <label>Numeracao</label> 
            <input type="text" name="numeracao" id="numeracao" value="<%=numeracao%>" />
            
             <input type="submit" value="<%= valorBotao%>" name="cadastrar"/>
                 <% if (valorBotao.equals("Salvar")) {%>
            <input type="hidden" name="index" value="<%= id%>">
            <% }%>
         </form>
    </body>
</html>
