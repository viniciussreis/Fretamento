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


public class Onibus {
    private int id;
    private int idMotorista;
    private String placa;
    private String numeracao;
    
    public static Onibus getOnibusById(int id) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "SELECT * FROM ONIBUS WHERE ID_ONIBUS = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        
        Onibus onibus = new Onibus();
        if (rs.next()) {
            onibus = new Onibus(
                    rs.getInt("ID_ONIBUS"),
                    rs.getInt("ID_MOTORISTA"),
                    rs.getString("PLACA"),
                    rs.getString("NUMERACAO")
            );
        }
        
        return onibus;
    }
    
    public static ArrayList<Onibus> getListaOnibus() throws Exception {
        Connection con = Db.getConnection();
        String SQL = "SELECT * FROM ONIBUS";
        PreparedStatement st = con.prepareStatement(SQL);
        ResultSet rs = st.executeQuery();
        ArrayList<Onibus> listaDeOnibus = new ArrayList();
        while(rs.next()) {
            Onibus onibus = new Onibus(
                    rs.getInt("ID_ONIBUS"),
                    rs.getInt("ID_MOTORISTA"),
                    rs.getString("PLACA"),
                    rs.getString("NUMERACAO")
            );
            
            listaDeOnibus.add(onibus);
        } 
        
        return listaDeOnibus;
    }
    
        public static void atualizar(Onibus onibus, int id) throws Exception {
        Connection con = Db.getConnection();
        String SQL = 
        "UPDATE ONIBUS SET ID_MOTORISTA = ?, NUMERACAO = ?, PLACA = ? WHERE ID_ONIBUS = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, onibus.getIdMotorista());
        st.setString(2, onibus.getNumeracao());
        st.setString(3, onibus.getPlaca());
        st.setInt(4, id);
        st.executeUpdate();
        st.close();
        con.close();
    }

    public static void deletar(int id) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "DELETE FROM ONIBUS WHERE ID_ONIBUS = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, id);
        st.executeUpdate();
        st.close();
        con.close();
    }

    public static void incluir(int idMotorista, String placa, String numeracao) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "INSERT INTO ONIBUS VALUES(DEFAULT, ?, ?, ?)";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, idMotorista);
        st.setString(2, placa);
        st.setString(3, numeracao);
        st.executeUpdate();
        st.close();
        con.close();
    }

    public Onibus(int id, int idMotorista, String placa, String numeracao) {
        this.id = id;
        this.idMotorista = idMotorista;
        this.placa = placa;
        this.numeracao = numeracao;
    }

    public Onibus() {
        this.placa = "";
        this.numeracao = "";
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdMotorista() {
        return idMotorista;
    }

    public void setIdMotorista(int idMotorista) {
        this.idMotorista = idMotorista;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getNumeracao() {
        return numeracao;
    }

    public void setNumeracao(String numeracao) {
        this.numeracao = numeracao;
    }

    
    
}
