
import br.com.fretamento.bo.Passageiro;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author linkapi
 */
public class TestePassageiro {

    private final int id;
    private final int idLinha;
    private final String nome;
    private final String cpf;
    private final String registroGeral;
    private final String endereco;

    public TestePassageiro(int id, int idLinha, String nome, String cpf, String registroGeral, String endereco) {
        this.id = id;
        this.idLinha = idLinha;
        this.nome = nome;
        this.cpf = cpf;
        this.registroGeral = registroGeral;
        this.endereco = endereco;
    }
    
    public void create() {
        try {
            Passageiro.incluir(this.idLinha, this.nome, this.cpf, this.registroGeral, this.endereco);
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
}
