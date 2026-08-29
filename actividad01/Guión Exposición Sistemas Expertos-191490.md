# Guion de Exposición: Sistemas Expertos en Inteligencia Artificial

Este es el guión de la exposición realizada sobre los Sistemas expertos, el video de la exposición se encuentra en [este enlace](https://youtu.be/_iEJMRo_Bpw).


## Presentación e Introducción \[Diapostivia 1\]

> La presentación de la exposición se realiza frente a cámara de cuerpo completo

Mi nombre es Cristóbal Rafael Lara Páez y el día de hoy presentaré mi investigación y exposición sobre los Sistemas Expertos en IA.

A lo largo de la evolución de la Inteligencia Artificial, los Sistemas Expertos emergieron como una de las primeras y más exitosas materializaciones de la IA aplicada. En esta presentación, exploraremos cómo la creación de estos sistemas marcó un cambio de paradigma fundamental, alejándonos de los algoritmos de propósito general para enfocarnos en el software de dominio específico. 

Veremos a detalle cómo este tipo de programa informático está formalmente diseñado para emular la capacidad resolutiva y el razonamiento de un especialista humano, permitiendo a las máquinas enfrentarse a problemas complejos, inciertos o mal estructurados dentro de un área de conocimiento muy bien delimitada.

## Diapositiva 2: *El conocimiento*

Para comprender la esencia de un Sistema Experto, primero es necesario entender la naturaleza de la información y del conocimiento que este asimila. En esta sección abordaremos detalladamente su tipología, cómo logramos realizar su extracción y los grandes desafíos lógicos computacionales a los que nos enfrentamos, destacando particularmente el Problema del Marco.

Para lograr gestionar toda esta información, la disciplina de la Ingeniería del Conocimiento se basa en cinco procesos o actividades fundamentales: la adquisición del conocimiento, su representación, la validación del comportamiento del sistema, la inferencia lógica y por último, el diseño de la capacidad de explicación y justificación del propio sistema. 


## Diapositiva 3: Tipología del Conocimiento
El diseño de un sistema inteligente requiere de diferentes capas cognitivas que interactúan entre sí para definir cómo la máquina comprende su entorno. Por lo tanto, en la Inteligencia Artificial el conocimiento se clasifica operativamente de la siguiente manera:

Primero tenemos el **Conocimiento Declarativo**. Esta es la base del sistema. Representa la información de los hechos, conceptos, y los atributos poseídos por un objeto o persona, así como las relaciones entre ellos. Podemos decir que responde a la pregunta de *qué* es algo.

En segundo lugar se encuentra el **Conocimiento Procedimental** o procedural. Esta es la dinámica operativa, conformada por algoritmos, secuencias de acciones lógicas y un conjunto de reglas que los expertos utilizan para solucionar problemas. Es decir, responde a *cómo* ejecutar una tarea paso a paso.

El tercero, y que constituye el núcleo de la pericia que diferencia a un experto, es el **Conocimiento Heurístico**. Estas son las *reglas de oro* o el conocimiento empírico e intuitivo del especialista. Estas reglas estratégicas reducen drásticamente el espacio de búsqueda computacional proporcionando vías pragmáticas para encontrar soluciones viables rápidamente. 

Finalmente llegamos al **Metaconocimiento**. Literalmente es el conocimiento sobre el propio conocimiento y sobre la experiencia. En el ámbito de los sistemas basados en conocimiento, forma parte del Motor de Inferencia y se refiere al conocimiento que tiene el sistema sobre sus propias capacidades de razonamiento u operación. Permite a la máquina evaluar estratégicamente la aplicabilidad de sus propias reglas, decidir qué heurística utilizar y explicar su línea de razonamiento al usuario.


## Diapositiva 4: Extracción del Conocimiento
Ahora bien, ¿cómo trasladamos toda esta información de la mente humana a la máquina? Aquí nos topamos con el llamado *Cuello de Botella de la Adquisición*, que constituye históricamente el mayor reto de los sistemas expertos. 

Gran parte de las capacidades y habilidades de un especialista reside en su conocimiento tácito; es decir, los humanos muchas veces saben más de lo que pueden expresar verbalmente. Por lo tanto, el Ingeniero del Conocimiento debe destilar esta intuición tácita hacia la máquina interactuando directamente con el experto humano. Para lograrlo, el ingeniero atraviesa cinco etapas: identificación, entendimiento, formalización, implementación y pruebas.

En este proceso se pueden utilizar herramientas manuales, como las entrevistas, o métodos automatizados que minimizan la dependencia del experto. Dentro de los automatizados destacan las reglas de inducción, donde el algoritmo más popular es el ID3. De hecho, al analizar conjuntos de datos e implementar el algoritmo ID3 calculando métricas como la entropía y la ganancia de información empíricamente con Python y LibreOffice Calc, he podido observar de primera mano cómo el sistema logra convertir una matriz de conocimiento en un árbol de decisión, eliminando eficientemente los atributos irrelevantes.

Sin embargo, los ingenieros enfrentan un segundo reto colosal a nivel lógico: el Problema del Marco (*Frame Problem*). Este problema describe la extrema dificultad computacional y matemática de modelar un entorno dinámico sin tener que declarar explícitamente todo lo que *NO* cambia al realizar una acción. Por ejemplo, si un robot mueve un bloque, nosotros por intuición sabemos que la temperatura del cuarto no cambió, pero para la máquina es un reto inmenso deducir todos esos *no-efectos* sin generar una explosión de cálculos.


## Diapositiva 5: *Bases del conocimiento*
Una vez que logramos extraer y formalizar toda esta información a través de los diversos procesos de adquisición, llegamos al segundo pilar de nuestra arquitectura: la Base de Conocimiento. 

Esta base funciona como el receptáculo arquitectónico permanente que estructura todo el dominio de especialidad o *expertise* del sistema. Para lograr un diseño verdaderamente robusto, no basta con acumular hechos aislados o introducir la información tal como llega; se requiere construir un entramado semántico que defina con exactitud cómo interactúan los conceptos entre sí.


## Diapositiva 6: Modelos de Representación
Para que la máquina pueda interpretar todo el conocimiento que hemos extraído, necesitamos plasmarlo en esquemas de representación formal que resulten inteligibles para el sistema. A lo largo de la evolución de la Ingeniería del Conocimiento, se han utilizado distintos paradigmas para estructurar esta información:

* Históricamente comenzamos con esquemas procedimentales como las **Reglas de Producción (IF-THEN)**, las cuales evalúan antecedentes para disparar una acción, siendo extremadamente eficaces para modelar heurísticas directas.
* A la par, se implementaron las **Reglas de Lógica Simbólica**. Estas utilizan tanto la lógica proposicional, apoyada en reglas de inferencia como el Modus Ponens o el Modus Tollens, como la lógica de predicados que emplea variables y cuantificadores con sintaxis propia.
* Posteriormente, evolucionamos hacia los **Marcos (Frames) o Slots** y las **Redes Semánticas**. Los marcos son estructuras de datos que dividen los objetos en componentes, organizándolos jerárquicamente para heredar los valores de sus atributos (slots). Por su parte, las redes semánticas representan gráficamente estas relaciones mediante nodos y enlaces de tipo *ES-UN*.
Finalmente, en la actualidad el estado del arte son las **Ontologías y Grafos de Conocimiento**. Estos implementan esquemas rigurosos como RDF para estructurar el conocimiento en la Web Semántica moderna, permitiendo la interoperabilidad de datos a una escala empresarial masiva.


## Diapositiva 7: Metodología CommonKADS
El proceso empírico de recolectar cientos o miles de reglas y marcos podía resultar sumamente caótico. Para estandarizar este proceso, el consorcio europeo ESPRIT desarrolló la Metodología CommonKADS. 

Esta metodología revolucionó el área porque aborda el desarrollo de un Sistema Experto no como una simple codificación aislada de reglas informáticas, sino como un modelado exhaustivo de toda la empresa, dividiéndolo en modelos interdependientes:

* Primero actúa el **Modelo Organizacional y de Tareas**, el cual analiza la estructura de la empresa para descubrir cuellos de botella y descompone las actividades en tareas rutinarias específicas.
* Luego interviene el **Modelo de Agentes y Comunicación**. Este modelo se encarga de especificar las capacidades y normas de los ejecutores, estructurando muy detalladamente los protocolos de interacción humano-computadora.
* Por último, el **Modelo de Conocimiento y Diseño** proporciona una representación ontológica conceptual, independiente de la programación, que posteriormente se traduce en la arquitectura computacional definitiva de software.

Gracias a CommonKADS, la creación de bases de conocimiento dejó de ser un arte esotérico para convertirse en una disciplina de ingeniería de software completamente auditable y rigurosa.


## Diapositiva 8: *Motor de Inferencia*
Habiendo establecido cómo se captura y se representa la información, llegamos al tercer gran pilar de nuestra arquitectura: el Motor de Inferencia. 

Si pensamos en la Base de Conocimiento como la memoria estática y permanente del sistema, el Motor de Inferencia actúa indiscutiblemente como su cerebro o procesador central. Este módulo es la porción de software diseñada para coordinar la memoria de trabajo temporal con la memoria permanente, habilitando a la computadora para generar inferencias lógicas, deducir nuevos hechos, proporcionar avisos y alcanzar conclusiones definitivas.

En este bloque profundizaremos en la mecánica algorítmica de este motor, sus estrategias de encadenamiento y cómo logra tomar decisiones válidas incluso cuando se enfrenta a escenarios de incertidumbre.


## Diapositiva 9: Las estrategias de encadenamiento
Para procesar el conocimiento, el motor utiliza dos estrategias lógicas diametralmente opuestas:

La primera es el **Encadenamiento Hacia Adelante (Data-Driven)** o dirigido por los datos. Esta estrategia inicia con un conjunto de hechos confirmados y aplica las reglas sistemáticamente de manera ascendente para deducir todas las ramificaciones posibles. Es un enfoque ideal para problemas de monitoreo y configuración. 
Inicialmente, procesar esto era tan pesado que paralizaba las computadoras, hasta que se optimizó con el revolucionario **Algoritmo Rete**. Este algoritmo soluciona el cuello de botella procesando únicamente los deltas de información; es decir, solo los cambios. Preserva el estado de los aciertos previos utilizando redes Alfa y Beta, lo que evita reevaluar todas las reglas iterativamente cada vez que entra un dato nuevo.

La segunda estrategia es el **Encadenamiento Hacia Atrás (Goal-Driven)** o dirigido por objetivos. Aquí, el motor asume primero una hipótesis final y rastrea retrospectivamente el árbol de decisiones en busca de las evidencias que la confirmarían. 

Al programar y estructurar algoritmos de búsqueda de rutas en grafos mediante Python, como es el caso de una búsqueda en anchura (BFS), resulta evidente la importancia matemática de saber recorrer eficientemente un árbol lógico sin saturar la memoria. De manera análoga, el encadenamiento hacia atrás navega eficientemente por los nodos: si la evidencia falta durante su recorrido retrospectivo, simplemente la convierte en una nueva submeta o le hace una consulta directa al usuario. Por su naturaleza de ir directo al objetivo, este paradigma es el mecanismo vital detrás de los sistemas de diagnóstico médico como MYCIN, ya que evita abrumar al doctor con cientos de preguntas irrelevantes.


## Diapositiva 10: Gestión de Incertidumbre
Pero al llevar estos motores lógicos al mundo real, surge un problema fundamental: en campos como la biomedicina, los expertos casi nunca manejan certezas lógicas absolutas de Verdadero o Falso. 

Originalmente, se intentó usar el Teorema de Bayes puro para calcular probabilidades, pero presentaba barreras de implementación impracticables. Este dependía de estadísticas exhaustivas sobre probabilidades condicionales entre todos los síntomas y enfermedades posibles, datos que los médicos raramente poseían o estaban dispuestos a cuantificar con precisión.

Para resolver este obstáculo matemático, Edward Shortliffe, mediante el sistema MYCIN, introdujo el modelo de Factores de Certeza o CF. Este marco de razonamiento inexacto cuantifica la confianza neta en una hipótesis en un rango estricto que va desde el -1, representando la falsedad definitiva, hasta el +1, que representa la verdad definitiva, siendo el cero la ignorancia completa. Matemáticamente, esto se calcula simplemente restando la Medida de Incredulidad a la Medida de Creencia.

Desde el punto de vista operativo, esta solución eludió la dependencia estadística estricta y resultó ser altamente intuitiva y transparente para los especialistas. Además, MYCIN complementó esto con un Módulo de Explicación que le permitía al sistema trazar retrospectivamente sus deducciones, detallándole al médico en lenguaje natural los *Cómos* y los *Por qués* detrás de cada factor de certeza calculado.


## Diapositiva 11: *Línea del Tiempo*
Habiendo analizado los tres grandes pilares arquitectónicos que conforman a estos sistemas, el conocimiento, la base y el motor de inferencia, resulta crucial entender cómo esta tecnología maduró a lo largo de las décadas. Por ello, pasamos a nuestro cuarto bloque: la evolución histórica de los Sistemas Expertos.

La historiografía de los sistemas expertos ilustra de manera fascinante la transición de la Inteligencia Artificial desde grandes abstracciones teóricas totalizadoras hacia aplicaciones de ingeniería práctica y altamente especializada. 

A continuación, realizaremos un recorrido cronológico para observar cómo esta disciplina atravesó picos de financiamiento eufórico comercial, también conocidos como los *veranos de la IA*, así como severos colapsos de desilusión e *inviernos* que terminaron por forjar y moldear la robusta arquitectura con la que operan el día de hoy.


## Diapositiva 12: Cronología
La trayectoria de la Inteligencia Artificial simbólica está marcada por un desarrollo fascinante y lleno de contrastes:

* Comenzamos en la década de **1965 a 1975** con la era de los Pioneros. Sistemas como DENDRAL, aplicado a la química, y MYCIN en la medicina, consolidaron el llamado *Principio del Conocimiento*. Demostraron que dotar a la máquina con el conocimiento empírico de un especialista superaba con creces a los algoritmos lógicos de propósito general.
* Esto nos llevó, de **1976 a 1985**, a una etapa de verdadero Apogeo. El éxito corporativo masivo de sistemas como XCON, que le ahorró a la empresa DEC cerca de 40 millones de dólares anuales, y PROSPECTOR, desató la era dorada de los *Shells* comerciales como EMYCIN. Estas *carcasas* permitían a las corporaciones crear sistemas expertos sin requerir títulos avanzados en ciencias de la computación.
* Sin embargo, de **1986 a 1995** la industria chocó contra una pared matemática, provocando el Segundo *Invierno de la IA* debido a la Catástrofe de la Complejidad. Se evidenció la inmensa fragilidad del mantenimiento de reglas. Proyectos heroicos y masivos como CYC intentaron codificar todo el *sentido común* del ser humano en millones de aserciones lógicas, pero terminaron demostrando que el sistema colapsaba al intentar actualizarse, generando conflictos imprevistos entre reglas distantes.
* Finalmente, desde **1996 hasta la actualidad**, presenciamos una Adopción Silenciosa. A pesar de perder el protagonismo mediático, los sistemas expertos jamás dejaron de operar, simplemente migraron. Sus lógicas se integraron en los Gestores de Reglas de Negocio (BRMS) corporativos que hoy estructuran las cadenas de suministro globales, así como en las Ontologías y grafos que dan vida a la arquitectura de la Web Semántica.

## Diapositiva 13: *Tipos de Sistemas Expertos*
Tras sobrevivir a ese *Invierno de la IA*, los ingenieros comprendieron que para superar las clásicas limitaciones de rigidez algorítmica y los altísimos costos de mantenimiento, la arquitectura central de los Sistemas Expertos debía evolucionar y diversificarse. 

Por ello, en esta recta final de la exposición, exploraremos los subtipos avanzados que fueron diseñados específicamente para confrontar las casuísticas complejas del mundo moderno. 

Veremos cómo la industria desarrolló la Lógica Difusa para manejar conceptos humanos vagos, el Razonamiento Basado en Casos (CBR) para resolver el problema de adquirir reglas emulando nuestra memoria episódica, y finalmente, la Inteligencia Artificial Neuro-Simbólica, que representa la culminación arquitectónica que integra lo mejor de estas tecnologías con las redes neuronales modernas.


## Diapositiva 14: Los Sistemas Expertos Difusos
El primer gran salto para superar estas limitaciones fue hacia los **Sistemas Expertos Difusos** o Fuzzy Logic. Los sistemas tradicionales operaban bajo una lógica booleana discreta que fracasaba al capturar continuos abstractos, como evaluar si algo está *templado*, *muy rápido* o *ligeramente doloroso*. La Lógica Difusa proveyó el andamiaje matemático para abordar con exactitud esta vaguedad. 

Existen modelos dentro de esta lógica, como el de Sugeno, que sacrifican interpretabilidad lingüística en favor de una eficiencia matemática superior, siendo ideales para bucles analíticos de baja latencia o controladores lógicos en robótica adaptativa.


## Diapositiva 15: Razonamiento basado en Casos
Como una alternativa directa a la inmensa dificultad de extraer y mantener bases de reglas frágiles, surgió el **Razonamiento Basado en Casos, o CBR**, el cual emula la memoria episódica teorizada en la psicología cognitiva. En lugar de deducir todo desde primeros principios, el sistema funciona en un ciclo continuo de aprendizaje basado en cuatro fases iterativas, conocidas como las 4 R:

1. Primero, **Recupera**: Mapea el problema actual e interroga su memoria episódica buscando casos históricos con una alta similitud paramétrica.
2. Segundo, **Reutiliza**: Aísla esa solución histórica y formula una proyección teórica inicial aplicada al escenario actual.
3. Tercero, **Revisa**: Testea y ajusta matemáticamente los gradientes de la respuesta teórica para que encajen perfectamente en las anomalías del nuevo contexto.
4. Y cuarto, **Retiene**: Consolida esta experiencia adaptada y la guarda como un nuevo caso, expandiendo de forma permanente el conocimiento orgánico del sistema.


## Diapositiva 16: IA Neuro-Simbólica
Finalmente, llegamos a la culminación arquitectónica moderna en la que nos encontramos hoy: la **IA Neuro-Simbólica**. Esta arquitectura integra formalmente el aprendizaje profundo, o Deep Learning, con el razonamiento experto. 

Por un lado, las redes neuronales tienen una capacidad perceptiva y estadística insuperable para reconocer patrones y manejar entornos ruidosos.

Sin embargo, a pesar de esta magia perceptiva, las redes neuronales son *cajas negras* que carecen de explicabilidad causal, no pueden ejecutar deducciones algebraicas rígidas y sufren de alucinaciones impredecibles. La IA Neuro-simbólica soluciona esto tomando la maravillosa percepción estadística de las redes y alimentándola a un motor lógico simbólico que aplica una deducción precisa, explicativa y determinista. Esta simbiosis proporciona la trazabilidad auditada que es absolutamente indispensable para desplegar Inteligencias Artificiales de manera segura en ambientes de misión crítica.


## Conclusiones finales.

> Las conclusiones finales de la exposición se realizan frente a cámara de cuerpo completo

Para cerrar, la evolución de los Sistemas Expertos demuestra que su arquitectura nunca desapareció, sino que se transformó y adaptó de manera invisible en la tecnología actual, desde la lógica difusa hasta los sistemas transaccionales y ontológicos globales.

Hoy en día, con el auge de la IA neuro-simbólica, queda claro que la estadística por sí sola no es suficiente. La precisión lógica y explicativa de los sistemas expertos sigue siendo una salvaguarda ética y funcional indispensable para el desarrollo de inteligencias artificiales de misión crítica.

Muchas gracias por su atención. Mi nombre es Cristóbal Rafael Lara Páez, y quedo a su entera disposición para cualquier pregunta, duda o comentario técnico.