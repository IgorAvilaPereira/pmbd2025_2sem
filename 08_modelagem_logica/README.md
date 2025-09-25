### Regras de Normalização

1. **1ª Forma Normal (1FN):** Eliminar grupos repetitivos e garantir que cada campo contenha um único valor
2. **2ª Forma Normal (2FN):** Estar na 1FN e todos os atributos não-chave devem depender totalmente da chave primária
3. **3ª Forma Normal (3FN):** Estar na 2FN e não ter dependências transitivas

### 🔹 1. Atributo Multivalorado

É quando uma entidade pode ter **mais de um valor** para o mesmo atributo.
Exemplo: uma pessoa pode ter **vários telefones**.

👉 **Regra de mapeamento**:

* Criar **uma nova tabela** para representar o atributo multivalorado.
* Essa nova tabela terá:

  * A **PK da entidade original** como **FK**.
  * O atributo multivalorado em si.
  * Como **PK**: a combinação da **FK + o próprio atributo** (ou incluir um identificador se precisar).

**Exemplo:**

* `Pessoa(cod_pessoa, nome, {telefone})`

➡ Modelo relacional:

```sql
Pessoa(cod_pessoa PK, nome)

TelefonePessoa(cod_pessoa PK, telefone PK,
               FOREIGN KEY (cod_pessoa) REFERENCES Pessoa)
```

---

### 🔹 2. Atributo Composto

É um atributo que pode ser decomposto em partes menores.
Exemplo: `endereço` pode ter **rua, número, cidade, CEP**.

👉 **Regra de mapeamento**:

* **Desmembrar** o atributo em seus componentes atômicos (não criar uma nova tabela).
* Apenas os atributos básicos vão para o modelo relacional.

**Exemplo:**

* `Cliente(cod_cliente, nome, endereço(rua, numero, cidade, cep))`

➡ Modelo relacional:

```sql
Cliente(cod_cliente PK, nome, rua, numero, cidade, cep)
```

---

✅ **Resumo geral do mapeamento:**


* **Atributo multivalorado** → vira tabela separada.
* **Atributo composto** → decompõe em atributos simples na mesma tabela.
