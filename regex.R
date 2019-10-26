
#~ ---
#~ title: "regex"
#~ author: "lsb"
#~ date: "2019, 10, 11"
#~ output: pdf_document
#~ ---


#~ La lectura básica para manejo de strings y expresiones regulares
#~ puede ser tanto man regex como man grep, PERO, existen n libros o
#~ manuales de diferente nivel de manejo. Todos son útiles.
#~  En R use el sistema básico de ayuda.

#~ Si lo desea puede consultar [https://www.gastonsanchez.com/r4strings/]


#~ Aunque muchas funciones vienen en r-base, lo más aconsejable es
#~ stringr.


#~ Para todos los casos prediga la posible salida dle comando antes de
#~ eejecutarlo y en caso de duda use ?; si la salida no conincide con sus
#~ expectativas revise las instrucciones usadas o su manejo de las
#~ funciones.


##
library(stringr)


#~ ¿Que espera obtener con cada instrucción?


nchar("South Pole")               #cuantifica el numero de letras                  

paste("North","Pole",sep=".")     #pega los caracteres definido por el separador

paste("North","and","South","Poles")     #utiliza el separador por defecto

paste0("North","and","South","Poles")   #con "paste0" al no indicar el separador los caracteres se pegan sin espacio

cat("North","and","South","Poles")


cat("North","and","South","Poles",sep="\t")   # al utilizar "\t" indica una salidad de caracteres con doble espacio

cat("North","and","South","Poles",sep="\n")   #al utilizar "\n" indica los caracteres con salto de linea



i <- 8

s <- sprintf("the square of %d is %d",i,i^2)

s


#~ ¿qué espera que haga?


for (i in 1:5) {
  
  fname <- sprintf("q%d.pdf",i)
  
  pdf(fname)
  
  hist(rnorm(100,sd=i))
  
  dev.off()
}




grep("pole",c("Equator","North Pole","South Pole"))    # no reconoce a ninguno debido a que R es sensible a mayusculas-minisculas


grep("[Pp]ole",c("Equator","North Pole","South pole"))   #reconoce ya que "[Pp]" indica tanto p como P 

grep("o.e",c("Equator","North Pole","South Pole"))        # "." indica cualquie letra en medio de o y e

grep("N.t",c("Equator","North Pole","South Pole"))      # no reconoce ningun elemento debido que "." equivale solo a una letra

grep("N..t",c("Equator","North Pole","South Pole"))       # el numero de "." indica el numero de caracteres

grep("N...t",c("Equator","North Pole","South Pole"))

grep("N?t",c("Equator","North Pole","South Pole"))

## ???

grep("?",c("Equator","North Pole","South Pole"))

grep(".",c("Equator","North Pole","South Pole"))          

?grep                                                    #ayuda y documentancion de todo lo referente a grep

grep(".",c("abc","de","f.g"))

grep(".",c("a","bc","bcd"))

grep("..",c("a","bc","bcd"))


grep("...",c("a","bc","bcd"))


grep("\\.",c("abc","de","f.g"))


x <- c("apple", "banana", "pear","adnon")

str_extract(x, "an")                           # "str_extract" nos permite extraer los caracteres de los elementos del objeto

str_extract(x, "a.")                           # "a." cualquier caracter con a y cualquier letra

str_extract(x, "a[dn]")                        #[dn] indica extrictamente d o n

str_extract(x, "a.[dn]")

str_extract(x, "a.[d]")                        # "a.[d]" permite extraer a+cualquier letra+ d

str_extract(x, "a.[n]")



substring("Equator",3,5)                       # la funcion "substring" permite extraer los caracteres con una ubicacion exacta en este caso 3 al 5

regexpr("uat","Equator")                       # nos indica la ubicacion de "uat" en la expresion

gregexpr("iss","Mississippi")                  # "greoexpr" marcas los inicios de los aciertos

str_extract("Mississippi","iss")




#Algunas cosas de stringr


head(fruit)


str_extract(fruit, "nana")


str_extract(fruit, regex("nana"))


bananas <- c("banana", "Banana", "BANANA")

str_detect(bananas, "banana")                  # "str_detect" nos permite detectar los caracteres arrojando valores de tipo logico arrojando 

str_detect(bananas, regex("banana", ignore_case = TRUE))

regex("banana", ignore_case = TRUE)


x

str_extract(x, ".a.")


x <- "a\\b"

writeLines(x)

str_extract(x, "\\\\")







#~  Special characters


#~      \xhh: 2 hex digits.

#~      \x{hhhh}: 1-6 hex digits.

#~      \uhhhh: 4 hex digits.

#~      \Uhhhhhhhh: 8 hex digits.

#~ \N{name}, e.g. \N{grinning face} matches the basic smiling emoji.

#~  Similarly, you can specify many common control characters:

#~      \a: bell.

#~      \cX: match a control-X character.

#~      \e: escape (\u001B).

#~      \f: form feed (\u000C).

#~      \n: line feed (\u000A).

#~      \r: carriage return (\u000D).

#~      \t: horizontal tabulation (\u0009).

#~      \0ooo match an octal character. ‘ooo’ is from one to three 
#~      octal digits, from 000 to 0377. The leading zero is required.



x <- "n\u0301"

x

str_extract(x, ".")

str_extract(x, "\\X")                # el primer "\" indica ek escape

x <- "n\U0301"

x



#~  \s: matches any whitespace. 
#~  \S: matches any non-whitespace character.



(text <- "Some  \t badly\n\t\tspaced \f text")

text

print(text)

str_replace_all(text, "\\s+", "*")




#~  \p{property name} matches any character with specific unicode
#~  property
#~  \P{property name}, matches all characters without the property. 
#~  http://www.unicode.org/reports/tr44/#Property_Index.


text1 <- c('"Double quotes"', "«Guillemet»", "“Fancy quotes”")

text1

(text <- c('"Double quotes"', "«Guillemet»", "“Fancy quotes”"))


text1[1]

text[1]

str_replace_all(text, "\\p{quotation mark}", "\"")



#~  \w matches any “word” character, 
#~  \W, matches any non-word character.



str_extract_all("Don't eat that!", "\\W+")[[1]]

str_split("Don't eat that!", "\\W")[[1]]


## revisar tambien strsplit

strsplit("Don't eat that!", "\\W")

strsplit("Don't eat that!", "\\W")[[1]][2]




substring("Don't eat that!",1,2)              #"substring" permite extraer el string 

substring("Don't eat that!",2,1)

substring("Don't eat that!",3)



#~  Technically, \w also matches connector punctuation, \u200c (zero
#~  width connector), and \u200d (zero width joiner), but these are
#~  rarely seen in the wild.

#~  \b matches word boundaries, the transition between word and
#~  non-word characters. \B matches the opposite: boundaries that have
#~  either both word or non-word characters on either side.



str_replace_all("The quick brown fox", "\\b", "_")           # "_" cumple como criterio de busqueda

str_replace_all("The quick brown fox", "\\B", "_")


#~      [:punct:]: punctuation.
#~      [:alpha:]: letters.
#~      [:lower:]: lowercase letters.
#~      [:upper:]: upperclass letters.
#~      [:digit:]: digits.
#~      [:xdigit:]: hex digits.
#~      [:alnum:]: letters and numbers.
#~      [:cntrl:]: control characters.
#~      [:graph:]: letters, numbers, and punctuation.
#~      [:print:]: letters, numbers, punctuation, and whitespace.
#~      [:space:]: space characters (basically equivalent to \s).
#~      [:blank:]: space and tab.

#~  These all go inside the [] for character classes,
#~  i.e. [[:digit:]AX] matches all digits, A, and X.

#~  You can also using Unicode properties, like [\p{Letter}], and
#~  various set operations, like [\p{Letter}--\p{script=latin}]. 

#~  | is the alternation operator, which will pick between one or more
#~  possible matches. For example, abc|def will match abc or def.


str_detect(c("abc", "def", "ghi"), "abc|def")




#~  You can use parentheses to override the default precedence rules:



str_extract(c("grey", "gray"), "gre|ay")          # "|" nos permite indicar la extracion de gre o ay

str_extract(c("grey", "gray"), "gr(e|a)y")        # "(|)"  nos permite extraer "e o a" con jry

str_extract(c("grey", "gray"), "gr[ea]y")         # igualmentel [] nos permite extraer " e o a" 



#~  By default, regular expressions will match any part of a
#~  string. It’s often useful to anchor the regular expression so that it
#~  matches from the start or end of the string:

#~      ^ matches the start of string.
#~      $ matches the end of the string.



x <- c("apple", "banana", "pear")

str_extract(x, "^a")                # "^" indica en el inicio de la linea    

str_extract(x, "a$")                #  "$" permite la extracion de "a" al final de la cadena

str_extract(x, "a.")                #  extraer a con cualquer valor a la derecha

str_extract(x, ".a")

str_extract(x, "^.a")

str_extract(x, "a.$")





#~  To match a literal “$” or “^”, you need to escape them, \$, and \^.

#~  For multiline strings, you can use regex(multiline = TRUE). This
#~  changes the behaviour of ^ and $, and introduces three new operators:

#~      ^ now matches the start of each line.

#~      $ now matches the end of each line.

#~      \A matches the start of the input.

#~      \z matches the end of the input.

#~      \Z matches the end of the input, but before the final line terminator, if it exists.



x <- "Line 1\nLine 2\nLine 3\n"

str_extract_all(x, "^Line..")

str_extract_all(x, "^Line..")[[1]]

str_extract_all(x, regex("^Line..", multiline = TRUE))[[1]]              #"multiline" indica todas las lineas

str_extract_all(x, regex("^Line..", multiline = TRUE))


str_extract_all(x, regex("\\ALine..", multiline = TRUE))[[1]]

str_extract_all(x, regex("\\ALine..", multiline = TRUE))





#~  There are two ways to include comments in a regular expression. 


str_detect("xyz", "x(?#this is a comment)")


phone <- regex("
  \\(!     # optional opening parens
  (\\d{3}) # area code
  [)- ]?   # optional closing parens, dash, or space
  (\\d{3}) # another three numbers
  [ -]?    # optional space or dash
  (\\d{3}) # three more numbers
  ", comments = TRUE)

str_match("514-791-8141", phone)

