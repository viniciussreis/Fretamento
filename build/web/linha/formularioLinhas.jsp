<%-- 
    Document   : formularioLinhas
    Created on : 28/05/2019, 00:32:04
    Author     : Vinicius Reis
--%>

<%@page import="br.com.fretamento.bo.Linha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Linha linha = new Linha();
    if(request.getParameter("cadastrar") != null){
       int idOnibus =  Integer.parseInt(request.getParameter("idOnibus"));
       int numero = Integer.parseInt(request.getParameter("numeroLinha"));
       String origem = request.getParameter("origem");
       String destino = request.getParameter("destino");
       
       linha.incluir(numero, idOnibus, origem, destino);
       
    }
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Formulário Adicionar Linha</h1>
        <hr>
        <form>
            <label>Número da Linha</label>
            <input type="text" name="numeroLinha" id="numeroLinha"/>
            <label>Onibus</label>
            <input type="text" name="idOnibus" id="idOnibus"/>
            <label>Origem</label>
            <input type="text" name="origem" id="origem"/>
            <label>Destino</label>
            <input type="text" name="destino" id="destido"/>
            <input type="submit" value="Cadastrar" name="cadastrar"/>
        </form>
    </body>
</html>
