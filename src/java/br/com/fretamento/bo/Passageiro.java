/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fretamento.bo;

import br.com.fretamento.db.Db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Passageiro {
    
    private int id;
    private int idLinha;
    private String nome;
    private String cpf;
    private String registroGeral;
    private String endereco;
    
    public static Passageiro getListaPassageiros() throws Exception {
        Connection con = Db.getConnection();
        String SQL = "SELECT * FROM PASSAGEIRO";
        PreparedStatement st = con.prepareStatement(SQL);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            return new Passageiro(
                    rs.getInt("ID_PASSAGEIRO"),
                    rs.getInt("ID_LINHA"),
                    rs.getString("NOME"),
                    rs.getString("CPF"),
                    rs.getString("REGISTRO_GERAL"),
                    rs.getString("ENDERECO")
            );
        } else {
            return null;
        }
    }

    public static void deletar(int id) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "DELETE * FROM PASSAGEIRO WHERE ID_PASSAGEIRO = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        rs.close();
        st.close();
        con.close();
    }

    public static void incluir(int idLinha, String nome, String cpf, String registroGeral, String endereco) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "INSERT INTO MOTORISTA VALUES(DEFAULT, ?, ?, ?, ?, ?)";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, idLinha);
        st.setString(2, nome);
        st.setString(3, cpf);
        st.setString(4, registroGeral);
        st.setString(5, endereco);
        st.executeQuery();
        st.close();
        con.close();
    }

    public Passageiro(int id, int idLinha, String nome, String cpf, String registroGeral, String endereco) {
        this.id = id;
        this.idLinha = idLinha;
        this.nome = nome;
        this.cpf = cpf;
        this.registroGeral = registroGeral;
        this.endereco = endereco;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdLinha() {
        return idLinha;
    }

    public void setIdLinha(int idLinha) {
        this.idLinha = idLinha;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRegistroGeral() {
        return registroGeral;
    }

    public void setRegistroGeral(String registroGeral) {
        this.registroGeral = registroGeral;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    
}
