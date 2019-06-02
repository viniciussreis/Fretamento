<%-- 
    Document   : pesquisaOnibus
    Created on : 28/05/2019, 20:29:44
    Author     : tawan.reis
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fretamento.bo.Onibus"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    try {
        Onibus onibus = new Onibus();
        if (request.getParameter("cadastrar") != null) {
            String placa = request.getParameter("placa");;
            String numeracao = request.getParameter("numeracao");;
            int id=0;
            if (request.getParameter("cadastrar").equals("Cadastrar")) {
            //    onibus.incluir(placa, numeracao);
            }
        }

        if (request.getParameter("deletar") != null) {
           int id = Integer.parseInt(request.getParameter("deletar"));
            motorista.deletar(id);
           response.sendRedirect(request.getRequestURI());
        }

    } catch (Exception e) {
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
