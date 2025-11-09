package atividade1;

import java.sql.*;
import java.util.Scanner;

import javax.naming.spi.DirStateFactory.Result;

public class Main {
    public static void main(String[] args) throws SQLException {
        String host = "localhost";
        String port = "5432";
        String username = "postgres";
        String password = "postgres";
        String dbname = "atividade1";

        String url = "jdbc:postgresql://"+host+":"+port+"/"+dbname;

        // conecta
        Connection conexao = DriverManager.getConnection(url, username, password);
       
        Scanner in = new Scanner(System.in);
        System.out.println("Digite seu nome:");
        String nome = in.nextLine();

        System.out.println("Digite seu email:");
        String email = in.nextLine();

        String sqlInsert = "INSERT INTO cliente (nome, email) values (?,?);";
        PreparedStatement instrucao = conexao.prepareStatement(sqlInsert);
        instrucao.setString(1, nome);
        instrucao.setString(2, email);
        instrucao.execute();


        System.out.println("=====Listando Clientes da Academia ====");
       
        // cria um instrucao sql
        String sql = "Select * from cliente";
        // executa esta instrucao sql
        ResultSet rs = conexao.prepareStatement(sql).executeQuery();
        // loop - enquanto tem resultado (tuplas)
        while (rs.next()) {
            // mostra na tela
            System.out.println(rs.getInt("id")+";"+rs.getString("nome"));
            // System.out.println();
        }
        // fecha conexao
        conexao.close();
        in.close();
    }
}