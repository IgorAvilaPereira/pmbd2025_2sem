
* **Generalização**: pegar várias entidades semelhantes e criar uma entidade mais geral.
  Ex.: *Professor* e *Aluno* → **Pessoa**.
* **Especialização**: o oposto, pegar uma entidade e dividi-la em subclasses.
  Ex.: *Pessoa* → **Aluno** e **Professor**.

---

### 🔹 Regras de mapeamento (para o modelo relacional)

Existem **três estratégias principais** (cada uma usada conforme o caso):

#### 1. **Tabela única para cada entidade (generalização total)**

* Cria-se uma **tabela para a entidade genérica** (*Pessoa*).
* Cria-se também **tabelas para cada especialização** (*Aluno*, *Professor*).
* As tabelas filhas usam a **mesma PK da tabela pai** como **PK e FK**.

**Exemplo:**

```sql
Pessoa(cod_pessoa PK, nome, cpf)
Aluno(cod_pessoa PK, curso,
      FOREIGN KEY (cod_pessoa) REFERENCES Pessoa)
Professor(cod_pessoa PK, salario,
          FOREIGN KEY (cod_pessoa) REFERENCES Pessoa)
```

---

#### 2. **Uma única tabela para toda a hierarquia (generalização parcial)**

* Cria-se **apenas uma tabela** que contém atributos de todas as subclasses.
* Usa-se um **atributo discriminador** para indicar o tipo.

**Exemplo:**

```sql
Pessoa(cod_pessoa PK, nome, cpf,
       tipo,  -- 'A' para aluno, 'P' para professor
       curso, -- só usado se tipo = 'A'
       salario) -- só usado se tipo = 'P'
```

---

#### 3. **Uma tabela apenas para as subclasses**

* Não se cria tabela para a entidade genérica, só para as especializações.
* Os atributos comuns da entidade geral são **repetidos** em cada tabela filha.

**Exemplo:**

```sql
Aluno(cod_aluno PK, nome, cpf, curso)
Professor(cod_prof PK, nome, cpf, salario)
```

---

### 🔹 Qual estratégia usar?

* **1ª (tabela genérica + filhas)** → mais fiel ao MER, boa para normalização.
* **2ª (tabela única)** → mais simples, evita joins, mas pode gerar muitos nulos.
* **3ª (só filhas)** → útil quando subclasses são **disjuntas** e não há instâncias diretas da entidade genérica.

---

✅ **Resumo:**

<!--
* Associativa (M:N) → nova tabela.
* Fraca → tabela dependente com PK composta.
* Multivalorado → nova tabela.
* Composto → decompõe em atributos simples.
-->
* Especialização/Generalização → três estratégias (tabelas separadas, única, ou só subclasses).

<br><br>[Baixar todo o material da aula](https://download-directory.github.io/?url=http://github.com/IgorAvilaPereira/pmbd2025_2sem/tree/main/07_modelagem_logica) <br><br>
&nbsp;
