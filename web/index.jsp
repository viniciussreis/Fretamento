<%-- 
    Document   : index
    Created on : 27/05/2019, 23:05:09
    Author     : Vinicius Reis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% session.setAttribute("pageTitle", "Home"); %>
    <%@include file="../WEB-INF/jspf/header.jspf" %>
    <%@include file="../WEB-INF/jspf/navbar.jspf" %>
    <body>
        <div class="text-left mb-3 text-center">
            <h2>Projeto POO - Fretamento</h2><br><br>
        </div>
        <div class="ml-3">

            <h3><b><u>Resumo:</u></b></h3>
            <p>
                Esse projeto possui o intuito de auxiliar o dia a dia de um prestador de serviços de uma empresa de fretados.<br>
                Com ele é possível manipular dados das seguintes entidades:
            </p>
            <ul>
                <li>
                    <b>Linha:</b> Permite o cadastro (atrela o motorista e o ônibus para a linha), listagem, edição e exclusão de uma linha.
                </li>
                <li>
                    <b>Motorista:</b> Permite o cadastro, listagem, edição e exclusão de um motorista.
                </li>
                <li>
                    <b>Ônibus</b> Permite o cadastro, listagem, edição e exclusão de um ônibus.
                </li>
                <li>
                    <b>Passageiro:</b> Permite o cadastro (atrelar ele à uma linha), listagem, edição e exclusão de um passageiro
                </li>
            </ul><br><br>

            <h3><b><u>Integrantes:</u></b></h3>
            <ul>
                <li>Christian Moura</li>
                <li>Stéfano Hayba</li>
                <li>Tawan Reis</li>
                <li>Vinicius Moura</li>
                <li>Vinicius Reis</li>
            </ul>
        </div>
    </body>
</html>
