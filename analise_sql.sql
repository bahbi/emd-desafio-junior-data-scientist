

SELECT COUNT(id_chamado) AS total_chamados # Resposta 1
FROM `datario.administracao_servicos_publicos.chamado_1746`
WHERE DATE(data_inicio) = "2023-04-01";

SELECT tipo, COUNT(id_chamado) AS total_reclamacoes # Resposta 2
FROM `datario.administracao_servicos_publicos.chamado_1746`
WHERE DATE(data_inicio) = "2023-04-01"
GROUP BY tipo
ORDER BY total_reclamacoes DESC
LIMIT 1;


SELECT b.nome AS nome_bairro, b.subprefeitura, COUNT(c.id_chamado) AS total_chamados #resposta 3
FROM `datario.administracao_servicos_publicos.chamado_1746` AS c
JOIN `datario.dados_mestres.bairro` AS b
ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = "2023-04-01"
GROUP BY b.nome, b.subprefeitura
ORDER BY total_chamados DESC
LIMIT 3;

SELECT b.subprefeitura, COUNT(c.id_chamado) AS total_chamados #Resposta 4
FROM `datario.administracao_servicos_publicos.chamado_1746` AS c
JOIN `datario.dados_mestres.bairro` AS b
ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = "2023-04-01"
GROUP BY b.subprefeitura
ORDER BY total_chamados DESC
LIMIT 1;


SELECT * #Resposta 5
FROM `datario.administracao_servicos_publicos.chamado_1746` AS c 
LEFT JOIN `datario.dados_mestres.bairro` AS b
ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = "2023-04-01"
AND b.id_bairro IS NULL;


SELECT COUNT(*) AS total_chamados #questão 6
FROM `datario.administracao_servicos_publicos.chamado_1746`
WHERE subtipo = 'Perturbação do sossego'
AND data_inicio BETWEEN '2022-01-01' AND '2023-12-31';


SELECT chamado.* #resposta 7
FROM `datario.administracao_servicos_publicos.chamado_1746` AS chamado
JOIN `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos` AS evento
ON chamado.data_inicio BETWEEN evento.data_inicial AND evento.data_final
WHERE chamado.subtipo = 'Perturbação do sossego';


SELECT evento, COUNT(id_chamado) AS num_chamados #resposta 8 
FROM (
    SELECT id_chamado, evento.evento
    FROM `datario.administracao_servicos_publicos.chamado_1746` AS chamado
    JOIN `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos` AS evento
    ON chamado.data_inicio BETWEEN evento.data_inicial AND evento.data_final
    WHERE chamado.subtipo = 'Perturbação do sossego'
) AS subquery
GROUP BY evento;




WITH chamados AS ( #resposta 9
  SELECT
    evento,
    COUNT(id_chamado) AS num_chamados
  FROM (
    SELECT
      id_chamado,
      evento.evento
    FROM
      `datario.administracao_servicos_publicos.chamado_1746` AS chamado
    JOIN
      `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos` AS evento
    ON
      chamado.data_inicio BETWEEN evento.data_inicial AND evento.data_final
    WHERE
      chamado.subtipo = 'Perturbação do sossego'
  ) AS subquery
  GROUP BY
    evento
),
dias AS (
  SELECT
    evento,
    SUM(DATE_DIFF(data_final, data_inicial, DAY) + 1) AS total_dias
  FROM
    `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos`
  GROUP BY
    evento
),
medias AS (
  SELECT
    chamados.evento,
    chamados.num_chamados,
    dias.total_dias,
    chamados.num_chamados / dias.total_dias AS media_diaria
  FROM
    chamados
  JOIN
    dias
  ON
    chamados.evento = dias.evento
)
SELECT *
FROM
  medias
WHERE
  media_diaria = (SELECT MAX(media_diaria) FROM medias);


WITH subtipo_periodo AS ( #resposta 10
  SELECT
    COUNT(id_chamado) AS total_chamados,
    DATE_DIFF('2023-12-31', '2022-01-01', DAY) + 1 AS total_dias
  FROM 
    `datario.administracao_servicos_publicos.chamado_1746`
  WHERE 
    subtipo = 'Perturbação do sossego'
    AND data_inicio BETWEEN '2022-01-01' AND '2023-12-31'
)
SELECT 
  total_chamados,
  total_dias,
  total_chamados / total_dias AS media_diaria
FROM 
  subtipo_periodo;



WITH chamados AS (
  SELECT
    evento,
    COUNT(id_chamado) AS num_chamados
  FROM (
    SELECT
      id_chamado,
      evento.evento
    FROM
      `datario.administracao_servicos_publicos.chamado_1746` AS chamado
    JOIN
      `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos` AS evento
    ON
      chamado.data_inicio BETWEEN evento.data_inicial AND evento.data_final
    WHERE
      chamado.subtipo = 'Perturbação do sossego'
  ) AS subquery
  GROUP BY
    evento
), 

dias AS (
  SELECT
    evento,
    SUM(DATE_DIFF(data_final, data_inicial, DAY) + 1) AS total_dias
  FROM
    `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos`
  GROUP BY
    evento
),

subtipo_periodo AS (
  SELECT
    COUNT(id_chamado) AS total_chamados,
    DATE_DIFF('2023-12-31', '2022-01-01', DAY) + 1 AS total_dias
  FROM 
    `datario.administracao_servicos_publicos.chamado_1746`
  WHERE 
    subtipo = 'Perturbação do sossego'
    AND data_inicio BETWEEN '2022-01-01' AND '2023-12-31'
)

SELECT
  chamados.evento,
  chamados.num_chamados,
  dias.total_dias,
  chamados.num_chamados / dias.total_dias AS media_diaria
FROM 
  chamados
JOIN 
  dias ON chamados.evento = dias.evento

UNION ALL

SELECT
  'Total de Chamados' AS evento,
  total_chamados,
  total_dias,
  total_chamados / total_dias AS media_diaria
FROM 
  subtipo_periodo;

