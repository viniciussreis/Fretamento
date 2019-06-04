<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fretamento.bo.Linha"%>
<%@page import="br.com.fretamento.bo.Passageiro"%>
<%
    Passageiro passageiro = new Passageiro();
    int id = 0;
    String nome = "";
    String cpf = "";
    String registroGeral = "";
    String endereco = "";
    int numeroLinha = 0;

    String valorBotao = "Cadastrar";

    if (request.getParameter("index") != null) {
        id = Integer.parseInt(request.getParameter("index"));
        Passageiro p = passageiro.getPassageiroById(id);
        nome = p.getNome();
        cpf = p.getCpf();
        registroGeral = p.getRegistroGeral();
        endereco = p.getEndereco();
        numeroLinha = p.getIdLinha();

        valorBotao = "Salvar";
    }

    ArrayList<Linha> linhas = Linha.getListaLinhas();


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% session.setAttribute("pageTitle", "Form passageiro"); %>
    <%@include file="../WEB-INF/jspf/header.jspf" %>
    <%@include file="../WEB-INF/jspf/navbar.jspf" %>
    <body>
        <h1>Formulário Adicionar Passageiro</h1>
        <hr>
        <form action="pesquisaPassageiros.jsp">
            <label>Nome</label>
            <input type="text" name="nome" id="nome" value="<%= nome%>"/>
            <label>CPF</label>
            <input type="text" name="cpf" id="cpf" value="<%= cpf%>"/>
            <label>RG</label>
            <input type="text" name="registroGeral" id="registroGeral" value="<%= registroGeral%>"/>
            <label>Endereco</label>
            <input type="text" name="endereco" id="endereco" value="<%= endereco%>"/>

            <label>Numero da Linha</label>
            <select name="idLinha">
                <option></option>
                <% for (Linha l : linhas) {%>
                <option value="<%= l.getId() %>"><%= l.getNumero()%></option>          
                <% }%>
            </select>

            <input type="submit" value="<%= valorBotao%>" name="cadastrar"/>

            <% if (valorBotao.equals("Salvar")) {%>
            <input type="hidden" name="index" value="<%= id%>">
            <% }%>

        </form>
    </body>
</html>
