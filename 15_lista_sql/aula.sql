select * from cliente where cliente.id not in (select cliente_id from cliente_aula);

SELECT * FROM cliente where id in(SELECT id FROM cliente EXCEPT SELECT cliente_id FROM cliente_aula);


SELECT * FROM cliente LEFT JOIN cliente_aula ON cliente.id = cliente_aula.cliente_id WHERE cliente_aula.cliente_id IS NULL;

SELECT cliente.id, cliente.nome FROM cliente LEFT JOIN cliente_aula ON (cliente.id = cliente_aula.cliente_id) GROUP BY cliente.id, cliente.nome having count(cliente_aula.cliente_id) = 0;

SELECT * FROM cliente where id not in (select cliente_id from cliente_plano);

select * from aula where id not in(select DISTINCT aula.id from aula inner join cliente_aula on aula.id = cliente_aula.aula_id);



