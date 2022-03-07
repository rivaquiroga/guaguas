# guaguas 0.3.0

* Se agregan los datos del año 2021.
* La variable sexo ahora tiene tres valores: F (femenino), M (masculino) e I (indefinido).  El valor I aparece desde 2005, que fue el año en el Registro Civil comenzó a permitir este tipo de inscripción para guaguas intersex.

# guaguas 0.2.0

* Se agregan los datos del año 2020 y de los nombres con frecuencias menores a 15 por año.
* La base completa ahora está en el objeto `guaguas`. La base que incluye solo los nombres con 15 o más ocurrencias quedó en el objeto `guaguas_frecuentes`. 
* Se eliminó la dependencia al paquete {tibble}. 
* Los objetos `guaguas` y `guaguas_frecuentes` se visualizan como tibble si es que se tiene instalado ese paquete. Si no, se verán como un data frame "tradicional". 

# guaguas 0.1.0

* ¡Hola, guaguas!
