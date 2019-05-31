/*
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
 */
package br.com.fretamento.bo;

import br.com.fretamento.db.Db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class Passageiro {
    
    private int id;
    private int idLinha;
    private String nome;
    private String cpf;
    private String registroGeral;
    private String endereco;
    
    public static ArrayList<Passageiro> getListaPassageiros() throws Exception {
        Connection con = Db.getConnection();
        String SQL = "SELECT * FROM PASSAGEIRO";
        PreparedStatement st = con.prepareStatement(SQL);
        ResultSet rs = st.executeQuery();
        
        ArrayList<Passageiro> listaPassageiros = new ArrayList();
        while (rs.next()) {
            Passageiro passageiro = new Passageiro(
                    rs.getInt("ID_PASSAGEIRO"),
                    rs.getInt("ID_LINHA"),
                    rs.getString("NOME"),
                    rs.getString("CPF"),
                    rs.getString("REGISTRO_GERAL"),
                    rs.getString("ENDERECO")
            );
            listaPassageiros.add(passageiro);
        }
        
        return listaPassageiros;
    }
    
    public static Passageiro getPassageiroById(int id) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "SELECT * FROM PASSAGEIRO WHERE ID_PASSAGEIRO = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        
        Passageiro p = new Passageiro();
        if (rs.next()) {
            p = new Passageiro(
                    rs.getInt("ID_PASSAGEIRO"),
                    rs.getInt("ID_LINHA"),
                    rs.getString("NOME"),
                    rs.getString("CPF"),
                    rs.getString("REGISTRO_GERAL"),
                    rs.getString("ENDERECO")
            );
        }
        
        return p;
    }

    public static void deletar(int id) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "DELETE FROM PASSAGEIRO WHERE ID_PASSAGEIRO = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, id);
        st.executeUpdate();
        st.close();
        con.close();
    }

    public static void incluir(int idLinha, String nome, String cpf, String registroGeral, String endereco) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "INSERT INTO PASSAGEIRO VALUES(DEFAULT, ?, ?, ?, ?, ?)";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, idLinha);
        st.setString(2, nome);
        st.setString(3, cpf);
        st.setString(4, registroGeral);
        st.setString(5, endereco);
        st.executeUpdate();
        st.close();
        con.close();
    }
    
    public static void atualizar(int id, int idLinha, String nome, String cpf, String registroGeral, String endereco) throws Exception {
        Connection con = Db.getConnection();
        String SQL = 
        "UPDATE PASSAGEIRO SET ID_LINHA = ?, NOME = ?, CPF = ?, REGISTRO_GERAL = ?, ENDERECO = ? WHERE ID_PASSAGEIRO = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, idLinha);
        st.setString(2, nome);
        st.setString(3, cpf);
        st.setString(4, registroGeral);
        st.setString(5, endereco);
        st.setInt(6, id);
        st.executeUpdate();
        st.close();
        con.close();
    }

    public void atualizarLinha(int idPassageiro, int novoIdLinha) throws Exception {
        Connection con = Db.getConnection();
        String SQL = "UPDATE PASSAGEIRO SET ID_LINHA=? WHERE ID_PASSAGEIRO = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, novoIdLinha);
        st.setInt(2, idPassageiro);
        st.executeUpdate();
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
    
    public Passageiro () {
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
