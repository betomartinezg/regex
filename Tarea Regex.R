##########
# RegEx   -------------------------------------------------

vectorCars <- c("juan1@hotmail.com",
                "2juanes@hotmail.com",
                "juaMes@hatmail.com",
                "pedro99@gmail.com",
                "pedro@hotmail.com",
                "pedro9@gmail.com",
                "peter11@xmail.com",
                "otroJujuan99@hotmail.com",
                "otrojuan99@gmail.com",
                "juanchito99@gmail.com",
                "superJuancho99@xmail.com",
                "mary01@gmail.com",
                "sistermarria@gmail.com",
                "marryMe@gmail.com",
                "maria01@gmail.com",
                "maRia01@gmail.com",
                "jhonBravo@gmail.xom",
                "johnBravo@gmail.com",
                "jaunMalEscritoBravin@gmiial.com",
                "jaunGravo@gmail.com",
                "JHONNY@gmail.com",
                "pedrito611@gmail.com",
                "marian@hotmail.com",
                "PedroMaria@gmail.com",
                "juanMaria@xmail.com",
                "JuanPedro@hotmaail.com",
                "pedroJuan@hotmail.com",
                "juanPedrito@hotmail.com")


### crear un regex para extraer del vectorCars

## Ejercicio 1. el mismo usario (expl�?cito) en dos proveedores de correo

grep("Pedro",vectorCars)                 #se utilizo "grep" primeramente para identificar el usuario Juan, Maria y Pedro
str_extract_all(vectorCars, "Pedro")     # se utilizo "str_extract_all" para extraer explicitamente los usuarios del vector

grep("Maria", vectorCars)
str_extract_all(vectorCars, "Maria")

grep("Juan", vectorCars)
str_extract_all(vectorCars, "Juan")


## Ejercicio 2. potencialmente el mismo usuario tanto en el mismo proveedor como en distintos proveedores. Para los dos casos suponga que solo existen tres nombres: Maria / Juan / Pedro, en distintos idiomas

## Ejercicio 3. corrija de manera automatica los usarios o los dominios con nombres errados; preferiblemente escrito como una función.









### Utilizando el archivo fasta

entrada1<-c("TATACACATGGAANSATTNAGGCCAGTAGTATCAANSACTCAANSACTGCTGTTNAANSAANTGGCAGTTNTNGCAGAANSAGAANSAGAGGTAGTAANSATTNAGATCCAANSAANASAANTTNTCACAGACAANSATGCTAANSAANASATCATAANSATAGTACAGCTGAANSATAGCTCTGTAGAANSAANTTNAANSATTNGTACAANSAGACCCAGCAANSACAANSATACAANSAGAANSAANASAANGTATAANSAANTATAGGACCAGGCAGAGCATTNT
TNATACAANSACAGGAGAANSAANTAANSATAGGAGATATAANSAGACAANSAGCACATTNGTAANSATGTTNAGCAGGGCAANSAGATGGAGGGACACTTNTAANSAANASACAGATAGTTNATAANSAANASATTNAANSAGAGAANSACAANSATTNTGGGAANSATAANSAANASACAANSATAGTCTTNTAANSATCACTCCTCAGGAGGGGACCCACAGACAANSATGCTAANSAANASATCATAANSATAGTACAGCTGAANSATAGCTCTGTAGAANSAANTTNAANSATTNGTACAANSAGACC
CAGCAANSACAANSATACAANSAGAANSAANASAANGTATAANSAANTATAGGACCAGGCAGAGCATTNTTNATACAANSACAGGAGAANSAANTAANSATAGGAGATATAANSAGACAANSAGCACATTNGTAANSATGTTNAGCAGGGCAANSAGATGGAGGGACACTTNTAANSAANASACAGATAGTTNATAANSAANASATTNAANSAGAGAANSACCCAANSATTNTTNGGGAANSATAANSAANASACSATAGTCTTNTAANSATCACTCCTCAGGAGGGGACCCAANAANAAN")

entrada2<-c("TGTATACGTGGAANSATTNAGGCCAGTAGTATCAANSACTCCACTTNCTGTTNAANSAANTGGCAGTTNTAGCAGGAGGAGAGGTAGTCATTNAGATCCAANSAANASAANTTNTCACAGACAANSATGCTAANSAANASATCATAANSATAGTACAGCTGAANSATAGCTCTGTAGAANSAANTTNAANSATTNGTACAANSAGACCCAGCAANSACAANSATACAANSAGAANSAANASAANGTATAANSAANTATAGGACCAGGCAGAGCATTNTTNATACAANSACAGGAGAANSAA
NTAANSATAGGAGATATAANSAGACAANSAGCACATTNGTAANSATGTTNAGCAGGGCAANSAGATGGAGGGACACTTNTAANSAANASACAGATAGTTNATAANSAANASATTNAANSAGAGAANSACAANSATTNTGGGAANSATAANSAANASACAANSATAGTCTTNTAANSATCACTCCTCAGGAGGGGACCCACAGACAANSATGCTAANSAANASATCATAANSATAGTACAGCTGAANSACAGCTCTGTAGACATTNAANSATTNGTACAANSAGACCCAGCAANSACAANSATACAANSAGAANS
AANASAANGTATAANSAANTATAGGACCAGGCAGAGCATTNTTNATACAANSACAGGAGAANSAANTAANSATAGGAGATATAANSAGACAANSAGCACATTNGTAANSATGTTNAGCAGGGCAANSAGATGGAGGGACACTTNTAANSAANASACAGATAGTTNATAANSAANASATTNAANSAGAGAANSACAANSATTNTGGGAANSATAANGGGSAANASACAANSATAGTCTTNTAANSATCACTCCTCAGGAGGGGACACAANAANAANAANAANAANAANA")

entrada3<-c("TGATCACGTGGAANSATTNAGGCCAGTAGTATCAANSACCCCACATCTGTTNAANSAANTGGCAGTTNTAGCAGNAGGAGAGGTAGTCATTNAGATCCAANSAANASAANTTNTCACAGACAANSATGCTAANSAANASATCATAANSATAGTACAGCTGAANSATAGCTCTGTAGAANSAANTTNAANSATTNGTACAANSAGACCCAGCAANSACAANSATACAANSAGAANSAANASAANGTATAANSAANTATAGGACCAGGCAGAGCATTNTTNATACAANSACAGGAGAANSAA
NTAANSATAGGAGATATAANSAGACAANSAGCACATTNGTAANSATGTTNAGCAGGGCAANSAGATGGAGGGACACTTNTAANSAANASACAGATAGTTNATAANSAANASATTNAANSAGAGAANSACAANSATTNTGGGAANSATAANSAANASACAANSATAGTCTTNTAANSATCACTCCTCAGGAGGGGACCCACAGACAANSATGCTAANSAANASATCATAANSATAGTACAGCTTNAANSATAGCTCTGTAGAANSAANTTNAANSATTNGTACAANSAGACGCTGCAANSACAANSATACAANSA
GAANSAANASAANGTATAANSAANTATAGGACCAGGCAGAGCATTNTTNATACAANSACAGGAGAANSAANTAANSATAGGAGATATAANSAGACAANSAGCACATTNGTAANSATGTTNAGCAGGGCAANSAGATGGAGGGACACTTNTAANSAANASACAGATAGTTNATAANSAANASATTNAANSAGAGAANSACAANSATGTGGGGAANSATAANSATACASTAGTCTTNTAANSATTNTCACTCCTCAGGAGGGGACACAANAANAANAANAANAANAANAAN")

## Ejercicio 4.1 cuantificar el número de veces que se repiten tripletas de la misma base AANA/CCC/TTNT/GGG  

str_extract_all(entrada1, regex("AANA", multiline = TRUE))         ## se utilizo "str_extract_all" para extraer y cuantificas las bases
str_extract_all(entrada1, regex("CCC", multiline = TRUE))
str_extract_all(entrada1, regex("TTNT", multiline = TRUE))
str_extract_all(entrada1, regex("GGG", multiline = TRUE))

str_extract_all(entrada2, regex("AANA", multiline = TRUE))
str_extract_all(entrada2, regex("CCC", multiline = TRUE))
str_extract_all(entrada2, regex("TTNT", multiline = TRUE))
str_extract_all(entrada2, regex("GGG", multiline = TRUE))

str_extract_all(entrada3, regex("AANA", multiline = TRUE))
str_extract_all(entrada3, regex("CCC", multiline = TRUE))
str_extract_all(entrada3, regex("TTNT", multiline = TRUE))
str_extract_all(entrada3, regex("GGG", multiline = TRUE))

## Ejercicio 4.2 repita el conteo anterior pero considere que N puede ser la base de la izquierda o de la derecha

str_extract_all(entrada1, regex("TNTT", multiline = TRUE))          
str_extract_all(entrada1, regex("TTTN", multiline = TRUE))

str_extract_all(entrada2, regex("TNTT", multiline = TRUE))
str_extract_all(entrada2, regex("TTTN", multiline = TRUE))

str_extract_all(entrada3, regex("TNTT", multiline = TRUE))
str_extract_all(entrada3, regex("TTTN", multiline = TRUE))

## Ejercicio 5.1 Suponga que los datos contienen 0 / 1 o 2 genes, el gen 1 inicia con SSSN y termina en WWWW y el gen 2 inicia en BWW y termina en AANA, indique si cada entrada contiene o no los genes 1 y/o 2. [Pista, inicio sucede ANTES que termina

## Ejercicio 5.2 cuantificar el número de veces que se repiten tripletas de la misma base AAA/CCC/TTT/GGG

str_extract_all(entrada1, regex("AAA", multiline = TRUE))          #con "str_extract_all" nos permite extraer en y cuantificar las tripletas en cada entrada
str_extract_all(entrada1, regex("CCC", multiline = TRUE))
str_extract_all(entrada1, regex("TTT", multiline = TRUE))
str_extract_all(entrada1, regex("GGG", multiline = TRUE))

str_extract_all(entrada2, regex("AAA", multiline = TRUE))
str_extract_all(entrada2, regex("CCC", multiline = TRUE))
str_extract_all(entrada2, regex("TTT", multiline = TRUE))
str_extract_all(entrada2, regex("GGG", multiline = TRUE))

str_extract_all(entrada3, regex("AAA", multiline = TRUE))
str_extract_all(entrada3, regex("CCC", multiline = TRUE))
str_extract_all(entrada3, regex("TTT", multiline = TRUE))
str_extract_all(entrada3, regex("GGG", multiline = TRUE))

## Ejercicio 5.3 repita el conteo anterior pero considere que N (el codigo IUPAC) puede ser cualquier base

str_extract(entrada1, regex("...", multiline = TRUE))                 #realizamos el conteo con "." debido a que N puede ser cualquier base en la tripleta
str_extract(entrada2, regex("...", multiline = TRUE))
str_extract(entrada3, regex("...", multiline = TRUE))


