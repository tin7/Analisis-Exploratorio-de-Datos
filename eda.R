#abro libreria para leer archivo excel
library(readxl)
library(ggplot2)
library(plotly)
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

#frecuencias %
frec1 <- table(edusex$edad)/length(edusex$edad)
frec1
frec2 <- table(edusex$anios_educ)/length(edusex$anios_educ)
frec2
frec3 <- table(edusex$en_pareja)/length(edusex$en_pareja)
frec3
frec4 <- table(edusex$bajo_socioecon)/length(edusex$bajo_socioecon)
frec4

#Histogramas
histograma <- ggplot(edusex, aes(x=edad)) +
  ggtitle("Edades de las personas encuestadas") +
  geom_histogram(color="#28324a", fill="#3c78d8", bins=30)
histograma

histogramaanios <- ggplot(edusex, aes(x=anios_educ)) +
  ggtitle("Años de Educacion") +
  geom_histogram(color="#28324a", fill="#3c78d8", bins=30)
histogramaanios

histogramapareja <- ggplot(edusex, aes(x=en_pareja)) +
  ggtitle("Estado civil") +
  geom_histogram(color="#28324a", fill="#3c78d8", bins=30)
histogramapareja

histogramaecon <- ggplot(edusex, aes(x=bajo_socioecon)) +
  ggtitle("Bajo estado socioeconomico") +
  geom_histogram(color="#28324a", fill="#3c78d8", bins=10)
histogramaecon


#boxplot
boxplot(edusex$edad,edusex$anios_educ,main="Boxplot edad y años de educacion")
#boxplot(edusex$num_hijos,edusex$bajo_socioecon,main="Boxplot cant. de hijos, Estado socioeconomico")

## Test para el coef. de correlacion
cor.test(x=edusex$edad, y=edusex$anios_educ, method = "pearson")

## Ajusto la regresion lineal
Reg_Lineal_G <- lm(anios_educ ~ edad, data=edusex)
summary(Reg_Lineal_G)

## Grafico
plot(x=edusex$edad, y=edusex$anios_educ, main="anios_educ ~ edad")
abline(Reg_Lineal_G)

##############################

## Analisis de Regresion entre Volumen y Altura

## Test para el coef. de correlacion
cor.test(x=trees$Height, y=trees$Volume,  method = "pearson")

## Ajusto la regresion lineal
Reg_Lineal_H <- lm(Volume  ~ Height, data=trees)
summary(Reg_Lineal_H)

## Grafico
plot(x=trees$Height, y=trees$Volume, main="Volume ~ Height")
abline(Reg_Lineal_H)