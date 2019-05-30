<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fretamento.bo.Passageiro"%>
<%@page import="br.com.fretamento.bo.Linha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String erro = "deu certo";
    try {
        if (request.getParameter("cadastrar") != null) {
            Passageiro passageiro = new Passageiro();
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

    } catch (Exception e) {
        erro = e.getMessage();
    }  
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar passageiros - Fretado</title>
    </head>
    <body>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Passageiros - Fretado</title>
    </head>
    <body>
        <h1>Java DB</h1>
        <a href="formularioPassageiro.jsp">Incluir Passageiro</a>

        <h2>Passageiros existentes</h2>
        <p><%= erro %></p>

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
            <% int index = Passageiro.getListaPassageiros().indexOf(p);%>

            <tr>
                <td><%=p.getId()%></td>
                <td><%=p.getIdLinha()%></td>
                <td><%=p.getNome()%></td>
                <td><%=p.getCpf()%></td>
                <td><%=p.getRegistroGeral()%></td>
                <td><%=p.getEndereco()%></td>
                <td>
                    <a href="formularioPassageiro.jsp?index=1">Editar |</a>
                    <a href="#">Excluir</a>
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
    </body>
</body>
</html>
