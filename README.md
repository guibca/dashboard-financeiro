# dashboard-financeiro
Dashboard com insights referentes ao contas a pagar e contas a receber de uma empresa fictícia do ramo imobiliário.
Esta dashboard foi desenvolvida com o intuito de auxiliar a gestão de valores a receber e a pagar de uma empresa.

Os dados foram gerados de forma aleatória, utilizando Python, conforme scripts entitulados base_cap e base_car.
Assim, foi possível construir um banco de dados com 5 tabelas distintas, armazenadas no Google BigQuery:

(a) Informações referentes ao contas a receber:

		1 - base_clientes
		| Coluna     | Tipo    |
		|------------|---------|
		| id         | INTEGER |
		| nome       | STRING  |
		| sobrenome  | STRING  |
		| imovel     | STRING  |
		| loja       | INTEGER |

		2 - base_imoveis
		| Coluna  | Tipo   |
		|---------|--------|
		| id      | STRING |
		| uf      | STRING |
		| cidade  | STRING |

		3 - base_car (contas a receber)
		| Coluna       | Tipo    |
		|--------------|---------|
		| id           | INTEGER |
		| id_cliente   | INTEGER |
		| valor        | INTEGER |
		| vencimento   | DATE    |

(b) Informações referentes ao contas a pagar:

		4 - base_fornecedores
		| Coluna        | Tipo    |
		|---------------|---------|
		| id            | INTEGER |
		| fornecedor    | STRING  |
		| natureza_fin  | STRING  |

		5 - base_cap (contas a pagar)
		| Coluna         | Tipo    |
		|----------------|---------|
		| id             | INTEGER |
		| id_fornecedor  | INTEGER |
		| valor          | INTEGER |
		| vencimento     | DATE    |

Com as tabelas devidamente geradas, fez-se a consulta SQL disponível no arquivo consulta_sql_cap_car, compilando as informações do banco de dados para fins de otimizar o desempenho da dashboard.

Por fim, os resultados da consulta SQL realizada são utilizados para alimentar uma dashboard interativa construída no Tableau, conforme resultado abaixo:

a- Dashboard Contas a Pagar
<img width="1229" alt="image" src="https://github.com/guibca/dashboard-financeiro/assets/124844502/a63ad65a-b9d6-4320-ab9b-32cecb1c46b5">

b - Dashboard Contas a Receber
<img width="1231" alt="image" src="https://github.com/guibca/dashboard-financeiro/assets/124844502/834c4af3-67ab-4b7f-a8cf-646211ed79e4">

