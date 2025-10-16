DROP DATABASE IF EXISTS atividade1;

CREATE DATABASE atividade1;

\c atividade1;

CREATE TABLE cliente (
    id serial primary key,
    nome character varying(150) not null,
    email character varying(150) not null,
    data_cadastro date default current_date,
    unique(email)
);
INSERT INTO cliente (nome, email) VALUES
('IGOR AVILA PEREIRA', 'igor.pereira@riogrande.ifrs.edu.br');

CREATE TABLE plano (
    id serial primary key,
    nome text not null,
    valor_mensal money 
);
INSERT INTO plano (nome, valor_mensal) VALUES
('PLANO MILAGROSO', 1.99);

CREATE TABLE cliente_plano  (
    cliente_id integer references cliente (id),
    plano_id integer references plano (id),
    data_hora_inscricao timestamp default current_timestamp,
    data_hora_fim timestamp,
    primary key (cliente_id, plano_id, data_hora_inscricao)
);
INSERT INTO cliente_plano (cliente_id, plano_id) VALUES
(1, 1);

CREATE TABLE instrutor (
    id serial primary key,
    nome character varying(200) not null,
    data_admissao date default current_date
);
INSERT INTO instrutor (nome) VALUES
('CB');

CREATE TABLE aula (
    id serial primary key,
    horario time,
    nome character varying(200) not null,
    instrutor_id integer references instrutor (id)
);
INSERT INTO aula (nome, horario, instrutor_id) VALUES
('AULA DE ZUMBA', '20:00', 1);

CREATE TABLE cliente_aula (
    cliente_id integer references cliente (id),
    aula_id integer references aula (id),
    data_hora timestamp default current_timestamp,
    presente boolean default false,
    primary key(cliente_id, aula_id, data_hora)
);
INSERT INTO cliente_aula (cliente_id, aula_id, presente) VALUES
(1,1, TRUE);



