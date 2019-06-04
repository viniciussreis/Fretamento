<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fretamento.bo.Passageiro"%>
<%@page import="br.com.fretamento.bo.Linha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    try {
        Passageiro passageiro = new Passageiro();
        if (request.getParameter("cadastrar") != null) {
            String nome = request.getParameter("nome");;
            String cpf = request.getParameter("cpf");;
            String registroGeral = request.getParameter("registroGeral");
            String endereco = request.getParameter("endereco");
            int idLinha = Integer.parseInt(request.getParameter("idLinha"));
            int id = 0;

            if (request.getParameter("cadastrar").equals("Cadastrar")) {
                passageiro.incluir(idLinha, nome, cpf, registroGeral, endereco);
            }

            if (request.getParameter("cadastrar").equals("Salvar")) {
                id = Integer.parseInt(request.getParameter("index"));

                passageiro.atualizar(id, idLinha, nome, cpf, registroGeral, endereco);
                response.sendRedirect(request.getRequestURI());
            }
        }

        if (request.getParameter("deletar") != null) {
            int id = Integer.parseInt(request.getParameter("deletar"));
            passageiro.deletar(id);
            response.sendRedirect(request.getRequestURI());
        }

    } catch (Exception e) {
    }
%>


<html>
    <% session.setAttribute("pageTitle", "Listagem de passageiro"); %>
    <%@include file="../WEB-INF/jspf/header.jspf" %>
    <%@include file="../WEB-INF/jspf/navbar.jspf" %>
    <body>
        <h1>Java DB</h1>
        <a href="formularioPassageiro.jsp">Incluir Passageiro</a>

        <h2>Passageiros existentes</h2>

        <form>
            <%try {%>
            <% ArrayList<Passageiro> listaPassageiros = Passageiro.getListaPassageiros(); %>
            <%if (listaPassageiros != null && !listaPassageiros.isEmpty()) { %>
            <table border="1">
                <tr>
                    <th>ID Passageiro</th>
                    <th>ID Linha</th>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>RG</th>
                    <th>Endereco</th>
                    <th>Opcoes</th>
                </tr>
                <% for (Passageiro p : listaPassageiros) {%>

                <tr>
                    <td><%=p.getId()%></td>
                    <td><%=p.getIdLinha()%></td>
                    <td><%=p.getNome()%></td>
                    <td><%=p.getCpf()%></td>
                    <td><%=p.getRegistroGeral()%></td>
                    <td><%=p.getEndereco()%></td>
                    <td>
                        <a href="formularioPassageiro.jsp?index=<%= p.getId()%>">Editar |</a>
                        <a href="pesquisaPassageiros.jsp?deletar=<%= p.getId()%>">Deletar</a>
                    </td>
                </tr>
                <%}%>
                <%} else {%>
                <h3>Não existem passageiros cadastrados</h3>
                <% } %>
            </table>
            <%} catch (Exception e) {%>
            <h3 style="color: red"> <%= e.getMessage()%> </h3>
            <%}%>
        </form>
    </body>
</body>
</html>
