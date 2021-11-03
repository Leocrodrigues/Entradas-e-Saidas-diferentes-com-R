## INSTALANDO PACOTES
install.packages("xlsx")
library(xlsx)

#Lendo a base e definindo o indice da col1
excel <- read.xlsx(file = 'dados/reclamacao_2010_2011.xlsx', sheetIndex = 1)

# Outra forma de ler a base usando o xlsx2 e passando o paramtetro strings F
dados_2010 <- read.xlsx2(file = 'dados/reclamacao_2010_2011.xlsx', sheetIndex = 1,stringsAsFactors = F)

dados_2011 <- read.xlsx2(file = 'dados/reclamacao_2010_2011.xlsx', sheetIndex = 1, stringsAsFactors = F)

#verificando o nome das colunas
colnames(dados_2010)

#Tira a ultima a coluna e criando nova base limpa
dados_2010_limpos_excel <- dados_2010[,-17]
dados_2011_limpos_excel <- dados_2011[,-17]


colnames(dados_2010_limpos_excel)

#salvando a base
 
write.xlsx2(x= dados_2010_limpos_excel, file = 'dados/reclamacao_2010_2011_limpo.xlsx',
            row.names = F, sheetName = '2010')

#salando a base 2011 junto com a de 2010
write.xlsx2(x= dados_2011_limpos_excel, file = 'dados/reclamacao_2010_2011_limpo.xlsx',
            row.names = F, sheetName = '2011', append = T)


