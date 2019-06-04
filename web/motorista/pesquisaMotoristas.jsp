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
            int id = 0;
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
    <% session.setAttribute("pageTitle", "Listagem de motorista"); %>
    <%@include file="../WEB-INF/jspf/header.jspf" %>
    <%@include file="../WEB-INF/jspf/navbar.jspf" %>
    <body>
        <div class="text-left mb-3 text-center">
            <h2>Motoristas Existentes</h2>
            <a href="formularioMotorista.jsp">
                <i class="fa fa-plus"></i>
            </a>
        </div>
        <div class="container">
            <form>
            <%try {%>
            <% ArrayList<Motorista> listaMotoristas = Motorista.getListaMotoristas(); %>
            <%if (listaMotoristas != null && !listaMotoristas.isEmpty()) { %>
            <div>
                <div class="row m-auto text-center pt-2 text-secondary" style="background-color: aliceblue; height: 40px;">
                    <div class="col-2">ID Motorista</div>
                    <div class="col-2">Nome</div>
                    <div class="col-2">CNH</div>
                    <div class="col-2">RG</div>
                    <div class="col-2">Endereço</div>
                    <div class="col-2">Opções</div>
                </div>
            </div>
            <% for (Motorista p : listaMotoristas) {%>
            <div class="row m-auto text-center pt-2 text-truncate" style="height: 40px">
                <div class="col-2">
                    <%=p.getId()%>
                </div>
                <div class="col-2 mt-2">
                    <%=p.getNome()%>
                </div>
                <div class="col-2 mt-2">
                    <%=p.getCnh()%>
                </div>
                <div class="col-2 mt-2">
                    <%=p.getRegistroGeral()%>
                </div>
                <div class="col-2 mt-2">
                    <%=p.getEndereco()%>
                </div>
                <div class="col-2">
                    <a href="formularioMotorista.jsp?index=<%= p.getId()%>">
                        <i style="color: gray" class="fa fa-edit"></i>
                    </a>
                    <a href="pesquisaMotoristas.jsp?deletar=<%= p.getId()%>">
                        <i style="color: red" class="ml-2 fa fa-trash" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
            <%}%>
            <%} else {%>
            <h3>Não existem motoristas cadastrados</h3>
            <% } %>
            <%} catch (Exception e) {%>
            <h3 style="color: red"> <%= e.getMessage()%> </h3>
            <%}%>
        </form>

        </div>
    </body>
</html>

