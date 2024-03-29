#CONTAS A PAGAR
#Tabela: Fornecedor x Nat Financeira x Valor x Vencimento
SELECT
  bf.fornecedor,
  bf.natureza_fin,
  SUM(bcap.valor) AS valor,
  bcap.vencimento,
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM bcap.vencimento) = 1 THEN 'dom'
    WHEN EXTRACT(DAYOFWEEK FROM bcap.vencimento) = 2 THEN 'seg'
    WHEN EXTRACT(DAYOFWEEK FROM bcap.vencimento) = 3 THEN 'ter'
    WHEN EXTRACT(DAYOFWEEK FROM bcap.vencimento) = 4 THEN 'qua'
    WHEN EXTRACT(DAYOFWEEK FROM bcap.vencimento) = 5 THEN 'qui'
    WHEN EXTRACT(DAYOFWEEK FROM bcap.vencimento) = 6 THEN 'sex'
    WHEN EXTRACT(DAYOFWEEK FROM bcap.vencimento) = 7 THEN 'sab'
    END AS dia_semana,
EXTRACT (WEEK FROM bcap.vencimento) AS semana
FROM projeto_car_cap.base_cap AS bcap
JOIN projeto_car_cap.base_fornecedores AS bf ON bf.id = bcap.id_fornecedor
GROUP BY semana, bcap.vencimento, dia_semana, bf.fornecedor, bf.natureza_fin;

#CONTAS A RECEBER
#Tabela: Cidade x Estado x Faturamento x Data
SELECT
  bcar.vencimento,
    CASE
    WHEN EXTRACT(DAYOFWEEK FROM bcar.vencimento) = 1 THEN 'dom'
    WHEN EXTRACT(DAYOFWEEK FROM bcar.vencimento) = 2 THEN 'seg'
    WHEN EXTRACT(DAYOFWEEK FROM bcar.vencimento) = 3 THEN 'ter'
    WHEN EXTRACT(DAYOFWEEK FROM bcar.vencimento) = 4 THEN 'qua'
    WHEN EXTRACT(DAYOFWEEK FROM bcar.vencimento) = 5 THEN 'qui'
    WHEN EXTRACT(DAYOFWEEK FROM bcar.vencimento) = 6 THEN 'sex'
    WHEN EXTRACT(DAYOFWEEK FROM bcar.vencimento) = 7 THEN 'sab'
    END AS dia_semana,
  EXTRACT (WEEK FROM bcar.vencimento) AS semana,
  bimv.cidade,
  bimv.uf,
  SUM(bcar.valor) AS valor
FROM projeto_car_cap.base_car AS bcar
JOIN projeto_car_cap.base_clientes AS bcli ON bcli.id = bcar.id_cliente
JOIN projeto_car_cap.base_imoveis AS bimv ON bimv.id = bcli.imovel
GROUP BY semana, bcar.vencimento, dia_semana, bimv.cidade, bimv.uf

