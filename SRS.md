# Especificación de Requerimientos de Software

# Prode de Fútbol

por
* D\'Autilio Joel
* Rojo Jonathan
* Rossi Pablo

## Contexto

En vísperas del mundial 2022, se requirió por parte del equipo docente, desarrollar un sistema que maneje un Prode. El PRODE es una plataforma que permite realizar pronósticos sobre los resultados de los partidos pertenecientes a un torneo. Dependiendo de la cantidad y tipo de los aciertos, se ganan puntos que se acumulan a lo largo del campeonato.

En un principio, el PRODE surgió como un modo de apostar sobre campeonatos de fútbol argentino; sin embargo, es posible realizar pronósticos sobre muchas disciplinas competitivas.

El sistema registra torneos, que son conjuntos de partidos de los cuales se decide un campeón, ya sea por acumulación de puntos o a través de la eliminación del resto de los contrincantes. De los torneos se registra un identificador único, su nombre, a qué deporte pertenece, sus partidos y los equipos participantes. Generalmente, los partidos pertenecientes a un torneo están organizando en fases, de las cuales se registra su nombre.

Este sistema sólo soporta partidos donde se enfrentan dos equipos. Los partidos se registran con fecha, hora, equipos participantes, si hubo empate, si permite penales, y equipo ganador (que puede no haber). No puede haber penales si no hubo empate.

De los equipos se conoce el nombre, un identificador único, país al que pertenecen y deporte.

De los países y los deportes sólo se registra el nombre.

De los usuarios se registra un nombre de usuario (único). Hay usuarios administradores y usuarios participantes. Los administradores tienen acceso a diferentes funciones tales como agregar, eliminar y modificar torneos, equipos y partidos, y modificar permisos de otros usuarios. De los participantes se almacenan sus predicciones (ganador/empate/penales). Sus puntos acumulados se calculan a partir de sus predicciones y de los partidos ya jugados.

Además de predecir resultados de partidos, un usuario puede dar su predicción sobre quiénes serán el campeón y el subcampeón del torneo.

Los puntajes se calculan de la siguiente manera:

* 1 punto por acertar el pronóstico del partido (equipo ganador o empate)
* 1 punto más por acertar el pronóstico de penales (equipo ganador) en caso de haber
* 5 puntos más por acertar el equipo ganador del torneo
* 3 puntos más por acertar el equipo subcampeón del torneo

## Requerimientos Funcionales

### 1. Crear cuenta

_Precondición: La cuenta a crear no existe_

_Postcondición: Existe un nuevo usuario_

La persona provee un usuario y una contraseña. Si no existe un usuario con ese nombre, se crea una nueva cuenta con los datos dados.

### 2. Borrar cuenta

_Precondición: Existe la cuenta_

_Postcondición: La cuenta se elimina_

Con la sesión iniciada, el usuario toca el botón de eliminar usuario. Se le pide confirmación al usuario, y en caso de aceptar, se eliina la cuenta del sistema.

### 3. Iniciar sesión

_Precondición: No hay una sesión iniciada_

_Postcondición: Se ingresa a una sesión_

La persona ingres aun nombre de usuario y una contraseña. En caso de que el usuario exista y la contraseña coincida, se inicia la sesión. Si no, se notifica del error en los datos y se vuelven a solicitar.

### 4. Cambiar permisos

_Precondición: Hay una sesión de administrador iniciada_

_Postcondición: Se modifican los permisos de la cuenta objetivo_

El usuario administrado selecciona la opción de modificar permisos, elige una cuenta, y le otorga o remueve permisos.

### 5. Agregar grupo

_Precondición: Hay una sesión de administrador iniciada_

_Postcondición: Existe un nuevo grupo_

El administrador selecciona la opción de agregar grupo. Se le solicita un nombre. Si no existe un grupo con el mismo nombre, se agrega. Cas contrario, se notifica el error al administrador.

### 6. Eliminar grupo

_Precondición: Hay una sesión de administrador iniciada. existe al menos un grupo._

_Postcondición: El grupo es eliminado_

El administrador selecciona la opción de eliminar grupo. Ingresa el nombre del grupo y en caso de existir, se elimina. Caso contrario, se notifica el error al administrador.

### 7. Modificar Grupo

_Precondición: Hay una sesión de administrador iniciada. Hay un grupo creado._

_Postcondición: El grupo es modificado_

El administrador selecciona la opción de modificar grupo. Se solicita ingresar el nombre del grupo y en caso de existir, se cambia uno o más de los equipos que conforman el grupo.

### 8. Agregar equipo

_Precondición: Hay una sesión de administrador iniciada_

_Postcondición: Existe un nuevo grupo_

El administrador selecciona la opción de agregar equipo. Se le solicita un nombre y un país y el código de un grupo. Si los datos son válidos, no existe otro equipo con el mismo nombre y país, y el grupo no se encuentra lleno, se agrega un equipo con la información dada. Caso contrario, se notifica el error al administrador.

### 9. Eliminar equipo

_Precondición: Hay una sesión de administrador iniciada. Existe al menos un equipo._

_Postcondición: El equipo es eliminado._

El administrador selecciona la opción de eliminar equipo. Ingresa el código ddel equipo y en caso de existir, se elimina. Caso contrario, se notifica el error al administrador.

### 10. Agregar partido

_Precondición: Hay una sesión de administrador iniciada._

_Postcondición: Existe un nuevo partido._

El administrador selecciona la opción de agregar partido. Se le solicita una fecha, una hora y los códigos de dos equipos. Si los datos son válidos, se agrega un partido con la información dada.

### 11. Eliminar partido

_Precondición: Hay una sesión de administrador iniciada. Existe al menos un equipo._

_Postcondición: El partido es eliminado._

El administrador selecciona la opción de eliminar partido. Ingresa el identificador ddel partido y en caso de existir, se elimina el partido.

### 12. Modificar Partido

_Precondición: Hay una sesión de administrador iniciaa. Hay un partido con o sin resultado asignado._

_Postcondición: El partio tiene un nuevo resultado._

El administrador selecciona la opción de modificar el partido. Se solicita ingresar el identificador del partido y en caso de existir, se solicita el resultado. Caso contrario, se notifica el error al administrador.

### 13. Agregar predicción de partido

_Precondición: Hay una sesión iniciada._

_Postcondición: Se agrega una nueva predicción._

El usuario selecciona la opción de agregar predicción. Se solicita la fase del torneo, el partido, el equipo ganador y la cantidad de goles de cada equipo. Si los datos son válidos y no existe una predicción para el partido, se agrega. Caso contrario, se notifica el error.

### 14. Agregar predicción del campeón

_Precondición: Hay una sesión iniciada._

_Postcondición: Se agrega una nueva predicción para el campeón._

El usuario selecciona la opción de predecir el campeón. Se solicita el nombre del equipo y en caso de ser válido, se agrega la predicción. En otro caso, se notifica el error.

### 15. Agregar predicción del subcampeón

_Precondición: Hay una sesión iniciada._

_Postcondición: Se agrega una nueva predicción para el subcampeón._

El usuario selecciona la opción de predecir el subcampeón. Se solicita el nombre del equipo y en caso de ser válido, se agrega la predicción. En otro caso, se notifica el error.

### 16. Mostrar partidos

_Precondición: Hay una sesión iniciada._

_Postcondición: Se muestran los partidos existentes._

El usuario selecciona la opción de ver partidos. Se muestra una lista de los partidos categorizados por la fase del torneo a la que pertenecen, con su fecha, hora y equipos participantes. En caso de que el partido ya se haya jugado, se muestra el resultado con equipo ganador y cantidad de goles.

### 17. Mostrar puntos acumulados

_Precondición: Hay una sesión iniciada._

_Postcondición: Se muestra por pantalla los puntos acumulados del usuario._

El usuario selecciona la opción de mostrar puntos acumulados. Se muestran los puntos acumulados.

# Modelo de análisis

[![](https://mermaid.ink/img/pako:eNp9kktvwjAMx79K5eMEiE079biHdtplj1sklDUGIjVOlSZCCPHd56Rpga1tT3b8-9v14wSVVQglVLVs2xctd04aQYKSX7w5G5riJKjgj6RBQedL9LtF1wcD2x0QvcZq8u0N_C59te9pE52NVp2npM86r_-UeEI_lA9ms7Oyvk37gW2oB-ZgaQ7-Qml61LM9_MG_1p5tIO-OI62nHALuV6s7AcVyGW02skBQNzIBj_xoh3BUDdqHQdglSaMRlMYpYH2VeX0FFGXROFS6ioMdYfsyzFV7aRodZzHPteHngsZRT5IHTYRuCopVpmK5ubyn8QIz4SSHBRh0RmrFl5pWIsDvkXcCJZsKt5LVAnhFjIYmHtSr0t46KLd8BLgAGbz9PFIFpXcBeygffKbOv60G9hM)](https://mermaid.live/edit#pako:eNp9kktvwjAMx79K5eMEiE079biHdtplj1sklDUGIjVOlSZCCPHd56Rpga1tT3b8-9v14wSVVQglVLVs2xctd04aQYKSX7w5G5riJKjgj6RBQedL9LtF1wcD2x0QvcZq8u0N_C59te9pE52NVp2npM86r_-UeEI_lA9ms7Oyvk37gW2oB-ZgaQ7-Qml61LM9_MG_1p5tIO-OI62nHALuV6s7AcVyGW02skBQNzIBj_xoh3BUDdqHQdglSaMRlMYpYH2VeX0FFGXROFS6ioMdYfsyzFV7aRodZzHPteHngsZRT5IHTYRuCopVpmK5ubyn8QIz4SSHBRh0RmrFl5pWIsDvkXcCJZsKt5LVAnhFjIYmHtSr0t46KLd8BLgAGbz9PFIFpXcBeygffKbOv60G9hM)