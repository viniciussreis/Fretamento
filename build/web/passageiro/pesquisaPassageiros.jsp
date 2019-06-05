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
        <div class="text-left mb-3 text-center">
            <h2>Passageiros existentes</h2>
            <a href="formularioPassageiro.jsp">
                <i class="fa fa-plus"></i>
            </a>
        </div>
        <form>
            <%try {%>
            <% ArrayList<Passageiro> listaPassageiros = Passageiro.getListaPassageiros(); %>
            <%if (listaPassageiros != null && !listaPassageiros.isEmpty()) { %>
            <div class="row m-auto text-center pt-2 text-secondary" style="background-color: aliceblue; height: 40px;">
                <div class="col-1">ID Passageiro</div>
                <div class="col-1">ID Linha</div>
                <div class="col-2">Nome</div>
                <div class="col-2">CPF</div>
                <div class="col-2">RG</div>
                <div class="col-2">Endereco</div>
                <div class="col-2">Opcões</div>
            </div>
            <% for (Passageiro p : listaPassageiros) {%>
            <div class="row m-auto text-center pt-2 text-truncate" style="height: 40px">
                <div class="col-1 mt-2">
                    <%=p.getId()%>
                </div>
                <div class="col-1 mt-2">
                    <%=p.getIdLinha()%>
                </div>
                <div class="col-2 mt-2">
                    <%=p.getNome()%>
                </div>
                <div class="col-2 mt-2">
                    <%=p.getCpf()%>
                </div>
                <div class="col-2 mt-2">
                    <%=p.getRegistroGeral()%>
                </div>
                <div class="col-2 mt-2">
                    <%=p.getEndereco()%>
                </div>
                <div class="col-2 mt-2">
                    <a href="formularioPassageiro.jsp?index=<%= p.getId()%>">Editar |</a>
                    <a href="pesquisaPassageiros.jsp?deletar=<%= p.getId()%>">Deletar</a>
                </div> 
            </div>           
            <% } %>
            <%} else {%>
            <h3>Não existem passageiros cadastrados</h3>
            <% } %>
            <%} catch (Exception e) {%>
            <h3 style="color: red"> <%= e.getMessage()%> </h3>
            <%}%>
        </form>
    </body>
</body>
</html>
