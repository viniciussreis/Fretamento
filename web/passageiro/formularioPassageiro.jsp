<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incluir Passageiro - Fretado</title>
    </head>
    <body>
        <h1>Formulário Adicionar Passageiro</h1>
        <hr>
        <form action="pesquisaPassageiros.jsp">
            <label>Nome</label>
            <input type="text" name="nome" id="nome"/>
            <label>CPF</label>
            <input type="text" name="cpf" id="cpf"/>
            <label>RG</label>
            <input type="text" name="registroGeral" id="registroGeral"/>
            <label>Endereco</label>
            <input type="text" name="endereco" id="endereco"/>
            <label>Numero da Linha</label>
            <input type="text" name="idLinha" id="idLinha"/>
            <input type="submit" value="Cadastrar" name="cadastrar"/>
        </form>
    </body>
</html>
