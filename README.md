# FIAP - Faculdade de Informática e Administração Paulista

<p align="center">
<a href= "https://www.fiap.com.br/"><img src="assets/logo-fiap.png" alt="FIAP - Faculdade de Informática e Admnistração Paulista" border="0" width=40% height=40%></a>
</p>

<br>

# Cap 7 - Decolando com ciências de dados

## Nome do grupo

## 👨‍🎓 Integrantes: 
- <a href="www.linkedin.com/in/miki-ikeda-siscof">Miki Ikeda 1</a>

## 👩‍🏫 Professores:
### Tutor(a) 
- <a href="https://www.linkedin.com/company/inova-fusca">Lucas Gomes Moreira</a>
### Coordenador(a)
- <a href="https://www.linkedin.com/company/inova-fusca">André Godoi Chiovato</a>


## 📜 Descrição

Este repositório contém scripts desenvolvidos em R para análise estatística e visualização de dados de produção de milho e soja em diversas regiões do Brasil. O projeto utiliza um arquivo Excel com informações detalhadas sobre a área colhida, produção em toneladas, quantidade de sacas (60kg), produção (kg/ha) e faixa de produção , e realiza uma série de cálculos estatísticos, gerando gráfico de Produção de Milho e Soja por Região para facilitar a interpretação dos resultados. 

## Fonte dos Dados

Os dados usados para criar o arquivo milho_soja.xlsx foram obtidos do Sistema IBGE de Recuperação Automática (SIDRA) link: https://sidra.ibge.gov.br/tabela/5457, que fornece informações detalhadas sobre a produção agrícola no Brasil. O arquivo contém dados relacionados à área plantada, área colhida, produção e rendimento de milho e soja por estado.

## Classificação das Variáveis Utilizadas
No arquivo milho_soja.xlsx, foram utilizadas diferentes classificações de variáveis, de acordo com suas características:

1. Variável Quantitativa Discreta:

- Quantidade de Sacas (60kg): número de sacas produzidas, que é uma contagem exata, representando uma variável numérica discreta.

2. Variável Quantitativa Contínua:

- Área Colhida (hectares): área total em hectares das culturas colhidas, uma variável que pode assumir valores contínuos.
- Produção (toneladas): total de produção em toneladas, uma medida contínua que representa a quantidade de milho e soja colhida.

3. Variável Qualitativa Nominal:

- Região: a unidade federativa (UF) ou região onde as culturas foram colhidas, categorizada como uma variável nominal, sem ordem definida entre os elementos.

4. Variável Qualitativa Ordinal:

- Faixa de Produção (Baixa, Média, Alta): a classificação ordinal da produção de milho e soja foi definida com base na quantidade produzida por hectare (kg/ha), utilizando os seguintes intervalos:
Baixa: produção menor que 2500 kg/ha;
Média: produção entre 2500 e 4000 kg/ha;
Alta: produção maior que 4000 kg/ha.

Essas variáveis foram analisadas ao longo do projeto para extrair informações úteis sobre a produção de milho e soja no Brasil.

## 📁 Estrutura de pastas

Dentre os arquivos e pastas presentes na raiz do projeto, definem-se:

- <b>.github</b>: Nesta pasta ficarão os arquivos de configuração específicos do GitHub que ajudam a gerenciar e automatizar processos no repositório.

- <b>assets</b>: aqui estão os arquivos relacionados a elementos não-estruturados deste repositório, como imagens.

- <b>config</b>: Posicione aqui arquivos de configuração que são usados para definir parâmetros e ajustes do projeto.

- <b>document</b>: aqui estão todos os documentos do projeto que as atividades poderão pedir. Na subpasta "other", adicione documentos complementares e menos importantes.

- <b>scripts</b>: Posicione aqui scripts auxiliares para tarefas específicas do seu projeto. Exemplo: deploy, migrações de banco de dados, backups.

- <b>src</b>: Todo o código fonte criado para o desenvolvimento do projeto ao longo das 7 fases.

- <b>README.md</b>: arquivo que serve como guia e explicação geral sobre o projeto (o mesmo que você está lendo agora).

## Funcionalidades
Leitura de Arquivo Excel: O script lê os dados diretamente de um arquivo milho_soja.xlsx, contendo as colunas referentes à produção de milho e soja.
Cálculos Estatísticos: Funções em R foram desenvolvidas para calcular as principais medidas estatísticas das culturas analisadas.
Visualização Gráfica: A biblioteca ggplot2 é utilizada para gerar gráficos de barras que comparam a produção entre as regiões.
Automação da Visualização: O gráfico gerado é salvo como grafico_milho_soja.pdf e aberto automaticamente 10 segundos após a exibição dos cálculos estatísticos.

## 🔧 Como executar o código

1. Pré-requisitos: Certifique-se de ter os pacotes readxl, ggplot2 e tidyr instalados no seu ambiente R. Você pode instalá-los com os seguintes comandos:
   ```sh
   install.packages("readxl")
   install.packages("ggplot2")
   install.packages("tidyr")
    ```
2. Execução: Execute o script milho_soja.R. O script carregará o arquivo milho_soja.xlsx e realizará os seguintes passos:

Exibirá as medidas de tendência central, dispersão e separatrizes na tela.
Criará um gráfico comparativo de produção de milho e soja por região.
O gráfico será salvo como grafico_milho_soja.pdf e aberto automaticamente após 10 segundos.

3. O script exibirá as estatísticas calculadas diretamente no terminal e abrirá o gráfico gerado no PDF.

## Exemplo de Execução
Após a execução do script, você verá os resultados estatísticos formatados da seguinte maneira:
   ```sh
Estatísticas para Milho
============================
Medidas de Tendência Central
----------------------------
Média: 4.712.508,79
Mediana: 1.289.831,00
Moda: 0,00

Medidas de Dispersão
----------------------------
Variância: 102.329.797.170.074,09
Desvio Padrão: 10.115.819,15
Amplitude: 50.241.972,00

Medidas Separatrizes (Quartis)
----------------------------
1º Quartil (25%): 64.533,50
2º Quartil (50% - Mediana): 1.289.831,00
3º Quartil (75%): 3.312.917,00
============================
    ```


## 📋 Licença

<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1"><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1"><p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/"><a property="dct:title" rel="cc:attributionURL" href="https://github.com/agodoi/template">MODELO GIT FIAP</a> por <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://fiap.com.br">Fiap</a> está licenciado sobre <a href="http://creativecommons.org/licenses/by/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">Attribution 4.0 International</a>.</p>


