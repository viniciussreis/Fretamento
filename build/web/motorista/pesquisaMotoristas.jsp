<%-- 
    Document   : pesquisaMotoristas
    Created on : 28/05/2019, 20:29:20
    Author     : tawan.reis
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fretamento.bo.Motorista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    try {
        Motorista motorista = new Motorista();
        if (request.getParameter("cadastrar") != null) {
            String nome = request.getParameter("nome");;
            String cnh = request.getParameter("cnh");;
            String registroGeral = request.getParameter("registroGeral");
            String endereco = request.getParameter("endereco");
            int id=0;
            if (request.getParameter("cadastrar").equals("Cadastrar")) {
                motorista.incluir(nome, cnh, registroGeral, endereco);
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
        <h1>Motoristas Existentes</h1>
        <a href="formularioMotorista.jsp">Incluir motorista</a>
        <form>
            <%try {%>
            <% ArrayList<Motorista> listaMotoristas = Motorista.getListaMotoristas(); %>
            <%if (listaMotoristas != null && !listaMotoristas.isEmpty()) { %>
            <table border="1">
                <tr>
                    <th>ID Motorista</th>
                    <th>Nome</th>
                    <th>CNH</th>
                    <th>RG</th>
                    <th>Endereco</th>
                    <th>Opcoes</th>
                </tr>
                <% for (Motorista p : listaMotoristas) {%>

                <tr>
                    <td><%=p.getId()%></td>
                    <td><%=p.getNome()%></td>
                    <td><%=p.getCnh()%></td>
                    <td><%=p.getRegistroGeral()%></td>
                    <td><%=p.getEndereco()%></td>
                    <td>
                        <a href="formularioMotorista.jsp?index=<%= p.getId()%>">Editar |</a>
                        <a href="pesquisaMotoristas.jsp?deletar=<%= p.getId()%>">Deletar</a>
                    </td>
                </tr>
                <%}%>
                <%} else {%>
                <h3>Não existem motoristas cadastrados</h3>
                <% } %>
            </table>
            <%} catch (Exception e) {%>
            <h3 style="color: red"> <%= e.getMessage()%> </h3>
            <%}%>
        </form>
        
        
    </body>
</html>

