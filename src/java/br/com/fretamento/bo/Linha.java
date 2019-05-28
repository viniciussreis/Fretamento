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
    private int idPassageiro;
    private String partida;
    private String destino;

    public static Linha getListaLinhas(String login, String password) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "SELECT * FROM LINHA";
        PreparedStatement st = con.prepareStatement(SQL);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            return new Linha(
                    rs.getInt("ID_LINHA"),
                    rs.getInt("ID_PASSAGEIRO"),
                    rs.getString("PARTIDA"),
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
        st.executeQuery();
        st.close();
        con.close();
    }

    public Linha(int id, int idPassageiro, String partida, String destino) {
        this.id = id;
        this.idPassageiro = idPassageiro;
        this.partida = partida;
        this.destino = destino;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdPassageiro() {
        return idPassageiro;
    }

    public void setIdPassageiro(int idPassageiro) {
        this.idPassageiro = idPassageiro;
    }

    public String getPartida() {
        return partida;
    }

    public void setPartida(String partida) {
        this.partida = partida;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }
}
