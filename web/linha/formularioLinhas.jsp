<%-- 
    Document   : formularioLinhas
    Created on : 28/05/2019, 00:32:04
    Author     : Vinicius Reis
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fretamento.bo.Onibus"%>
<%@page import="br.com.fretamento.bo.Linha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    int id = 0;
    ArrayList<Onibus> listaDeOnibus = Onibus.getListaOnibus();
    
    Linha linha = new Linha();
    if(request.getParameter("cadastrar") != null){
       int idOnibus =  Integer.parseInt(request.getParameter("idOnibus"));
       int numero = Integer.parseInt(request.getParameter("numeroLinha"));
       String origem = request.getParameter("origem");
       String destino = request.getParameter("destino");
       
       linha.incluir(numero, idOnibus, origem, destino);
       response.sendRedirect("pesquisaLinhas.jsp");
    }
%>

<%
    if(request.getParameter("id") != null){
       id =  Integer.parseInt(request.getParameter("id"));
       linha = linha.getLinhaById(id);
    }
%>

<%
    if (request.getParameter("alterar") != null) {
        linha.setIdOnibus(Integer.parseInt(request.getParameter("idOnibus")));
        linha.setNumero(Integer.parseInt(request.getParameter("numeroLinha")));
        linha.setOrigem(request.getParameter("origem"));
        linha.setDestino(request.getParameter("destino"));
        
        linha.atualizar(linha, id);
        
        response.sendRedirect("pesquisaLinhas.jsp");
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
            <input type="text" name="numeroLinha" id="numeroLinha" value="<%= linha.getNumero() %>"/>
            
            <label>Onibus</label>
            <select name="idLinha">
                <option></option>
                <% for (Onibus onibus : listaDeOnibus) {%>
                    <option value="<%= onibus.getId() %>"><%= onibus.getNumeracao()%></option>          
                <% }%>
            </select>
            
            <label>Origem</label>
            <input type="text" name="origem" id="origem" value="<%= linha.getOrigem() %>"/>
            <label>Destino</label>
            <input type="text" name="destino" id="destido" value="<%= linha.getDestino() %>"/>
            <%if (request.getParameter("id") == null) {%>
            <input type="submit" value="Cadastrar" name="cadastrar"/>
            <%}else{%>
            <input type="submit" value="Alterar" name="alterar" />
            <%}%>
            <input type="hidden" name="id" value="<%= id%>"/>
        </form>
    </body>
</html>
