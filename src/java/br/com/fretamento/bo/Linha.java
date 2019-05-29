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

public class Linha {

    private int id;
    private int idOnibus;
    private String origem;
    private String destino;

    public static Linha getListaLinhas(String login, String password) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "SELECT * FROM LINHA";
        PreparedStatement st = con.prepareStatement(SQL);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            return new Linha(
                    rs.getInt("ID_LINHA"),
                    rs.getInt("ID_ONIBUS"),
                    rs.getString("ORIGEM"),
                    rs.getString("DESTINO")
            );
        } else {
            return null;
        }
    }

    public static void deletar(int id) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "DELETE * FROM LINHA WHERE ID_LINHA = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        rs.close();
        st.close();
        con.close();
    }

    public static void incluir(String partida, String destino) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "INSERT INTO LINHA VALUES(DEFAULT, ?, ?)";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setString(1, partida);
        st.setString(2, destino);
        st.executeUpdate();
        st.close();
        con.close();
    }
        
    public Linha(int id, int idOnibus, String origem, String destino) {
        this.id = id;
        this.idOnibus = idOnibus;
        this.origem = origem;
        this.destino = destino;
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
