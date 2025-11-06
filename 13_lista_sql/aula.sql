ALTER TABLE cliente ADD COLUMN data_cadastro timestamp DEFAULT current_timestamp;

SELECT nome FROM cliente where data_cadastro >= '2025-11-07';

SELECT * FROM cliente where extract(year from data_cadastro) = EXTRACT(year from current_Date);

INSERT INTO atividade (nome, duracao) VALUES ('MUSCULAÇÃO','01:00');
INSERT INTO plano (nome, duracao, valor) values ('plano fitness - 2', 1, 101);

select * from plano where valor >= cast(101 as money);
ALTER TABLE cliente ADD column email text unique; select * from cliente where data_cadastro > '2024-01-01' and email like '%@gmail.com';

INSERT INTO professor (cpf, nome) VALUES ('88888888888', 'BAMBAM');
ALTER TABLE professor add column data_contratacao timestamp default current_timestamp;

SELECT * FROM professor where extract(year from data_contratacao) != 2024;


