###INSTALANDO PACOTES
install.packages('tidyverse')
install.packages('haven')
library(haven)
library(tidyverse)

#lendo base spss
dados_2012 <- read_spss(file = 'dados/reclamacao_2012.sav')
dados_2012


#analisando a base dados2012
table(dados_2012$SexoConsumidor)

#normalizando os dados
dados_2012_limpos <- dados_2012

#alterando o nome da variavel feminino para F
dados_2012_limpos$SexoConsumidor <- gsub('feminino', 'F', dados_2012_limpos$SexoConsumidor)
dados_2012_limpos$SexoConsumidor

#fazendo o mesmo para o sexo masculino
dados_2012_limpos$SexoConsumidor <- gsub('masculino', 'M', dados_2012_limpos$SexoConsumidor)
dados_2012_limpos$SexoConsumidor

table(dados_2012_limpos$SexoConsumidor)

#salvado a base de dados 2012
write_sav(dados_2012_limpos, 'dados/reclamacao_2012_limpos.sav')
####################################################################################################

#### lendo base sas dados 2013 ####
dados_2013 <- read_sas("dados/reclamacao_2013.sas7bdat")
dados_2013

# verificando a quantidade na variavel 
table(dados_2013$SexoConsumidor)

#normalizando os dados
dados_2013_limpos <- dados_2013

#alterando o nome da variavel feminino para F
dados_2013_limpos$SexoConsumidor <- gsub('feminino', 'F', dados_2013_limpos$SexoConsumidor)
dados_2013_limpos$SexoConsumidor

#fazendo o mesmo para o sexo masculino
dados_2013_limpos$SexoConsumidor <- gsub('masculino', 'M', dados_2013_limpos$SexoConsumidor)
dados_2013_limpos$SexoConsumidor


#salvado a base de dados 2013
write_sas(dados_2013_limpos, 'dados/reclamacao_2012_limpos.sas')


