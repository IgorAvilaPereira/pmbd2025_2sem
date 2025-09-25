package conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

public class Main {
    public static void main(String[] args) throws SQLException {
        String host = "localhost";
        String username = "postgres";
        String password = "postgres";
        String dbname = "igor_amazon";
        String port = "5432";
        String url = "jdbc:postgresql://"+host+":"+port+"/"+dbname;
        Connection conexao = DriverManager.getConnection(url, username, password);
        String sql = "SELECT * FROM usuario";
        ResultSet rs = conexao.prepareStatement(sql).executeQuery();
        String janela = "";
        while(rs.next()){
            janela+=rs.getString("cpf")+"\n";
            janela+=rs.getString("nome")+"\n=============\n";
        }
        JOptionPane.showMessageDialog(null, janela, "Meu Projeto", JOptionPane.INFORMATION_MESSAGE);
    }
}