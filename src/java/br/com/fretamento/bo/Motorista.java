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
import java.util.ArrayList;

public class Motorista {

    private int id;
    private String nome;
    private String cnh;
    private String registroGeral;
    private String endereco;
    
    public static ArrayList<Motorista> getListaMotoristas() throws Exception {
        Connection con = Db.getConnection();
        String SQL = "SELECT * FROM MOTORISTA";
        PreparedStatement st = con.prepareStatement(SQL);
        ResultSet rs = st.executeQuery();
        
        ArrayList<Motorista> listaMotoristas = new ArrayList();
        while (rs.next()) {
            Motorista motorista=  new Motorista(
                    rs.getInt("ID_MOTORISTA"),
                    rs.getString("NOME"),
                    rs.getString("CNH"),
                    rs.getString("REGISTRO_GERAL"),
                    rs.getString("ENDERECO")
            );
            listaMotoristas.add(motorista);
        }
        return listaMotoristas;
    }
    
    public static Motorista getMotoristaById(int id) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "SELECT * FROM MOTORISTA WHERE ID_MOTORISTA = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        
        Motorista motorista = new Motorista();
        if (rs.next()) {
            motorista.setId(rs.getInt("ID_MOTORISTA"));
            motorista.setCnh(rs.getString("CNH"));
            motorista.setEndereco(rs.getString("ENDERECO"));
            motorista.setRegistroGeral(rs.getString("REGISTRO_GERAL"));
            motorista.setId(rs.getInt("ID_MOTORISTA"));
            motorista.setNome(rs.getString("NOME"));
        }
        
        return motorista;
    }
    
    public static void atualizar(Motorista motorista, int id) throws Exception {
        Connection con = Db.getConnection();
        String SQL = 
        "UPDATE MOTORISTA SET NOME = ?, CNH = ?, REGISTRO_GERAL = ?, ENDERECO = ? WHERE ID_MOTORISTA = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setString(1, motorista.getNome());
        st.setString(2, motorista.getCnh());
        st.setString(3, motorista.getRegistroGeral());
        st.setString(4, motorista.getEndereco());
        st.setInt(5, id);
        st.executeUpdate();
        st.close();
        con.close();
    }
    
    public static void deletar(int id) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "DELETE FROM MOTORISTA WHERE ID_MOTORISTA = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, id);
        st.executeUpdate();
        st.close();
        con.close();
    }

    public static void incluir(String nome, String cnh, String registroGeral,String endereco) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "INSERT INTO MOTORISTA VALUES(DEFAULT, ?, ?, ?, ?)";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setString(1, nome);
        st.setString(2, cnh);
        st.setString(3, registroGeral);
        st.setString(4, endereco);
        st.executeUpdate();
        st.close();
        con.close();
    }

    public Motorista(int id, String nome, String cnh, String registroGeral, String endereco) {
        this.id = id;
        this.nome = nome;
        this.cnh = cnh;
        this.registroGeral = registroGeral;
        this.endereco = endereco;
    }
    
    public Motorista(){
        this.nome = "";
        this.cnh = "";
        this.registroGeral = "";
        this.endereco = "";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCnh() {
        return cnh;
    }

    public void setCnh(String cnh) {
        this.cnh = cnh;
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
