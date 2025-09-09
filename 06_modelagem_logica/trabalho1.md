# Trabalho 1 

## 1. Contexto do Problema

Imagine que você precisa modelar um sistema para uma **empresa de entregas rápidas**. O sistema deve armazenar informações sobre:

* Clientes,
* Entregadores,
* Pedidos de entrega,
* Veículos usados para entregas,
* Rotas realizadas.

Regras importantes:

* Um cliente pode fazer vários pedidos.
* Cada pedido está associado a apenas um cliente e um entregador.
* Um entregador pode usar diferentes veículos ao longo do tempo, mas em um pedido específico ele usa apenas um veículo.
* Cada pedido possui uma rota que contém vários pontos de parada (endereços).
* Um veículo pode ser utilizado por vários entregadores em diferentes pedidos.

---

## Entidades e seus atributos

* **Cliente**

  * ID\_Cliente
  * Nome
  * Telefone
  * Email

* **Entregador**

  * ID\_Entregador
  * Nome
  * CPF
  * Telefone

* **Veículo**

  * ID\_Veiculo
  * Placa
  * Modelo
  * Capacidade

* **Pedido**

  * ID\_Pedido
  * Data\_Pedido
  * Status

* **Rota**

  * ID\_Rota
  * Descrição

* **Ponto de Parada**

  * ID\_Ponto
  * Endereço
  * Sequência

---

## Relacionamentos

* Um **Cliente** pode realizar vários **Pedidos** (1\:N).
* Um **Entregador** pode realizar vários **Pedidos** (1\:N).
* Um **Veículo** pode ser utilizado em vários **Pedidos** (1\:N).
* Cada **Pedido** tem uma única **Rota** (1:1).
* Uma **Rota** é composta por vários **Pontos de Parada** (1\:N).

---

### Observação:

Este trabalho exige que o aluno realize:

* A **modelagem conceitual (ER)** considerando as entidades, atributos e relacionamentos acima.
* O **mapeamento para o modelo lógico relacional**, inferindo as chaves estrangeiras necessárias para implementar os relacionamentos.


