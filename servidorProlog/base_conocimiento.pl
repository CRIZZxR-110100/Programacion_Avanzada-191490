:- encoding(utf8).

% Declaracion dinamica para poder cambiar la base de conocimientos en tiempo de ejecucion
:- dynamic profesor/5.
:- dynamic estudios/4.
:- dynamic acreditacion/3.
:- dynamic capacitacion_tomada/3.
:- dynamic cuerpo_academico/5.
:- dynamic academia/4.
:- dynamic proyecto/8.
:- dynamic curso/5.
:- dynamic curso_capacitacion/6.
:- dynamic comision/3.
:- dynamic area_tematica/2.
:- dynamic asignacion/3.


% Profesores: profesor(#empleado, nombre, grado, especialidad, cursos_dominados)
% La lista de cursos esta en orden de prelacion (de mayor a menor dominio).
profesor(101, 'Dr. Roberto Gomez Morales', doctorado, 'Inteligencia Artificial',
         ['Sistemas Expertos', 'Programacion Logica', 'Aprendizaje Automatico', 'Estructuras de Datos']).
profesor(102, 'Dra. Maria Elena Sanchez Ruiz', doctorado, 'Bases de Datos',
         ['Bases de Datos', 'Mineria de Datos', 'Estructuras de Datos', 'Programacion Web']).
profesor(103, 'Mtro. Carlos Mendoza Cruz', maestria, 'Ingenieria de Software',
         ['Ingenieria de Software', 'Programacion Web', 'Pruebas de Software', 'Estructuras de Datos']).
profesor(104, 'Dr. Alejandro Rios Lopez', doctorado, 'Redes y Telecomunicaciones',
         ['Redes de Computadoras', 'Sistemas Distribuidos', 'Seguridad Informatica']).
profesor(105, 'Mtra. Ana Patricia Dominguez Lara', maestria, 'Ciberseguridad',
         ['Seguridad Informatica', 'Redes de Computadoras', 'Programacion Web']).
profesor(106, 'Ing. Fernando Zavala Hernandez', licenciatura, 'Desarrollo Web',
         ['Programacion Web', 'Pruebas de Software', 'Estructuras de Datos']).
profesor(107, 'Dra. Gabriela Fuentes Paredes', doctorado, 'Ciencia de Datos',
         ['Aprendizaje Automatico', 'Mineria de Datos', 'Sistemas Expertos', 'Bases de Datos']).


% Estudios: estudios(#empleado, licenciatura, maestria, doctorado)
% Cada grado: grado(Titulo, Institucion, Anio) o el atomo 'ninguno'.
estudios(101, grado('Ing. en Computacion', 'UNACAR', 2008),
              grado('Maestria en Ciencias de la Computacion', 'INAOE', 2012),
              grado('Doctorado en Inteligencia Artificial', 'LANIA', 2017)).
estudios(102, grado('Lic. en Informatica', 'UNACAR', 2009),
              grado('Maestria en Tecnologias de la Informacion', 'UNAM', 2013),
              grado('Doctorado en Ciencias Computacionales', 'CINVESTAV', 2018)).
estudios(103, grado('Ing. en Software', 'UV', 2012),
              grado('Maestria en Ingenieria de Software', 'CIMAT', 2016),
              ninguno).
estudios(104, grado('Ing. en Telematica', 'IPN', 2007),
              grado('Maestria en Telecomunicaciones', 'CINVESTAV', 2011),
              grado('Doctorado en Redes', 'UAM', 2016)).
estudios(105, grado('Ing. en Sistemas Computacionales', 'UNACAR', 2014),
              grado('Maestria en Seguridad Informatica', 'UANL', 2018),
              ninguno).
estudios(106, grado('Ing. en Sistemas Computacionales', 'UNACAR', 2019), ninguno, ninguno).
estudios(107, grado('Lic. en Matematicas Aplicadas', 'UNAM', 2010),
              grado('Maestria en Ciencia de Datos', 'ITAM', 2014),
              grado('Doctorado en Ciencias Computacionales', 'CINVESTAV', 2019)).


% Acreditaciones: acreditacion(#empleado, nombre, tipo) [prodep | sni | certificacion]
acreditacion(101, 'Perfil Deseable PRODEP', prodep).
acreditacion(101, 'SNII Nivel I', sni).
acreditacion(102, 'Perfil Deseable PRODEP', prodep).
acreditacion(102, 'SNII Nivel I', sni).
acreditacion(102, 'Oracle Database Certified', certificacion).
acreditacion(103, 'Perfil Deseable PRODEP', prodep).
acreditacion(103, 'Scrum Master Certified', certificacion).
acreditacion(104, 'Perfil Deseable PRODEP', prodep).
acreditacion(104, 'SNII Nivel I', sni).
acreditacion(104, 'Cisco CCNA', certificacion).
acreditacion(105, 'CompTIA Security+', certificacion).
acreditacion(106, 'AWS Cloud Practitioner', certificacion).
acreditacion(107, 'Perfil Deseable PRODEP', prodep).
acreditacion(107, 'SNII Nivel I', sni).


% Capacitaciones tomadas: capacitacion_tomada(#empleado, nombre_curso, anio)
capacitacion_tomada(101, 'Redes Neuronales Profundas', 2024).
capacitacion_tomada(101, 'Docencia Basada en Competencias', 2023).
capacitacion_tomada(102, 'Big Data con Spark', 2024).
capacitacion_tomada(102, 'Evaluacion por Competencias', 2023).
capacitacion_tomada(103, 'Metodologias Agiles', 2024).
capacitacion_tomada(103, 'DevOps y Contenedores', 2025).
capacitacion_tomada(104, 'Seguridad en Redes', 2024).
capacitacion_tomada(105, 'Hacking Etico', 2025).
capacitacion_tomada(105, 'Seguridad en Redes', 2023).
capacitacion_tomada(106, 'React y Node.js', 2025).
capacitacion_tomada(107, 'Redes Neuronales Profundas', 2025).
capacitacion_tomada(107, 'Big Data con Spark', 2023).


% Cuerpos Academicos: cuerpo_academico(id, nombre, linea_inv, lider, estatus)
cuerpo_academico(ca1, 'Sistemas Inteligentes',
                 'Inteligencia Artificial y Ciencia de Datos', 101, consolidado).
cuerpo_academico(ca2, 'Ingenieria de Software y Tecnologias Web',
                 'Desarrollo de Software de Calidad', 103, en_consolidacion).
cuerpo_academico(ca3, 'Redes y Seguridad de la Informacion',
                 'Seguridad en Redes y Sistemas Distribuidos', 104, en_formacion).


% Academias: academia(id, nombre, materias, lider)
academia(acad_ia, 'Academia de Inteligencia Artificial',
         ['Sistemas Expertos', 'Programacion Logica', 'Aprendizaje Automatico'], 101).
academia(acad_sw, 'Academia de Ingenieria de Software',
         ['Ingenieria de Software', 'Pruebas de Software', 'Estructuras de Datos', 'Programacion Web'], 103).
academia(acad_redes, 'Academia de Redes y Seguridad',
         ['Redes de Computadoras', 'Sistemas Distribuidos', 'Seguridad Informatica'], 104).
academia(acad_datos, 'Academia de Bases de Datos',
         ['Bases de Datos', 'Mineria de Datos'], 102).


% Proyectos: proyecto(id, nombre, objetivo, entregables, lider, integrantes, inicio, fin)
proyecto(p1, 'Tutor Inteligente para Programacion',
         'Desarrollar un sistema experto que guie a estudiantes de programacion',
         ['Prototipo funcional', 'Articulo indexado', 'Manual de usuario'],
         101, [101, 107], '2026-02-01', '2026-12-15').
proyecto(p2, 'Plataforma de Seguimiento de Egresados',
         'Desarrollar una plataforma web para el seguimiento de egresados de la FCI',
         ['Sistema web', 'Manual tecnico'],
         103, [103, 106], '2026-03-01', '2026-11-30').
proyecto(p3, 'Monitoreo de Seguridad en la Red Universitaria',
         'Detectar intrusiones y vulnerabilidades en la red del campus',
         ['Informe de vulnerabilidades', 'Tablero de monitoreo'],
         104, [104, 105], '2026-01-15', '2026-10-30').
proyecto(p4, 'Prediccion de Desercion Estudiantil',
         'Aplicar mineria de datos para predecir la desercion estudiantil',
         ['Modelo predictivo', 'Reporte ejecutivo'],
         102, [102], '2026-04-01', '2026-12-01').


% Cursos: curso(id, creditos, nombre, objetivo, academia)
curso(c1,  8, 'Sistemas Expertos',      'Construir sistemas basados en conocimiento', acad_ia).
curso(c2,  6, 'Programacion Logica',    'Resolver problemas con logica de predicados y Prolog', acad_ia).
curso(c3,  8, 'Aprendizaje Automatico', 'Aplicar modelos de clasificacion y regresion', acad_ia).
curso(c4,  8, 'Ingenieria de Software', 'Gestionar el ciclo de vida del software', acad_sw).
curso(c5,  6, 'Pruebas de Software',    'Disenar y automatizar pruebas de software', acad_sw).
curso(c6,  8, 'Estructuras de Datos',   'Implementar estructuras de datos y algoritmos', acad_sw).
curso(c7,  6, 'Programacion Web',       'Desarrollar aplicaciones web cliente-servidor', acad_sw).
curso(c8,  8, 'Redes de Computadoras',  'Configurar redes y protocolos TCP/IP', acad_redes).
curso(c9,  6, 'Sistemas Distribuidos',  'Construir aplicaciones distribuidas', acad_redes).
curso(c10, 6, 'Seguridad Informatica',  'Analizar amenazas y aplicar criptografia', acad_redes).
curso(c11, 8, 'Bases de Datos',         'Modelar y consultar bases de datos', acad_datos).
curso(c12, 6, 'Mineria de Datos',       'Descubrir patrones en grandes volumenes de datos', acad_datos).


% Cursos de Capacitacion Docente: curso_capacitacion(id, nombre, objetivo, horas, inicio, fin)
curso_capacitacion(cap1, 'IA Generativa para la Docencia',
                   'Usar modelos generativos en la practica docente', 40, '2026-06-15', '2026-06-26').
curso_capacitacion(cap2, 'Ciberseguridad en la Nube',
                   'Asegurar servicios desplegados en la nube', 30, '2026-07-01', '2026-07-10').
curso_capacitacion(cap3, 'Diseno Instruccional y Evaluacion por Competencias',
                   'Disenar rubricas alineadas al modelo educativo', 30, '2026-08-03', '2026-08-14').
curso_capacitacion(cap4, 'Desarrollo Web Moderno con Frameworks',
                   'Actualizar en frameworks web modernos', 30, '2026-07-13', '2026-07-24').
curso_capacitacion(cap5, 'Analitica de Datos con Python',
                   'Aplicar analitica y visualizacion de datos', 25, '2026-08-17', '2026-08-28').


% Comisiones: comision(id, nombre, descripcion)
comision(com1, 'Comision de Acreditacion CACEI', 'Integrar evidencias para la acreditacion del programa').
comision(com2, 'Comite de Seguridad Informatica', 'Definir politicas de seguridad de la facultad').
comision(com3, 'Comite de Laboratorios y Software', 'Administrar laboratorios y software academico').
comision(com4, 'Comite de Investigacion y Posgrado', 'Evaluar protocolos de investigacion y posgrado').


% Areas Tematicas para afinidad disciplinar
area_tematica(ia, ['Inteligencia Artificial', 'Sistemas Expertos', 'Programacion Logica',
                   'Aprendizaje Automatico', 'Redes Neuronales Profundas',
                   'IA Generativa para la Docencia', 'acad_ia', ca1, p1, cap1]).
area_tematica(datos, ['Ciencia de Datos', 'Bases de Datos', 'Mineria de Datos',
                      'Big Data con Spark', 'Analitica de Datos con Python',
                      'Prediccion de Desercion Estudiantil', 'acad_datos', ca1, p4, cap5]).
area_tematica(software, ['Ingenieria de Software', 'Desarrollo Web', 'Pruebas de Software',
                         'Estructuras de Datos', 'Programacion Web', 'React y Node.js',
                         'DevOps y Contenedores', 'Metodologias Agiles',
                         'acad_sw', ca2, p1, p2, cap4, com1, com3]).
area_tematica(redes, ['Redes y Telecomunicaciones', 'Ciberseguridad', 'Redes de Computadoras',
                      'Sistemas Distribuidos', 'Seguridad Informatica', 'Seguridad en Redes',
                      'Hacking Etico', 'Ciberseguridad en la Nube',
                      'acad_redes', ca3, p3, cap2, com2]).
area_tematica(educacion, ['Docencia Basada en Competencias', 'Evaluacion por Competencias',
                          'Diseno Instruccional y Evaluacion por Competencias', cap3, com1]).
area_tematica(investigacion, ['Comite de Investigacion y Posgrado', com4]).


% Metodos para la manipulacion dinamica de la base de conocimiento
agregar_profesor(Emp, Nom, Grado, Esp, Cursos) :-
    retractall(profesor(Emp, _, _, _, _)),
    assertz(profesor(Emp, Nom, Grado, Esp, Cursos)).

agregar_estudios(Emp, Lic, Mae, Doc) :-
    retractall(estudios(Emp, _, _, _)),
    assertz(estudios(Emp, Lic, Mae, Doc)).

agregar_acreditacion(Emp, Nom, Tipo) :-
    assertz(acreditacion(Emp, Nom, Tipo)).

agregar_capacitacion_tomada(Emp, Nom, Anio) :-
    assertz(capacitacion_tomada(Emp, Nom, Anio)).

agregar_curso(Id, Cred, Nom, Obj, Acad) :-
    retractall(curso(Id, _, _, _, _)),
    assertz(curso(Id, Cred, Nom, Obj, Acad)).

agregar_asignacion(Tipo, Emp, Destino) :-
    ( asignacion(Tipo, Emp, Destino) -> true ; assertz(asignacion(Tipo, Emp, Destino)) ).

eliminar_asignacion(Tipo, Emp, Destino) :-
    retractall(asignacion(Tipo, Emp, Destino)).

inicializar_asignaciones :-
    retractall(asignacion(_, _, _)),
    forall(academia(Id, _, _, L), assertz(asignacion(academia, L, Id))),
    forall(cuerpo_academico(Id, _, _, L, _), assertz(asignacion(cuerpo_academico, L, Id))),
    forall((proyecto(Id, _, _, _, _, Ints, _, _), member(E, Ints)),
           assertz(asignacion(proyecto, E, Id))),
    assertz(asignacion(curso, 101, c1)),
    assertz(asignacion(curso, 104, c8)),
    assertz(asignacion(comision, 103, com1)),
    assertz(asignacion(comision, 105, com2)).
