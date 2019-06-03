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
            int idMotorista = Integer.parseInt(request.getParameter("idMotorista"));
            int id=0;
            if (request.getParameter("cadastrar").equals("Cadastrar")) {
                onibus.incluir(idMotorista, placa, numeracao);
            }
        }

        if (request.getParameter("deletar") != null) {
           int id = Integer.parseInt(request.getParameter("deletar"));
            onibus.deletar(id);
           response.sendRedirect(request.getRequestURI());
        }

    } catch (Exception e) {
    }
%>
<html>
    <% session.setAttribute("pageTitle", "Listagem de ônibus"); %>
    <%@include file="../WEB-INF/jspf/header.jspf" %>    <body>
        <h1>Ônibus Existentes</h1>
        <a href="formularioOnibus.jsp" >Incluir Ônibus</a>
      
        <form>  
        <%try {%>
            <% ArrayList<Onibus> listaOnibus = Onibus.getListaOnibus(); %>
            <%if (listaOnibus != null && !listaOnibus.isEmpty()) { %>
        
        <table border="1">
            
            <tr>
                    <th>ID Onibus</th>
                    <th>Placa</th>
                    <th>Numeracao</th>
                    <th>Opções</th>
            </tr>
            
                <% for (Onibus p : listaOnibus) {%>

                <tr>
                        <td><%=p.getId()%></td>
                        <td><%=p.getPlaca()%></td>
                        <td><%=p.getNumeracao()%></td>
                   
                <td>
                        <a href="formularioOnibus.jsp?index=<%= p.getId()%>">Editar |</a>
                        <a href="pesquisaOnibus.jsp?deletar=<%= p.getId()%>">Deletar</a>
                    </td>
                </tr><%}%>
                <%} else {%>
                <h3>Não existem ônibus cadastrados</h3>
                <% } %>
            </table>
            <%} catch (Exception e) {%>
            <h3 style="color: red"> <%= e.getMessage()%> </h3>
            <%}%>
       </form>     
    </body>
</html>
