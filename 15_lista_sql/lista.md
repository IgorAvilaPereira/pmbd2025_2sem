## 🧠 **Lista de Exercícios SQL – Academia**

### 🔹 1. Inserção de dados (`INSERT`)

1. Insira três clientes na tabela `Cliente`.
2. Adicione dois instrutores na tabela `Instrutor`.
3. Cadastre três planos diferentes na tabela `Plano`.
4. Insira quatro aulas diferentes na tabela `Aula`.
5. Relacione clientes e planos na tabela `Cliente_Plano`.
6. Matricule clientes em aulas na tabela `Matricula_Aula`.

---

### 🔹 2. Atualização de dados (`UPDATE`)

7. Atualize o email de um cliente específico.
8. Altere o nome de um cliente para “Maria Silva”.
9. Modifique o valor mensal de um plano para **120.00**.
10. Mude o nome de uma aula de “Spinning” para “Ciclismo Indoor”.

---

### 🔹 3. Exclusão de dados (`DELETE`)

11. Remova um cliente específico (lembre-se de apagar antes os registros de relacionamento).
12. Exclua uma aula que não possui alunos matriculados.
13. Delete um plano que não está mais disponível.

---

### 🔹 4. Seleção simples (`SELECT`)

14. Liste todos os clientes cadastrados.
15. Mostre o nome e o valor mensal de todos os planos.
16. Exiba as aulas e seus respectivos horários.
17. Liste os nomes dos instrutores e a data de admissão.

---

### 🔹 5. Seleção com filtros (`WHERE`)

18. Liste os clientes cadastrados após `2024-01-01`.
19. Mostre as aulas que acontecem no horário das 18h.
20. Encontre os planos cujo valor mensal seja maior que 100 reais.
21. Liste os instrutores contratados antes de `2023-01-01`.

---

### 🔹 6. Condicionais lógicas (`AND`, `OR`, `NOT`)

22. Mostre os clientes cadastrados depois de `2024-01-01` **e** cujo email termina com `@gmail.com`.
23. Liste os planos com valor entre 80 e 200 reais.
24. Mostre as aulas ministradas por instrutores **não** contratados em 2025.

---

### 🔹 7. Operadores de conjunto e subconsultas

25. Liste os clientes **que ainda não estão matriculados em nenhuma aula** (`NOT IN`).
26. Mostre os planos que **não foram contratados** por nenhum cliente.
27. Encontre as aulas que **não possuem** nenhum aluno matriculado (`NOT EXISTS`).

---

### 🔹 8. Ordenação e Limite de resultados (`ORDER BY`, `LIMIT`)

28. Liste os clientes em ordem alfabética.
29. Mostre os planos ordenados do mais caro para o mais barato.
30. Exiba as três aulas cadastradas mais recentemente (usando `LIMIT 3`).
31. Liste os instrutores ordenados pela data de admissão (do mais antigo ao mais novo).

---

### 🔹 9. Definição e alteração de estrutura (`DDL`)

32. Crie uma nova tabela chamada `Equipamento` com os campos: `id`, `nome`, `tipo`, `data_aquisicao`.
33. Use `ALTER TABLE` para adicionar a coluna `telefone` à tabela `Cliente`.
34. Use `ALTER TABLE` para **renomear** a coluna `valor_mensal` da tabela `Plano` para `preco_mensal`.
35. Use `DROP TABLE` para remover a tabela `Equipamento`.

---

### 🔹 10. Funções de texto e data

36. Mostre apenas o primeiro nome dos clientes (usando `SUBSTRING` ou `LEFT`).
37. Exiba o ano de admissão dos instrutores.
38. Mostre os clientes cujo email **não contém** a palavra “hotmail”.
39. Liste os clientes ordenados pela **data mais recente de cadastro**.
40. Mostre os nomes das aulas em letras maiúsculas (`UPPER`).


