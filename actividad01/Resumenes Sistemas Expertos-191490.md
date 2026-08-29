## Ingenieria del Conocimiento

Primero, en el documento de ***Ingeniería del Conocimiento*** se abordan los fundamentos, procesos, metodologías y esquemas de representación que constituyen la **Ingeniería del Conocimiento (IC)** como disciplina clave en el desarrollo de sistemas inteligentes. A continuación, se detallan los temas principales expuestos en el texto:

### **1. Conceptos Fundamentales**
Antes de profundizar en los procesos de la disciplina, el documento introduce los componentes esenciales que interactúan en ella:
*   **Conocimiento:** Desde la perspectiva de la Inteligencia Artificial (IA), se concibe como una combinación de esquemas de datos y procedimientos interpretativos que permiten modelar el mundo real, englobando hechos, conceptos, reglas, procedimientos e ideas. El texto distingue tres variantes:
    *   *Declarativo:* Hechos, atributos y sus relaciones mutuas.
    *   *Procedural (procedimental):* Conjunto de reglas dinámicas empleadas por los expertos para resolver problemas.
    *   *Metaconocimiento:* El conocimiento sobre el propio conocimiento y sus capacidades de razonamiento.
*   **Ingeniero del Conocimiento (ICO):** Especialista informático que interactúa con el experto para extraer, organizar, codificar e implementar el conocimiento en una base de datos inteligente.
*   **Experto Humano:** Sujeto que pone su experiencia y destreza a disposición del sistema.
*   **Usuario:** Destinatario final de la aplicación, cuyas necesidades cognitivas deben ser contempladas en el diseño del sistema.

### **2. Procesos y Actividades de la Ingeniería del Conocimiento**
La IC se puede definir estrictamente como la disciplina encargada de la adquisición, representación, validación, inferenciación, explicación y mantenimiento del conocimiento. De forma general, está constituida por **tres fases secuenciales**:
1.  **Adquisición del conocimiento:** Extracción de la información de los expertos.
2.  **Representación del conocimiento:** Codificación y estructuración de la información por el ICO.
3.  **Base de conocimiento:** Almacenamiento independiente y autocomprensible de la información, frecuentemente mediante reglas de producción.

Por otro lado, según el enfoque de Vázquez (2009), el ciclo de la IC se engloba en **cinco actividades fundamentales**:
1.  *Adquisición:* Extracción desde diversas fuentes.
2.  *Representación:* Organización dentro de la base de conocimiento.
3.  *Validación:* Asegurar que el comportamiento del sistema coincida con el del experto real.
4.  *Inferencia:* Diseño del software que permite a la computadora realizar razonamientos deductivos.
5.  *Explicación y Justificación:* Programación de la capacidad de justificar el razonamiento ante el usuario.

### **3. Técnicas y Métodos de Adquisición de Conocimiento (AC)**
La adquisición es el proceso medular para captar la experiencia intangible del experto o las fuentes escritas. Se identifican fuentes de conocimiento **estáticas** (libros, artículos, películas) y **dinámicas** (experiencia cambiante del experto).

El proceso de adquisición progresa a través de **cinco etapas**:
1.  **Identificación:** Delimitación del problema, subproblemas y recursos disponibles.
2.  **Entendimiento:** Identificación de conceptos clave y las relaciones que configuran las decisiones.
3.  **Formalización:** Organización lógica del conocimiento según el método de representación elegido.
4.  **Implementación:** Codificación del conocimiento en la computadora y creación de un prototipo funcional del sistema experto.
5.  **Pruebas:** Evaluación de la validez del conocimiento y depuración de reglas en conjunto con el experto.

Los **métodos de adquisición** se agrupan en tres grandes categorías:
*   **Métodos Manuales:** Interacción directa y personal entre el ICO y el experto humano.
    *   *Entrevistas:* Pueden ser estructuradas (sistemáticas, repetibles y orientadas a objetivos específicos), semiestructuradas (con guiones flexibles que propician una conversación abierta) o no estructuradas (informales y espontáneas para una exploración inicial).
    *   *Métodos de Búsqueda:* Análisis del flujo de pensamiento del experto, destacando el *Análisis de protocolo* y las *Observaciones*.
    *   *Otros métodos:* Análisis de casos particulares, lluvia de ideas, prototipos interactivos, exámenes prácticos y elaboración de informes.
*   **Métodos Semiautomatizados:** Apoyo de software interactivo para mediar en el proceso.
    *   *Soporte al Experto:* Herramientas para que el experto alimente directamente el sistema (como el Análisis de Rejilla o *Repertory Grid Analysis* basado en la Teoría de Construcción Personal de Kelly).
    *   *Soporte al ICO:* Editores, interfaces de verificación de consistencia, generación de explicaciones y módulos de documentación.
*   **Métodos Automatizados:** Minimizan o eliminan el rol del experto y el ICO en la captura.
    *   *Reglas de Inducción:* Algoritmos que extraen reglas lógicas a partir de matrices de datos (como el popular algoritmo ID3 que genera árboles de decisión).
    *   *Aprendizaje Automatizado (Machine Learning):* Programas heurísticos enfocados en que las computadoras asimilen conocimiento de la experiencia directa.

### **4. Esquemas de Representación del Conocimiento (KR)**
La representación busca estructurar la información extraída de forma que sea inteligible y manipulable por el sistema. Una representación ideal debe ser sencilla, fácil de modificar, transparente, independiente y relacional. El documento detalla los siguientes esquemas fundamentales:
1.  **Reglas de lógica simbólica:**
    *   *Lógica proposicional:* Evaluación de enunciados simples o compuestos mediante operadores lógicos (conjunción \\(\land\\), disyunción \\(\lor\\), negación \\(\sim\\), implicación \\(\rightarrow\\), equivalencia \\(\equiv\\)) y reglas de inferencia tradicionales (*Modus Ponendo Ponens*, *Modus Tollendo Tollens*, *Modus Tollendo Ponens*).
    *   *Lógica de predicados:* Lenguaje formal más detallado que evalúa la estructura de las frases lógicas utilizando constantes, variables, funciones, predicados y cuantificadores (universal \\(\forall\\) y existencial \\(\exists\\)).
2.  **Redes Semánticas (redes asociativas):** Representaciones gráficas compuestas por nodos (elementos, atributos o conceptos) y enlaces vectoriales que definen relaciones semánticas (las más comunes son *ES-UN* y *ES-SUBCONJUNTO*).
3.  **Gráficos Conceptuales (Mapas de Conocimiento):** Diagramas que expresan las relaciones de precedencia, jerarquía y causalidad que intervienen en la resolución de un problema.
4.  **Árboles de Decisiones:** Estructuras que mapean el espacio de búsqueda de soluciones mediante nodos que simbolizan metas y ramas que indican decisiones tomadas.
5.  **Frames (Marcos) o Slots:** Estructuras jerárquicas de datos basadas en objetos. Un marco divide conceptos o situaciones complejas en componentes introducidos en ranuras (*slots*) con facetas (*facets*), integrando características declarativas y procedimentales con un robusto mecanismo de herencia.
6.  **Diagramas Lógicos:** Clasificados según enfatizan la acumulación de datos estáticos (esquemas declarativos) o de procedimientos y reglas dinámicas para el uso de la información (esquemas procedimentales).

## Sistemas Expertos Basados en Reglas

Por otro lado, el documento de ***Sistemas Expertos Basados en Reglas*** se enfoca en el estudio detallado de los **sistemas basados en reglas deterministas**, que constituyen la metodología más sencilla de los sistemas expertos y son herramientas altamente eficientes para resolver problemas complejos de control o toma de decisiones. 

A continuación, se presenta un resumen estructurado de los temas clave que aborda el texto:

### **1. La Base de Conocimiento (BC)**
El documento establece que en los sistemas basados en reglas intervienen principalmente dos elementos:
*   **Los Hechos:** Representan la información particular conocida de una situación. Son de carácter dinámico, no permanentes (pueden cambiar de una aplicación a otra) y se almacenan en la **memoria de trabajo**.
*   **Las Reglas:** Son relaciones generales y estáticas entre un conjunto de objetos que gobiernan la lógica del dominio. Son de naturaleza permanente y se almacenan en la **base de conocimiento**.
*   **Estructura y Sustitución de Reglas:** Una regla relaciona dos o más objetos mediante una **premisa o antecedente** (*Si...*) y una **conclusión o consecuente** (*...entonces*). Las premisas y conclusiones pueden ser simples o compuestas. Para facilitar el desarrollo del software, muchos sistemas imponen restricciones (como no permitir el operador lógico *o* en la premisa). No obstante, el documento demuestra mediante tablas de verdad que cualquier regla compleja puede ser reemplazada por reglas lógicas equivalentes simples sin perder generalidad (proceso denominado **sustitución de reglas**).

### **2. El Motor de Inferencia y Estrategias de Control**
El motor de inferencia es el encargado de procesar las reglas y hechos para derivar conclusiones. Su ciclo básico consta de tres etapas: **reconocimiento de patrones** (comparar la memoria de trabajo con las reglas para colocarlas en la agenda), **resolución de conflictos** (seleccionar la regla a ejecutar según una estrategia de control) y **ejecución** (aplicar la regla y actualizar la memoria de trabajo).

Para llevar a cabo el razonamiento, el motor de inferencia emplea:
*   **Reglas de Inferencia Simples:** 
    *   **Modus Ponens:** Se mueve "hacia adelante" (de la premisa a la conclusión). Si la premisa es cierta, concluye el consecuente.
    *   **Modus Tollens:** Se mueve "hacia atrás" (de la conclusión a la premisa). Si el consecuente es falso, concluye que la premisa es falsa. El texto enfatiza que ambas reglas son complementarias y potenciadoras cuando actúan en conjunto.
*   **Mecanismo de Resolución:** Una técnica utilizada para obtener conclusiones compuestas basadas en dos o más reglas lógicas, traduciéndolas a expresiones booleanas equivalentes para su simplificación.
*   **Estrategias de Inferencia Compuestas:**
    *   **Encadenamiento de Reglas (hacia adelante):** Comienza con los hechos conocidos y ejecuta secuencialmente las reglas cuyas premisas se cumplan, generando nuevos hechos hasta que ya no se puedan deducir más conclusiones.
    *   **Encadenamiento Orientado a un Objetivo (hacia atrás):** El usuario selecciona un nodo u objetivo de interés. El algoritmo navega en sentido inverso a través de las reglas buscando resolverlo y, si es necesario, interroga activamente al usuario para obtener los datos faltantes que son relevantes.
    *   **Compilación de Reglas:** Si los datos y los objetivos están predeterminados, las reglas encadenadas se compilan en expresiones matemáticas directas denominadas "ecuaciones objetivo", optimizando la deducción inmediata.

### **3. Subsistema de Control de la Coherencia**
El control de la coherencia es fundamental durante el diseño y el uso del sistema para evitar que reglas inconsistentes o datos absurdos dañen la calidad de las conclusiones.
*   **Coherencia de Reglas:** Un conjunto de reglas es coherente si existe al menos una combinación de valores de los objetos que no genere contradicciones. El texto propone realizar este control cada vez que se introduce una nueva regla a la BC para rechazar las incompatibles, además de eliminar los **valores no factibles** (aquellos que siempre conducen a contradicciones).
*   **Coherencia de Hechos:** El sistema debe impedir que el usuario introduzca datos que contradigan las reglas o los hechos ya existentes en la memoria de trabajo. Para lograr esto, se requiere una **actualización continua e inmediata** del conocimiento cada vez que ingresa una nueva unidad de información.

### **4. Subsistema de Explicación de Conclusiones**
Debido a que el motor de inferencia realiza un seguimiento estricto de qué reglas se han disparado para alcanzar un hecho en la memoria de trabajo, el sistema experto tiene la capacidad de **explicar y justificar el porqué de sus decisiones**. Esto se logra entregando al usuario la secuencia lógica de hechos dados y las reglas exactas utilizadas para deducir cada conclusión.

### **5. Casos Prácticos y Limitaciones**
El documento ilustra la teoría de sistemas deterministas mediante ejemplos aplicados:
*   Un modelo de toma de decisiones para un **cajero automático**.
*   Una base de datos descriptiva de atributos de **personas famosas**.
*   Un juego de deducción lógica de **agentes secretos** que mienten o dicen la verdad en distintos países.
*   Un sistema experto para el **control de tráfico ferroviario**, cuyo propósito es evitar colisiones entre trenes determinando el estado de semáforos y agujas en base a la ocupación de las vías.

Finalmente, se aborda la limitación de la lógica determinista para modelar el mundo real, concluyendo en la necesidad de **introducir la incertidumbre**. Se anticipa que los sistemas basados en probabilidad actúan como una generalización natural de los sistemas basados en reglas para lidiar con esta limitación.