#abro libreria para leer archivo excel
library(readxl)
library(ggplot2)

#seteo la direccion local donde estoy trabajando
setwd("/home/tincho/Desktop/R cienca de datos/Tp final/Analisis-Exploratorio-de-Datos")

#leo archivo y lo veo
edusex <- readxl::read_excel("Educacion Sexual.xlsx")
View(edusex)
head(edusex)
class(edusex)

#Analizo la estructura
str(edusex)
#Veo que es un Data frame de 15,157 x 6 con las variables Id,edad
#anios_educ, en_pareja, num_hijos, bajo_socioecon

#hago el resumen estadistico rapido
summary(edusex)
head(edusex, n= 10) #muestro las primeras 10 filas
#Veo que son datos dbl (numeros reales)

