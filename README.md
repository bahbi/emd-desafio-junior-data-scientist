# emd-desafio-junior-data-scientist


Neste desafio, realizamos análises exploratórias em conjuntos de dados públicos disponíveis no BigQuery. As respostas para perguntas específicas sobre esses dados foram respondidas utilizando SQL e Python. Além disso, foram criadas visualizações informativas e visualmente atraentes.

## Arquivos

- `perguntas_desafio.md`: Arquivo que contém as perguntas específicas e suas respostas.
- `analise_sql.sql`: Respostas em SQL para as perguntas do desafio. Estas consultas podem ser executadas diretamente no BigQuery.
- `analise_python.ipynb`: Respostas em Python para as perguntas do desafio. Este arquivo pode ser carregado no Google Colab.
-  `Vis_analisePython.ipynb`: Arquivo  contendo visualizações criadas a partir das análises em Python, estas visualizações foram a base para o arquivo `Visualizacao_analisePython.ipynb`.
- `Visualizacao_analisePython.ipynb`: Arquivo  contendo visualizações criadas a partir das análises em Python anexando ao StreamLit.

## Ferramentas e Recursos
Você precisará de acesso ao Google Cloud Platform (GCP) para utilizar o BigQuery e consultar os dados públicos disponíveis no projeto datario. Além disso, vamos utilizar a biblioteca basedosdados em Python para acessar os dados do BigQuery.

Tutorial para acessar dados no BigQuery, desde a criação da conta no GCP até consultar os dados utilizando SQL e Python. Veja mais em [Como acessar dados no BigQuery](https://docs.dados.rio/tutoriais/como-acessar-dados/#acessando-dados-via-bigquery).


## Como Utilizar

1. **Perguntas:**
   - As perguntas específicas estão detalhadas no arquivo `perguntas_desafio.md`.

2. **Análise em SQL:**
   - As consultas em SQL para responder às perguntas estão disponíveis no arquivo `analise_sql.sql`. Elas podem ser carregadas como novo arquivo no BigQuery para execução.

3. **Análise em Python:**
   - O arquivo `analise_python.ipynb` contém a análise realizada em Python. Ele pode ser carregado no Google Colab para interação e execução das análises.

4. **Visualização:**
   - A visualização criada está disponível no arquivo `Vis_analisePython.ipynb`. 
   - A visualização criada está disponível no arquivo `Visualizacao_analisePython.ipynb`.
   - Os dados a serem utilizados nesta parte(em ambas visualizações) estão na pasta `Dados` e são os seguintes: `chamados_parte1.csv`, `chamados_parte2.csv`, `bairros_rj.csv`, `hoteleira_ocupacao.csv`.
   - Verifique se o caminho dos dados estão de acordo no código, caso seja necessário modifique para o funcionamento ser o esperado.
   - O ambiente para rodar este arquivo é o Google Colab.

**Alguns insights captados **

<img src="Captura de tela 2024-02-25 093550.png">

<img src="Captura de tela 2024-02-25 093710.png">


## Notas Adicionais

- Certifique-se de ter acesso aos conjuntos de dados mencionados no BigQuery para executar as consultas SQL.
- Para executar o arquivo Python, é recomendável ter as bibliotecas necessárias instaladas no ambiente de execução (por exemplo, Pandas, Matplotlib, Seaborn).
- Ao visualizar os arquivos, lembre-se de executar as células de código para ver os resultados das análises.

Este desafio proporcionou uma oportunidade de praticar análise de dados utilizando SQL e Python, além de criar visualizações para comunicar insights de forma eficaz.
