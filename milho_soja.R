# MikiIkeda_RM559882_fase2_cap7
# link do repositório no Github: https://github.com/m1k11k3d4/fiap_cap7.git
#carregar pacotes
library(readxl)
library(ggplot2)
library(tidyr)

#como o arquivo está no mesmo diretório que o programa, basta usar o nome do arquivo
arquivo_excel <- "milho_soja.xlsx"

#carregar os dados da planilha (colunas F4:F31 e G4:G31)
dados <- read_excel(arquivo_excel, range = "F4:G31", col_names = c("Milho", "Soja"))

#converter colunas para numéricas, ignorando possíveis erros de conversão
dados$Milho <- as.numeric(dados$Milho)
dados$Soja <- as.numeric(dados$Soja)

#remover linhas que contenham valores ausentes (NA)
dados <- na.omit(dados)

#função para formatar números (remover notação científica e adicionar separador de milhar e decimal)
formatar_numero <- function(x) {
  format(x, big.mark = ".", decimal.mark = ",", scientific = FALSE, nsmall = 2)
}

#medidas de Tendência Central
tendencia_central <- function(x) {
  list(
    Media = mean(x, na.rm = TRUE),
    Mediana = median(x, na.rm = TRUE),
    Moda = as.numeric(names(sort(table(x), decreasing = TRUE))[1])
  )
}

#medidas de Dispersão
dispersao <- function(x) {
  list(
    Variancia = var(x, na.rm = TRUE),
    Desvio_Padrao = sd(x, na.rm = TRUE),
    Amplitude = diff(range(x, na.rm = TRUE))
  )
}

#medidas Separatrizes (Quartis)
separatrizes <- function(x) {
  list(
    Quartis = quantile(x, probs = c(0.25, 0.5, 0.75), na.rm = TRUE)
  )
}

#função para exibir os resultados de forma organizada
print_estatisticas <- function(nome, estatisticas) {
  cat("\n", nome, "\n")
  cat("============================\n")
  cat("Medidas de Tendência Central\n")
  cat("----------------------------\n")
  cat("Média:", formatar_numero(estatisticas$Tendencia_Central$Media), "\n")
  cat("Mediana:", formatar_numero(estatisticas$Tendencia_Central$Mediana), "\n")
  cat("Moda:", formatar_numero(estatisticas$Tendencia_Central$Moda), "\n\n")
  
  cat("Medidas de Dispersão\n")
  cat("----------------------------\n")
  cat("Variância:", formatar_numero(estatisticas$Dispersao$Variancia), "\n")
  cat("Desvio Padrão:", formatar_numero(estatisticas$Dispersao$Desvio_Padrao), "\n")
  cat("Amplitude:", formatar_numero(estatisticas$Dispersao$Amplitude), "\n\n")
  
  cat("Medidas Separatrizes (Quartis)\n")
  cat("----------------------------\n")
  cat("1º Quartil (25%):", formatar_numero(estatisticas$Separatrizes$Quartis[1]), "\n")
  cat("2º Quartil (50% - Mediana):", formatar_numero(estatisticas$Separatrizes$Quartis[2]), "\n")
  cat("3º Quartil (75%):", formatar_numero(estatisticas$Separatrizes$Quartis[3]), "\n")
  cat("============================\n\n")
}

#calcular as estatísticas para Milho e Soja
estatisticas_milho <- list(
  Tendencia_Central = tendencia_central(dados$Milho),
  Dispersao = dispersao(dados$Milho),
  Separatrizes = separatrizes(dados$Milho)
)

estatisticas_soja <- list(
  Tendencia_Central = tendencia_central(dados$Soja),
  Dispersao = dispersao(dados$Soja),
  Separatrizes = separatrizes(dados$Soja)
)

#exibir os resultados
print_estatisticas("Estatísticas para Milho", estatisticas_milho)
print_estatisticas("Estatísticas para Soja", estatisticas_soja)

#criar o gráfico após os valores serem mostrados
#carregar dados da planilha para o gráfico (colunas C4:C31, F4:F31 e G4:G31)
dados_grafico <- read_excel(arquivo_excel, range = "C4:G31")

#renomear colunas
colnames(dados_grafico) <- c("Regiao", "Milho", "Soja")

#substituir valores ausentes por 0
dados_grafico$Milho[is.na(dados_grafico$Milho)] <- 0
dados_grafico$Soja[is.na(dados_grafico$Soja)] <- 0

#transformar dados em formato longo para plotagem
dados_long <- gather(dados_grafico, key = "Produto", value = "Produção", Milho, Soja)

#criar gráfico de barras
grafico <- ggplot(dados_long, aes(x = Regiao, y = Produção, fill = Produto)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Produção de Milho e Soja por Região",
       x = "Região",
       y = "Produção (toneladas)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#exibir o gráfico na tela
print(grafico)

#salvar o gráfico em PDF
ggsave("grafico_milho_soja.pdf", plot = grafico, width = 10, height = 6)

#imprimir mensagem de espera e abrir o PDF após 10 segundos
cat("Abrindo o gráfico em 10 segundos...\n")
Sys.sleep(10)
browseURL("grafico_milho_soja.pdf")
