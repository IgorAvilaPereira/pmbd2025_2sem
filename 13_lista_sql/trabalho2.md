## 🧾 **Trabalho 2: Sistema de Gerenciamento de Eventos**

### **1. Introdução**

Este trabalho apresenta o desenvolvimento de um **sistema de gerenciamento de eventos**, com foco em **modelagem relacional** e **implementação física em PostgreSQL**, além de uma demonstração de acesso a dados usando **Java JDBC**.

O sistema permite:

* Cadastro de **usuários** (organizadores),
* Criação de **eventos públicos**,
* Registro de **participantes** e suas **inscrições** em eventos.

---

### **2. Modelagem Relacional**

O modelo é composto por quatro entidades principais: **Usuário**, **Evento**, **Participante** e **Inscrição**.

#### **2.1 Descrição das Entidades**

| Entidade         | Descrição                                                                        |
| ---------------- | -------------------------------------------------------------------------------- |
| **Usuário**      | Representa os organizadores que criam eventos.                                   |
| **Evento**       | Armazena informações sobre cada evento, como título, descrição, data e local.    |
| **Participante** | Representa os usuários que podem se inscrever nos eventos.                       |
| **Inscrição**    | Registra a relação entre participantes e eventos, incluindo a data de inscrição. |

#### **2.2 Relacionamentos**

* Um **usuário** pode criar **vários eventos** (1:N).
* Um **participante** pode se inscrever em **vários eventos**, e cada **evento** pode ter **vários participantes**, configurando uma relação **N:N**, modelada pela tabela **inscrição**.

### **3. Implementação Física**

A implementação foi realizada em **PostgreSQL**, garantindo:

* **Chaves primárias e estrangeiras** para manter a integridade referencial;
* Uso de tipos adequados (textos, datas e números) para cada campo.

A estrutura física é simples e eficiente para permitir consultas como:

* Listar eventos por organizador;
* Listar participantes de um evento;
* Registrar novas inscrições.

---

### 🗂️ **3.1 Estrutura das Tabelas**

#### **Tabela: usuário**

Representa os organizadores que criam eventos.

| Coluna            | Tipo de dado | Restrições                | Descrição                              |
| ----------------- | ------------ | ------------------------- | -------------------------------------- |
| **id_usuario**    | SERIAL       | PRIMARY KEY               | Identificador único do usuário.        |
| **nome**          | VARCHAR(100) | NOT NULL                  | Nome completo do organizador.          |
| **email**         | VARCHAR(150) | NOT NULL, UNIQUE          | E-mail usado para login e contato.     |
| **senha**         | VARCHAR(100) | NOT NULL                  | Senha de acesso (armazenada com hash). |
| **data_cadastro** | TIMESTAMP    | DEFAULT CURRENT_TIMESTAMP | Data em que o usuário foi cadastrado.  |

---

#### **Tabela: evento**

Armazena as informações sobre cada evento criado por um usuário.

| Coluna          | Tipo de dado | Restrições                     | Descrição                            |
| --------------- | ------------ | ------------------------------ | ------------------------------------ |
| **id_evento**   | SERIAL       | PRIMARY KEY                    | Identificador único do evento.       |
| **titulo**      | VARCHAR(150) | NOT NULL                       | Nome ou título do evento.            |
| **descricao**   | TEXT         |                                | Descrição detalhada do evento.       |
| **data_evento** | DATE         | NOT NULL                       | Data de realização do evento.        |
| **local**       | VARCHAR(200) | NOT NULL                       | Local onde ocorrerá o evento.        |
| **id_usuario**  | INTEGER      | REFERENCES usuario(id_usuario) | Organizador responsável pelo evento. |
| **criado_em**   | TIMESTAMP    | DEFAULT CURRENT_TIMESTAMP      | Data de criação do registro.         |

---

#### **Tabela: participante**

Representa as pessoas que se inscrevem em eventos.

| Coluna              | Tipo de dado | Restrições                | Descrição                            |
| ------------------- | ------------ | ------------------------- | ------------------------------------ |
| **id_participante** | SERIAL       | PRIMARY KEY               | Identificador único do participante. |
| **nome**            | VARCHAR(100) | NOT NULL                  | Nome do participante.                |
| **email**           | VARCHAR(150) | NOT NULL, UNIQUE          | E-mail para contato e login.         |
| **telefone**        | VARCHAR(20)  |                           | Telefone de contato.                 |
| **data_cadastro**   | TIMESTAMP    | DEFAULT CURRENT_TIMESTAMP | Data de registro do participante.    |

---

#### **Tabela: inscrição**

Faz a ligação entre **participantes** e **eventos** (relação N:N).

| Coluna              | Tipo de dado | Restrições                               | Descrição                                  |
| ------------------- | ------------ | ---------------------------------------- | ------------------------------------------ |
| **id_inscricao**    | SERIAL       | PRIMARY KEY                              | Identificador único da inscrição.          |
| **id_participante** | INTEGER      | REFERENCES participante(id_participante) | Participante inscrito no evento.           |
| **id_evento**       | INTEGER      | REFERENCES evento(id_evento)             | Evento em que o participante se inscreveu. |
| **data_inscricao**  | TIMESTAMP    | DEFAULT CURRENT_TIMESTAMP                | Data da inscrição.                         |

---

### **4. Integração com Java (JDBC)**

A comunicação entre a aplicação e o banco é feita com **Java JDBC**, que permite executar comandos SQL diretamente do código Java.

Realize o cadastro de um evento, de um participante e uma inscrição:

```java
import java.sql.*;

public class SistemaEventos {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5432/eventosdb";
        String usuario = "usuario";
        String senha = "senha";

        try (Connection conexao = DriverManager.getConnection(url, usuario, senha)) {
            System.out.println("Conexão estabelecida com sucesso!");

            String sql = "INSERT INTO inscricao (participante_id, evento_id, data_inscricao) VALUES (?, ?, NOW())";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, 3); // ID do participante
            ps.setInt(2, 5); // ID do evento
            ps.executeUpdate();

            System.out.println("Inscrição realizada com sucesso!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
```

O exemplo demonstra:

* Estabelecimento da conexão com o banco;
* Uso de **PreparedStatement** para evitar injeção de SQL;
* Execução de comando **INSERT** para registrar inscrições.

---

### **5. Conclusão**

O trabalho apresentou um modelo **relacional** e funcional para gerenciamento de eventos, incluindo:

* Criação e cadastro de eventos;
* Registro de participantes e suas inscrições;
* Integração prática com **Java JDBC** para manipulação de dados.

