###################################### INSTALAÇÃO DE PACOTES ###################################
install.packages("RJSONIO")
install.packages("jsonlite")
library(jsonlite)
library(RJSONIO)

#Fazeno leitura da base
reclamacao_2009 <- fromJSON('dados/reclamacao_2009.json')

#ler linha a linha e concatenar pois deu erro na leitura da base antes
reclamacao_string <- paste(readLines('dados/reclamacao_2009.json'), collapse = '')

# Agora podemos ler a base
reclamacao_2009 <- fromJSON(reclamacao_string)

reclamacao_2009 <- RJSONIO::fromJSON('dados/reclamacao_2009.json')

reclamacao_2009[1]

# Carregando os dados usando enconding utf 8
reclamacao_2009_2 <- RJSONIO::fromJSON('dados/reclamacao_2009.json', encoding = 'utf-8')
reclamacao_2009_2

#vamos tentar com outro modo
reclamacao_2009_2 <- RJSONIO::fromJSON('dados/reclamacao_2009.json', encoding = 'latin1')
reclamacao_2009_2

#Nesse caso o latin 1 foi o melhor, pois n altera os caracteres no arquivo

#### TRANSFORMANDO A LISTA EM UM DATAFRAME ####

#instalando pacte
install.packages("datatable")
library(data.table)

#criando dataframe
dados_2009 <- rbindlist(l = reclamacao_2009_2, fill = T)

#removendo variaveis
rm(relcamacao_2009_2, relcamacao_20092, reclamacao_string)

#fazendo contagem de valores unicos na tabela
table(dados_2009$UF)

#criando um novo df sem os dados ND na UF
dados_2009_limpos <- dados_2009[dados_2009$UF != 'N/D',]

table(dados_2009_limpos$UF)

#convertendo os dados para json com jsonlote
sub_json <- jsonlite::toJSON(dados_2009_limpos)

#salvado os dados 
write(sub_json, "dados/reclamacao_2009_limpos.json")

#salvando com RJSONIO 
sub_json <- RJSONIO::toJSON(dados_2009_limpos)
write(sub_json, "dados/reclamacao_2009_limpos.json")

### VERIFICANDO A DIFERENÇA ENTRE JSONLITE RJSONIO

jsonlite <- jsonlite::toJSON(dados_2009_limpos[1:10,],pretty = T)
jsonlite

rjsonio <- RJSONIO::toJSON(dados_2009_limpos[1:10,], pretty = T)
rjsonio

#salvando os dados nos dois formatos
write(jsonlite,'dados/jsonlite_2009.json')

write(rjsonio,'dados/rjsonio_2009.json')

##removendo agora
rm(jsonlite, jsonlite,reclamacao_2009, reclamacao_2009_2, dados_2009)
rm(rjsonio, sub_json)



