### INSTALANDO PACOTE
install.packages('RMySQL')
library(RMySQL)


banco_dados <- dbConnect(MySQL(), user = 'RODRIGUESLEO', password = '*****', 
                          dbname='SUCOS_VENDAS', host='localhost')

banco_dados

#listando as tabelas
dbListTables(banco_dados)

dados_2017 <- dbGetQuery(conn= banco_dados,'select * from dados_2017')


#juntando todas as bases

merge_dados <- rbindd(dados_2009_limpos,dados_2010_limpos,
                      dados_2011_limpos,dados_2012_limpos,
                      dados_2013_limpos,dados_2014_limpos,
                      dados_2015_limpos,dados_2016_limpos,
                      dados_2017_limpos)

fwrite(merge_dados, 'dados/todas_reclamacoes.csv', quote=T, row.names=F)