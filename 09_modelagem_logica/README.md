### 🔹 1. Entidade Associativa

Uma **entidade associativa** (também chamada de entidade de relacionamento) surge quando você tem um relacionamento **M:N** entre duas entidades fortes e precisa transformá-lo em uma tabela.

👉 **Regra de mapeamento**:

* Crie uma **nova tabela** correspondente ao relacionamento.
* Essa tabela terá como **chaves primárias** as **chaves estrangeiras** vindas das entidades participantes.
* Caso o relacionamento possua **atributos próprios**, eles também entram nessa nova tabela.

**Exemplo:**

* Entidades: `Aluno(cod_aluno, nome)` e `Disciplina(cod_disciplina, nome)`.
* Relacionamento M:N: **Matrícula(data, nota)**.

➡ Modelo relacional:

```sql
Aluno(cod_aluno PK, nome)
Disciplina(cod_disciplina PK, nome)
Matricula(cod_aluno PK, cod_disciplina PK, data, nota,
          FOREIGN KEY (cod_aluno) REFERENCES Aluno,
          FOREIGN KEY (cod_disciplina) REFERENCES Disciplina)
```

---

### 🔹 2. Entidade Fraca

Uma **entidade fraca** depende de uma entidade forte para existir.
Ela **não tem chave primária própria**, sua identificação vem de:

* Um **identificador parcial** (um atributo interno, como número de série, sequência, etc.)
* * a **chave primária da entidade forte** da qual depende.

👉 **Regra de mapeamento**:

* Crie uma tabela para a entidade fraca.
* Sua **PK** será a combinação da **PK da entidade forte + identificador parcial**.
* Inclua também uma **FK** para a entidade forte.
* Se houver atributos adicionais, eles entram normalmente.

**Exemplo:**

* Entidade forte: `Departamento(cod_depto, nome)`.
* Entidade fraca: `ProjetoInterno(num_proj, descrição)` (depende de Departamento).

➡ Modelo relacional:

```sql
Departamento(cod_depto PK, nome)
ProjetoInterno(cod_depto PK, num_proj PK, descricao,
               FOREIGN KEY (cod_depto) REFERENCES Departamento)
```

---

✅ Resumindo:

* **Entidade associativa (M:N)** → vira uma **nova tabela**, com as PKs dos lados + atributos próprios.
* **Entidade fraca** → vira uma **tabela dependente**, cuja PK é a FK da forte + identificador parcial.

* Auto-relacionamento

<br><br>[Baixar todo o material da aula](https://download-directory.github.io/?url=http://github.com/IgorAvilaPereira/pmbd2025_2sem/tree/main/09_modelagem_logica) <br><br>

&nbsp;
