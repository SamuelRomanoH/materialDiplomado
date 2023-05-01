#Samuel Romano
#CU 165167

#Tarea1 - Refugios de Nayarit

#Path
getwd()
setwd("/Users/zamromano/Desktop/Titulación/Diplomado/DSAAM/Mod_2/data")
list.files() #Revisar que sí estén los files que necesito para cargar

#Librerias
library(readxl)


#Prueba de que la base sí se cargó y obtener el nombre de las columnas
refugios <- read_excel("refugios_nayarit.xlsx")
excel_sheets("refugios_nayarit.xlsx")
print(refugios)

#Creo un dataframe vacío
refugiostot<- data.frame()

for (hoja in excel_sheets("refugios_nayarit.xlsx")){
  refugiostot<- rbind(refugiostot,read_excel("refugios_nayarit.xlsx",sheet = hoja,range=cell_rows(6:35)))
}
#Cambio el nombre de las columnas
names(refugiostot)<- c("No.","REFUGIO","MUNICIPIO","DIRECCION","USO DEL INMUEBLE","SERVICIOS", "CAPACIDAD DE PERSONAS","LATITUD","LONGITUD","ALTITUD","RESPONSABLE","TELEFONO")

#De la base completa, elimina los NA que aparezcan en la columna No.
refugiostot<- refugiostot[!is.na(refugiostot$No.),]
print(refugiostot)

