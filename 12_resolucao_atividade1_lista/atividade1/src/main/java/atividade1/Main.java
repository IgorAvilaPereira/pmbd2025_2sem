package atividade1;

import java.sql.*;

import javax.naming.spi.DirStateFactory.Result;

public class Main {
    public static void main(String[] args) throws SQLException {
        String host = "localhost";
        String port = "5432";
        String username = "postgres";
        String password = "postgres";
        String dbname = "atividade1";

        String url = "jdbc:postgresql://"+host+":"+port+"/"+dbname;

        Connection conexao = DriverManager.getConnection(url, username, password);
        String sql = "Select nome from cliente";
        ResultSet rs = conexao.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            System.out.println(rs.getString("nome"));
        }
        conexao.close();
    }
}