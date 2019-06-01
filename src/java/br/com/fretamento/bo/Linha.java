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

public class Linha {

    private int id;
    private int idOnibus;
    private int numero;
    private String origem;
    private String destino;
    
    public static Linha getLinhaById(int id) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "SELECT * FROM LINHA WHERE ID_LINHA = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        
        Linha linha = new Linha();
        if (rs.next()) {
            linha = new Linha(
                    rs.getInt("ID_LINHA"),
                    rs.getInt("ID_ONIBUS"),
                    rs.getInt("NUMERO"),
                    rs.getString("ORIGEM"),
                    rs.getString("DESTINO")
            );
        }
        
        return linha;
    }

    public static ArrayList<Linha> getListaLinhas() throws Exception {
        Connection con = Db.getConnection();
        String SQL = "SELECT * FROM LINHA";
        PreparedStatement st = con.prepareStatement(SQL);
        ResultSet rs = st.executeQuery();
        
        ArrayList<Linha> listaDeLinhas = new ArrayList();
        while(rs.next()) {
            Linha linha = new Linha(
                    rs.getInt("ID_LINHA"),
                    rs.getInt("ID_ONIBUS"),
                    rs.getInt("NUMERO"),
                    rs.getString("ORIGEM"),
                    rs.getString("DESTINO")
            );
            
            listaDeLinhas.add(linha);
        } 
        
        return listaDeLinhas;
    }
    
        public static void atualizar(Linha linha, int id) throws Exception {
        Connection con = Db.getConnection();
        String SQL = 
        "UPDATE LINHA SET ID_ONIBUS = ?, NUMERO = ?, ORIGEM = ?, DESTINO = ? WHERE ID_LINHA = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, linha.getIdOnibus());
        st.setInt(2, linha.getNumero());
        st.setString(3, linha.getOrigem());
        st.setString(4, linha.getDestino());
        st.setInt(5, id);
        st.executeUpdate();
        st.close();
        con.close();
    }

    public static void deletar(int id) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "DELETE FROM LINHA WHERE ID_LINHA = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, id);
        st.executeUpdate();
        st.close();
        con.close();
    }

    public static void incluir(int numero, int idOnibus, String origem, String destino) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "INSERT INTO LINHA VALUES(DEFAULT, ?, ?, ?, ?)";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, idOnibus);
        st.setInt(2, numero);
        st.setString(3, origem);
        st.setString(4, destino);
        st.executeUpdate();
        st.close();
        con.close();
    }

    public Linha(int id, int idOnibus, int numero, String origem, String destino) {
        this.id = id;
        this.idOnibus = idOnibus;
        this.numero = numero;
        this.origem = origem;
        this.destino = destino;
    }

    public Linha() {
        this.origem = "";
        this.destino = "";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdOnibus() {
        return idOnibus;
    }

    public void setIdOnibus(int idOnibus) {
        this.idOnibus = idOnibus;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getOrigem() {
        return origem;
    }

    public void setOrigem(String origem) {
        this.origem = origem;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }
        
}
