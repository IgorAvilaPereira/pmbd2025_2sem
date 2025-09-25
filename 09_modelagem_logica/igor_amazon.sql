-- destruindo o banco caso exista
DROP DATABASE IF EXISTS igor_amazon;

-- criando meu banco
CREATE DATABASE igor_amazon;

-- conectando no banco recem criado
\c igor_amazon;

/*
    Comandos PSQL
    
    // como entrar no SGBD    
    psql -h localhost -U postgres
    
    // conectar depois de logado em um BD especifico
    \c <nome_do_banco>
    
    // como importar script. 
    \i <caminho>/<script>.sql
    
    // listar as tabelas do banco
    \dt
    
    // listar as colunas de cada tabela
    \d <nome_tabela>
*/

-- Comandos SQL de Criacao das Estruturas (DDL): DATA DEFINITION LANGUAGE
-- Comandos SQL de Manipulacao das Tuplas (DML): DATA MANIPULATION LANGUAGE
-- Comandos SQL de Consulta as Tuplas (DQL): DATA QUERY LANGUAGE
-- Comandos SQL de Controle (DCL): DATA CONTROL LANGUAGE

-- criando tabela
CREATE TABLE usuario (
    -- definindo cpf como pk
    cpf character(11) primary key,
    nome character varying(150) not null,
    data_nascimento date
);

-- Inserindo uma tupla/registro/linha na tabela de usuario
INSERT INTO usuario (cpf, nome, data_nascimento) VALUES
('11111111111', 'IGOR PEREIRA', '1987-01-20');


-- inserindo duas ou mais linhas na mesma instrucao INSERT
INSERT INTO usuario (cpf, nome, data_nascimento) VALUES
('22222222222', 'CLEBER', '2000-01-20'),
('33333333333', 'MARCIO', '1900-01-20');


-- Se eu desejar pesquisar na tabela de usuario? Uso o comando SELECT
SELECT nome FROM usuario;

-- WHERE
SELECT * FROM usuario WHERE nome = 'IGOR';

-- buscando por igual + qualquer coisa. LIKE eh case sensitive - Já o ILIKE ignora maiusculos e minusculos
SELECT * FROM usuario WHERE nome ILIKE 'IGOR%';

--  Buscando por nomes que comecam por ig+qualquer um caracter+r+qualquer outra coisa (e n importando se upper or lower case)
SELECT * FROM usuario WHERE nome ILIKE 'IG_R%';

-- calculando a idade de todos os usuarios
SELECT nome, AGE(data_nascimento) FROM usuario;

-- deletando uma tupla especifica (pelo cpf (pk))
DELETE FROM usuario WHERE cpf = '11111111111';

-- atualizando uma tupla especifica
UPDATE usuario SET nome = 'CLEBER FONSECA' WHERE cpf = '22222222222';

-- retornando uma consulta que mostra todas as colunas de todas as tuplas de forma ordenada alfabetica pelo nome 
SELECT * FROM usuario ORDER BY nome ASC;

CREATE TABLE telefone (
    telefone character(11) primary key,
    -- exemplo de uma das formas de como criar uma fk => chave estrangeira
    usuario_cpf character(11) references usuario (cpf)
);

CREATE TABLE endereco (
    cod serial primary key,
    cep character(11) not null,
    -- 200A
    nro character varying(10) not null,
    complemento text,
    bairro character varying(200),
    rua character varying(200)
);
CREATE TABLE usuario_endereco (
    usuario_cpf character(11),
    endereco_cod integer,
    -- outra forma de criar fk
    foreign key (endereco_cod) references endereco (cod),
    -- exemplo de criacao de pk composta: que envolve mais de uma coluna
    primary key (usuario_cpf, endereco_cod) 
);
CREATE TABLE pedido (
    cod serial primary key,
    -- data e hora recebendo por padrao valores atuais tanto de hora como de data
    hora_criacao time default current_time,
    data_criacao date default current_date,
    descricao text,
    usuario_cpf character(11) references usuario (cpf)
);

CREATE TABLE produto (
    cod serial primary key,
    nome character varying(200) not null,
    valor money check(valor::numeric(10,2) >= 0)
);

CREATE TABLE item (
    nro_sequencia integer check (nro_sequencia >=1),
    pedido_cod integer references pedido (cod),
    qtde integer check (qtde >= 0),
    -- aqui um exemplo abaixo de data e hora juntos da mesma coluna
    data_hora_insercao timestamp default current_timestamp,
    -- exemplo de checagem com conversao de tipo - neste caso money vira numero para ser verificado.
    -- ha outras formas de conversao de tipo. ex: em vez de :: posso usar cast(<coluna> as <novo_tipo>). Neste caso, seria algo semelhante a cast(valor_atual as numeric(10,2))
    valor_atual money check(valor_atual::numeric(10,2) >= 0),
    produto_cod integer references produto(cod),
    primary key (nro_sequencia, pedido_cod)
);

