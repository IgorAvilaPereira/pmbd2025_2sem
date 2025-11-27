-- 🔹 9. Definição e alteração de estrutura (DDL)

-- 32
CREATE TABLE equipamento (
    id serial primary key,
    nome text not null,
    tipo character(1) check(tipo in ('P', 'C', 'R')),
    data_aquisicao date default current_date
);

INSERT INTO equipamento (nome, tipo) VALUES
('LEG PRESS', 'P');

-- 33
ALTER TABLE cliente ADD COLUMN rg character varying(12);

-- 34
ALTER TABLE plano RENAME valor TO preco_mensal;

-- 35
DROP TABLE equipamento;

--  10. Funções de texto e data
-- 36
select 
    case 
        when position(' ' in trim(nome)) = 0 then trim(nome)
        when position(' ' in trim(nome)) > 0 then substring(trim(nome) from 1 for position(' ' in trim(nome)))
    end as n from cliente;

select 
    case 
        when position(' ' in trim(nome)) = 0 then trim(nome)
    else
        substring(trim(nome) from 1 for position(' ' in trim(nome)))
    end as n from cliente;
    
    
-- 37
ALTER TABLE professor ADD COLUMN data_contratacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
select nome, extract(year from data_contratacao) as ano from professor;

-- 37 com gambiarra! n faca! n fui eu que disse que assim funciona!
select nome, substring(cast(data_contratacao as text) from 1 for 4) as ano from professor;

select nome, substring(data_contratacao::text from 1 for 4) as ano from professor;

-- dica da semana
-- select nome, extract(dow from data_contratacao) as ano from professor;
-- ex: 4

-- dia do ano
-- select nome, extract(doy from data_contratacao) as ano from professor;
-- ex: 310

-- 38
 SELECT * FROM cliente where email is null or email NOT ILIKE '%hotmail%';
 
/*

ILIKE => não importa se é maiúsculo ou minúsculo!

'%hotmail%' => qualquer cadeira de caracteres antes e depois de hotmail

'%hotmail_' => qualquer cadeira de caracteres antes e apenas um outro caracter depois 

'%h___mail%' => 
*/

-- 39
select * from cliente order by data_cadastro DESC;

-- 40
select upper(nome) as n_maiusculo from atividade;



