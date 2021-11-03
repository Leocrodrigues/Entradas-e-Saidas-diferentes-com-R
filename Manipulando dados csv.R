## INSTALANDO PACOTES
install.packages('tidyverse')
install.packages("datatable")
library(data.table)
library(tidyverse)

## Lendo a base de dados
dados_2014 <- read.csv('dados/reclamacao_2014.csv', sep= ';', stringsAsFactors=F, encoding = 'Latin-1')
dados_2014

dados_2015 <- read.csv2('dados/reclamacao_2015.csv',sep=',', stringsAsFactors=F, encoding = 'UTF-8')
dados_2015

dados_2016 <- fread('dados/reclamacao_2016.csv', encoding = 'UTF-8')
dados_2016

#visulizando os dados 2014
table(dados_2014$Atendida)

#alterando o nome das colunas sim e nao

#criando a nova base
dados_2014_limpos <- dados_2014

#alterando o nome das observaçoes
dados_2014_limpos$Atendida <- gsub('nao','N', dados_2014_limpos$Atendida)
dados_2014_limpos$Atendida <- gsub('sim', 'S', dados_2014_limpos$Atendida)

#visualizando
table(dados_2014_limpos$Atendida)

#salvando sem o nome das linhas e sep por |
write.csv(x = dados_2014_limpos, 'dados/reclamacao_2014_limpos.csv', row.names=F, sep='|')


#visulizando os dados de 2015
table(dados_2015$Atendida)

#alterando o nome das colunas sim e nao

#criando a nova base
dados_2015_limpos <- dados_2015

#alterando o nome das observaçoes
dados_2015_limpos$Atendida <- gsub('nao','N', dados_2015_limpos$Atendida)
dados_2015_limpos$Atendida <- gsub('sim', 'S', dados_2015_limpos$Atendida)

#visualizando
table(dados_2015_limpos$Atendida)

#salvando sem o nome das linhas
write.csv2(x = dados_2015_limpos, 'dados/reclamacao_2015_limpos.csv', row.names=F)


#visulizando os dados de 2016
table(dados_2016$Atendida)

#alterando o nome das colunas sim e nao

#criando a nova base
dados_2016_limpos <- dados_2016

#alterando o nome das observaçoes
dados_2016_limpos$Atendida <- gsub('nao','N', dados_2016_limpos$Atendida)
dados_2016_limpos$Atendida <- gsub('sim', 'S', dados_2016_limpos$Atendida)

#visualizando
table(dados_2016_limpos$Atendida)

#salvando sem o nome das linhas e quote para colocar aspas em textp
fwrite(x = dados_2016_limpos, 'dados/reclamacao_2016_limpos.csv', row.names=F, quote=T)



