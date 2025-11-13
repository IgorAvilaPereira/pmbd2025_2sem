package atividade1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import io.javalin.Javalin;

import io.javalin.http.staticfiles.Location;
import io.javalin.rendering.template.JavalinMustache;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Main {
    public static void main(String[] args) {

        var app = Javalin.create(config -> {
            config.fileRenderer(new JavalinMustache());
            config.staticFiles.add("/static", Location.CLASSPATH); // Serves files from src/main/resources/static
            // config.staticFiles.add(staticFiles -> {
            // staticFiles.hostedPath = "/"; // change to host files on a subpath, like
            // '/assets'
            // staticFiles.directory = "/static_files"; // the directory where your files
            // are located;
            // staticFiles.location = Location.CLASSPATH; // Location.CLASSPATH (jar) or
            // Location.EXTERNAL (file system)
            // staticFiles.precompress = false; // if the files should be pre-compressed and
            // cached in memory (optimization)
            // staticFiles.aliasCheck = null; // you can configure this to enable symlinks
            // (= ContextHandler.ApproveAliases())
            // staticFiles.headers = Map.of(...); // headers that will be set for the files
            // staticFiles.skipFileFunction = req -> false; // you can use this to skip
            // certain files in the dir, based on the HttpServletRequest
            // staticFiles.mimeTypes.add(mimeType, ext); // you can add custom mimetypes for
            // extensions
            // });
        }).start(7070);

        app.post("/adicionar", ctx -> {
            String nome = ctx.formParam("nome");
            String host = "localhost";
            String port = "5432";
            String username = "postgres";
            String password = "postgres";
            String dbname = "atividade1";
            String url = "jdbc:postgresql://" + host + ":" + port + "/" + dbname;
            try (Connection conexao = DriverManager.getConnection(url, username, password)) {
                String sql = "INSERT INTO aula (nome, instrutor_id) VALUES (?, ?);";
                PreparedStatement instrucao = conexao.prepareStatement(sql);
                instrucao.setString(1, nome);
                instrucao.setInt(2, 1);
                instrucao.executeUpdate();
                ctx.html("ok. <a href='http://localhost:7070/1'> voltar </a>");                
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Deu xabum!");
            }
        });

        app.get("/{pagina}", ctx -> {
            // Scanner entrada = new Scanner(System.in);
            String host = "localhost";
            String port = "5432";
            String username = "postgres";
            String password = "postgres";
            String dbname = "atividade1";
            String url = "jdbc:postgresql://" + host + ":" + port + "/" + dbname;
            try (Connection conexao = DriverManager.getConnection(url, username, password)) {
                // System.out.println("Aulas?s(sim) ou n(não)");
                // String querVerAulas = entrada.nextLine();
                // if (querVerAulas.equals("s")) {
                String totalDePaginasSQL = "select CEIL(count(*)/2.0) as nro_pagina from aula;";
                PreparedStatement instrucao = conexao.prepareStatement(totalDePaginasSQL);
                ResultSet result = instrucao.executeQuery();
                if (result.next()) {
                    // int totalDePaginas = result.getInt("nro_pagina");
                    // System.out.println("Nos temos " + totalDePaginas + " de paginas. Deseja ver
                    // alguma?");
                    int paginaEscolhida = Integer.parseInt(ctx.pathParam("pagina"));
                    String paginaSQL = "SELECT * FROM aula ORDER BY nome LIMIT 2 OFFSET "
                            + (paginaEscolhida - 1) * 2;
                    instrucao = conexao.prepareStatement(paginaSQL);

                    result = instrucao.executeQuery();

                    List<String> vetAulas = new ArrayList<>();
                    // String html = "<ul>";
                    while (result.next()) {
                        vetAulas.add(result.getString("nome"));
                    }
                    // html+="</li>";
                    // ctx.html(html);

                    Map<String, Object> model = new HashMap<>();
                    model.put("vetAulas", vetAulas);
                    ctx.render("/templates/index.html", model);



                }
                // }
                // entrada.close();
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Deu xabum!");
            }

        });

    }
}