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

### 5. Agregar torneo

_Precondición: Hay una sesión de administrador iniciada_

_Postcondición: Existe un nuevo torneo_

El administrador selecciona la opción de agregar torneo. Se le solicita un nombre y el deporte. Si no existe un torneo con el mismo nombre, se agrega. Caso contrario, se notifica el error al administrador.

### 6. Eliminar torneo

_Precondición: Hay una sesión de administrador iniciada. existe al menos un torneo._

_Postcondición: El torneo es eliminado_

El administrador selecciona la opción de eliminar torneo. Ingresa el nombre del torneo y en caso de existir, se elimina. Caso contrario, se notifica el error al administrador.

### 7. Modificar torneo

_Precondición: Hay una sesión de administrador iniciada. Hay un torneo creado._

_Postcondición: El torneo es modificado_

El administrador selecciona la opción de modificar torneo. Se solicita ingresar el nombre del torneo y en caso de existir, se modifica alguna fase o partido del torneo.

### 8. Agregar equipo

_Precondición: Hay una sesión de administrador iniciada_

_Postcondición: Existe un nuevo equipo_

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

El usuario selecciona la opción de agregar predicción. Se solicita la fase del torneo, el partido si predice empate, si predice ganador, y equipo ganador (si seleccionó predecir ganador). Si los datos son válidos y no existe una predicción para el partido, se agrega. Caso contrario, se notifica el error.

### 14. Agregar predicción del campeón

_Precondición: Hay una sesión iniciada._

_Postcondición: Se agrega una nueva predicción para el campeón._

El usuario selecciona la opción de predecir el campeón. Se solicita el torneo y el nombre del equipo y en caso de ser válido, se agrega la predicción. En otro caso, se notifica el error.

### 15. Mostrar partidos

_Precondición: Hay una sesión iniciada._

_Postcondición: Se muestran los partidos existentes._

El usuario selecciona la opción de ver partidos. Se muestra una lista de los partidos categorizados por torneo y la fase a la que pertenecen, con su fecha, hora y equipos participantes. En caso de que el partido ya se haya jugado, se muestra el resultado con equipo ganador (si existe).

### 16. Mostrar puntos acumulados

_Precondición: Hay una sesión iniciada._

_Postcondición: Se muestra por pantalla los puntos acumulados del usuario._

El usuario selecciona la opción de mostrar puntos acumulados. Se muestran los puntos acumulados.

### 17. Agregar deporte

_Precondición: Hay una sesión de administrador iniciada._

_Postcondición: Existe un nuevo deporte._

El administrador selecciona la opción de agregar deporte. Se solicita el nombre del deporte y en caso de no estar creado, se agrega el deporte. En otro caso, se notifica el error.

### 18. Modificar deporte

_Precondición: Hay una sesión de administrador iniciada. Existe al menos un deporte._

_Postcondición: El deporte es modificado._

El administrador selecciona la opción de modificar deporte. Se solicita el nombre del deporte y en caso de no estar creado, se agrega el deporte. En otro caso, se notifica el error.

### 19. Eliminar deporte

_Precondición: Hay una sesión de administrador iniciada. Existe al menos un deporte._

_Postcondición: El deporte es eliminado._

El administrador selecciona la opción de eliminar deporte. Se solicita el nombre del deporte y en caso de existir, se elimina el deporte. En otro caso, se notifica el error.

### 20. Agregar fase

_Precondición: Hay una sesión de administrador iniciada._

_Postcondición: Existe una nueva fase._

El administrador selecciona la opción de agregar fase. Se solicita el nombre de la fase y si es posible la definicion por penales, en caso de estar creada se notifica el error.

### 21. Eliminar fase
_Precondición: Hay una sesión de administrador iniciada. Existe al menos una fase._

_Postcondición: La fase es eliminada._

El administrador selecciona la opción de eliminar fase. Se solicita el nombre de la fase y en caso de existir, se elimina la fase. En otro caso, se notifica el error.

### 22. Modificar fase

_Precondición: Hay una sesión de administrador iniciada._

_Postcondición: La fase es modificada._

El administrador selecciona la opción de modificar fase. Se solicita el nombre de la fase y en caso de no estar creada se notifica el error.


# Modelo de análisis

[![](https://mermaid.ink/img/pako:eNqFU01vwyAM_SuIY9VW7Y7RLlu346RJ7W5IkxVYixZMRIiqqut_nyHkq2m3XGL8Hs_mGc48t1LxjOcFVNWLhr0DI1BgXLOdrR2CUejPAhl9vkt8atmkwlLgpd-0La1r-VPQw16NwBCVCqHwWlUj7kelHEvcmuKJ2JM0GvvlewEn5dKG0mr0Y7038PmhFZTgU3Gv2zakg-Nox7PyHf8a2ykwLegpvm_Ixtbo3Ynd82RzAFNqi1QtJHvTmeCr5XImOFssKF5TEM1l7IoVkFnDafjRZoHxdwuPVpBIOANlH7oSA5hlJRlaJVZsZd3yViPeUSMqJ7A9aFNwKBgkBMaBPv4QkCbXJ5rZCWz-Q4VUKpoT5jH1JB1mCqaOY_9dk9Rm7_cNtabVfzid-X90PJDgc26UM6AlPbV4DQT3B0X3gGcUSnDfgtOdIF5dhpv5KrW3jmdfUFRqzqH2dnvCnGfe1aolpeeaWJdfZNs4rA)](https://mermaid.live/edit#pako:eNqFU01vwyAM_SuIY9VW7Y7RLlu346RJ7W5IkxVYixZMRIiqqut_nyHkq2m3XGL8Hs_mGc48t1LxjOcFVNWLhr0DI1BgXLOdrR2CUejPAhl9vkt8atmkwlLgpd-0La1r-VPQw16NwBCVCqHwWlUj7kelHEvcmuKJ2JM0GvvlewEn5dKG0mr0Y7038PmhFZTgU3Gv2zakg-Nox7PyHf8a2ykwLegpvm_Ixtbo3Ynd82RzAFNqi1QtJHvTmeCr5XImOFssKF5TEM1l7IoVkFnDafjRZoHxdwuPVpBIOANlH7oSA5hlJRlaJVZsZd3yViPeUSMqJ7A9aFNwKBgkBMaBPv4QkCbXJ5rZCWz-Q4VUKpoT5jH1JB1mCqaOY_9dk9Rm7_cNtabVfzid-X90PJDgc26UM6AlPbV4DQT3B0X3gGcUSnDfgtOdIF5dhpv5KrW3jmdfUFRqzqH2dnvCnGfe1aolpeeaWJdfZNs4rA)