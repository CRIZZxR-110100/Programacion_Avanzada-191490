:- encoding(utf8).

% Modulos HTTP, JSON y listas
:- use_module(library(http/http_server)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_json)).
:- use_module(library(lists)).
:- use_module(library(pairs)).

% Carga de la base de conocimiento dinamica
:- consult(base_conocimiento).
:- initialization(inicializar_asignaciones).

% Servidor HTTP en el puerto 8080
servidor(Puerto) :- http_server([port(Puerto)]).
:- initialization(servidor(8080)).

% ----------------------------------------------------------------------------
% Reglas de Afinidad Tematica
% ----------------------------------------------------------------------------
afin(X, Y) :-
    area_tematica(_, L), member(X, L), member(Y, L), !.
afin(X, Y) :-
    downcase_atom(X, LX), downcase_atom(Y, LY),
    ( sub_atom(LX, _, _, _, LY) ; sub_atom(LY, _, _, _, LX) ), !.

% ----------------------------------------------------------------------------
% Puntuaciones base
% ----------------------------------------------------------------------------
puntos_grado(doctorado, 30).
puntos_grado(maestria, 20).
puntos_grado(licenciatura, 10).

puntos_posicion(1, 40) :- !.
puntos_posicion(2, 30) :- !.
puntos_posicion(3, 20) :- !.
puntos_posicion(P, 10) :- P >= 4, !.
puntos_posicion(_, 0).

% ----------------------------------------------------------------------------
% Evaluadores por tipo de asignacion (Opciones 1 - 5)
% ----------------------------------------------------------------------------

% Opcion 1: Academias (materias dominadas y especialidad afin)
evaluar(academia, Emp, IdA, _{empleado: Emp, nombre: Nom, grado: Grado, especialidad: Esp,
                             apto: Apto, materias_dominadas: Dominadas, puntaje: Total}) :-
    academia(IdA, NomA, Materias, _),
    profesor(Emp, Nom, Grado, Esp, Cursos),
    findall(M, (member(M, Materias), member(M, Cursos)), Dominadas),
    length(Dominadas, ND), PtsMat is ND * 25,
    puntos_grado(Grado, PtsGrado),
    ( (afin(Esp, NomA) ; (member(M, Materias), afin(Esp, M))) -> PtsEsp = 20 ; PtsEsp = 0 ),
    Total is PtsMat + PtsGrado + PtsEsp,
    ( (ND > 0 ; PtsEsp > 0) -> Apto = true ; Apto = false ).

% Opcion 2: Cuerpos Academicos (posgrado, linea afin y acreditaciones)
evaluar(cuerpo_academico, Emp, IdCA, _{empleado: Emp, nombre: Nom, grado: Grado, especialidad: Esp,
                                      apto: Apto, rol_propuesto: Rol, puntaje: Total}) :-
    cuerpo_academico(IdCA, _, Linea, _, _),
    profesor(Emp, Nom, Grado, Esp, _),
    puntos_grado(Grado, PtsGrado),
    ( afin(Esp, Linea) -> PtsLinea = 35 ; PtsLinea = 0 ),
    ( acreditacion(Emp, _, prodep) -> PtsProdep = 15 ; PtsProdep = 0 ),
    ( acreditacion(Emp, _, sni)    -> PtsSni = 20    ; PtsSni = 0 ),
    Total is PtsGrado + PtsLinea + PtsProdep + PtsSni,
    (   Grado == licenciatura -> Apto = false, Rol = 'no_elegible_requiere_posgrado'
    ;   PtsLinea =:= 0        -> Apto = false, Rol = 'no_afin'
    ;   Grado == doctorado    -> Apto = true,  Rol = 'integrante'
    ;   Apto = true, Rol = 'colaborador'
    ).

% Opcion 3: Proyectos (especialidad o materias afines)
evaluar(proyecto, Emp, IdP, _{empleado: Emp, nombre: Nom, grado: Grado, especialidad: Esp,
                             apto: Apto, puntaje: Total}) :-
    proyecto(IdP, NomP, _, _, _, _, _, _),
    profesor(Emp, Nom, Grado, Esp, Cursos),
    puntos_grado(Grado, PtsGrado),
    ( (afin(Esp, NomP) ; afin(IdP, Esp)) -> PtsEsp = 35 ; PtsEsp = 0 ),
    findall(C, (member(C, Cursos), (afin(C, NomP) ; afin(IdP, C))), CursosAfines),
    length(CursosAfines, NC), PtsCursos is min(30, NC * 15),
    Total is PtsGrado + PtsEsp + PtsCursos,
    ( (PtsEsp > 0 ; PtsCursos > 0) -> Apto = true ; Apto = false ).

% Opcion 4: Cursos (orden de dominio de la materia + grado + especialidad)
evaluar(curso, Emp, IdC, _{empleado: Emp, nombre: Nom, grado: Grado, especialidad: Esp,
                          apto: Apto, posicion_en_lista: Pos, puntaje: Total}) :-
    curso(IdC, _, NomCurso, _, _),
    profesor(Emp, Nom, Grado, Esp, Cursos),
    ( nth1(Pos, Cursos, NomCurso) -> puntos_posicion(Pos, PtsPos), Apto = true
    ; Pos = 0, PtsPos = 0, Apto = false
    ),
    puntos_grado(Grado, PtsGrado),
    ( afin(Esp, NomCurso) -> PtsEsp = 20 ; PtsEsp = 0 ),
    Total is PtsPos + PtsGrado + PtsEsp.

% Opcion 5: Capacitaciones (docentes afines que aun no la han cursado)
evaluar(capacitacion, Emp, IdCap, _{empleado: Emp, nombre: Nom, grado: Grado, especialidad: Esp,
                                   apto: Apto, prioridad: Prioridad, puntaje: Total}) :-
    curso_capacitacion(IdCap, NomCap, _, _, _, _),
    profesor(Emp, Nom, Grado, Esp, Cursos),
    (   capacitacion_tomada(Emp, NomCap, _)
    ->  Apto = false, Prioridad = 'ya_lo_tomo', Total = 0
    ;   (afin(Esp, NomCap) ; afin(IdCap, Esp))
    ->  Apto = true, Prioridad = 'alta', Total = 50
    ;   member(C, Cursos), (afin(C, NomCap) ; afin(IdCap, C))
    ->  Apto = true, Prioridad = 'media', Total = 30
    ;   afin(IdCap, cap3)
    ->  Apto = true, Prioridad = 'media', Total = 25
    ;   Apto = false, Prioridad = 'baja', Total = 10
    ).

% Evaluacion de Comisiones
evaluar(comision, Emp, IdCom, _{empleado: Emp, nombre: Nom, grado: Grado, especialidad: Esp,
                               apto: Apto, puntaje: Total}) :-
    comision(IdCom, NomCom, _),
    profesor(Emp, Nom, Grado, Esp, _),
    puntos_grado(Grado, PtsGrado),
    ( (afin(Esp, NomCom) ; afin(IdCom, Esp)) -> PtsEsp = 30 ; PtsEsp = 0 ),
    Total is PtsGrado + PtsEsp,
    ( (PtsEsp > 0 ; Grado \== licenciatura) -> Apto = true ; Apto = false ).

% ----------------------------------------------------------------------------
% Ranking y guardado de asignaciones
% ----------------------------------------------------------------------------
rankear(Tipo, Id, Ranking) :-
    findall(P-Res, (profesor(Emp, _, _, _, _), evaluar(Tipo, Emp, Id, Res), P = Res.puntaje), Pares),
    sort(1, @>=, Pares, Ordenados),
    pairs_values(Ordenados, Ranking).

es_apto(R) :- get_dict(apto, R, true).

guardar(curso, Id, [Mejor|_]) :- !,
    retractall(asignacion(curso, _, Id)),
    assertz(asignacion(curso, Mejor.empleado, Id)).
guardar(curso, _, []) :- !.
guardar(Tipo, Id, Aptos) :-
    forall(member(A, Aptos), agregar_asignacion(Tipo, A.empleado, Id)).

% ----------------------------------------------------------------------------
% Serializacion JSON y armado de expedientes
% ----------------------------------------------------------------------------
lider_json(Emp, _{empleado: Emp, nombre: Nom}) :- profesor(Emp, Nom, _, _, _).

asignados(Tipo, Id, L) :-
    findall(_{empleado: E, nombre: Nom},
            (asignacion(Tipo, E, Id), profesor(E, Nom, _, _, _)), L).

entidad(academia, Id, _{id: Id, nombre: N, materias: M, lider: LJ, asignados: A}) :-
    academia(Id, N, M, L), lider_json(L, LJ), asignados(academia, Id, A).
entidad(cuerpo_academico, Id, _{id: Id, nombre: N, linea_investigacion: Li, lider: LJ, estatus: S, asignados: A}) :-
    cuerpo_academico(Id, N, Li, L, S), lider_json(L, LJ), asignados(cuerpo_academico, Id, A).
entidad(proyecto, Id, _{id: Id, nombre: N, objetivo: O, entregables: En, lider: LJ, integrantes: A, fecha_inicio: FI, fecha_entrega: FE}) :-
    proyecto(Id, N, O, En, L, _, FI, FE), lider_json(L, LJ), asignados(proyecto, Id, A).
entidad(curso, Id, _{id: Id, creditos: C, nombre: N, objetivo: O, academia: Ac, asignados: A}) :-
    curso(Id, C, N, O, Ac), asignados(curso, Id, A).
entidad(capacitacion, Id, _{id: Id, nombre: N, objetivo: O, horas: H, fecha_inicio: FI, fecha_conclusion: FC, asignados: A}) :-
    curso_capacitacion(Id, N, O, H, FI, FC), asignados(capacitacion, Id, A).
entidad(comision, Id, _{id: Id, nombre: N, descripcion: D, asignados: A}) :-
    comision(Id, N, D), asignados(comision, Id, A).

nombre_destino(Tipo, Id, Nombre) :- entidad(Tipo, Id, E), Nombre = E.nombre.

rol(academia, E, Id, lider)         :- academia(Id, _, _, E), !.
rol(cuerpo_academico, E, Id, lider) :- cuerpo_academico(Id, _, _, E, _), !.
rol(proyecto, E, Id, lider)         :- proyecto(Id, _, _, _, E, _, _, _), !.
rol(curso, _, _, titular)           :- !.
rol(capacitacion, _, _, alumno)     :- !.
rol(_, _, _, integrante).

asignaciones_de(Emp, Tipo, L) :-
    findall(_{id: Id, nombre: N, rol: R},
            (asignacion(Tipo, Emp, Id), nombre_destino(Tipo, Id, N), rol(Tipo, Emp, Id, R)), L).

grado_json(ninguno, null) :- !.
grado_json(grado(T, I, A), _{titulo: T, institucion: I, anio: A}).

% Opcion 6: Busqueda integral de expediente y asignaciones de un profesor
expediente(Emp, _{empleado: Emp, nombre: N, grado: G, especialidad: E, cursos_que_domina: C,
                  estudios: _{licenciatura: L, maestria: M, doctorado: D},
                  acreditaciones: Acr, capacitaciones_tomadas: Caps,
                  asignaciones: _{academias: A1, cuerpos_academicos: A2, proyectos: A3,
                                  cursos: A4, capacitaciones: A5, comisiones: A6}}) :-
    profesor(Emp, N, G, E, C),
    estudios(Emp, L0, M0, D0),
    maplist(grado_json, [L0, M0, D0], [L, M, D]),
    findall(_{nombre: AN, tipo: AT}, acreditacion(Emp, AN, AT), Acr),
    findall(_{nombre: CN, anio: CA}, capacitacion_tomada(Emp, CN, CA), Caps),
    asignaciones_de(Emp, academia, A1),
    asignaciones_de(Emp, cuerpo_academico, A2),
    asignaciones_de(Emp, proyecto, A3),
    asignaciones_de(Emp, curso, A4),
    asignaciones_de(Emp, capacitacion, A5),
    asignaciones_de(Emp, comision, A6).

coincide_profesor(Q, Emp) :-
    atom_number(Q, Emp), integer(Emp), profesor(Emp, _, _, _, _), !.
coincide_profesor(Q, Emp) :-
    downcase_atom(Q, LQ),
    profesor(Emp, Nombre, _, _, _),
    downcase_atom(Nombre, LN),
    sub_atom(LN, _, _, _, LQ).

% ----------------------------------------------------------------------------
% Endpoints HTTP REST
% ----------------------------------------------------------------------------
tipos([academia, cuerpo_academico, proyecto, comision, curso, capacitacion]).

% Documentacion de endpoints
:- http_handler(root(.), api_indice, []).
:- http_handler(root(api), api_indice, []).

% Catalogos de entidades
:- http_handler(root(api/profesores), api_profesores, []).
:- http_handler(root(api/academias), api_catalogo(academia), []).
:- http_handler(root(api/cuerpos_academicos), api_catalogo(cuerpo_academico), []).
:- http_handler(root(api/proyectos), api_catalogo(proyecto), []).
:- http_handler(root(api/cursos), api_catalogo(curso), []).
:- http_handler(root(api/capacitaciones), api_catalogo(capacitacion), []).
:- http_handler(root(api/comisiones), api_catalogo(comision), []).

% Opciones 1 - 5: Asignaciones recomendadas
:- http_handler(root(api/asignar/academia), api_opcion(academia), []).
:- http_handler(root(api/asignar/cuerpo_academico), api_opcion(cuerpo_academico), []).
:- http_handler(root(api/asignar/proyecto), api_opcion(proyecto), []).
:- http_handler(root(api/asignar/curso), api_opcion(curso), []).
:- http_handler(root(api/asignar/capacitacion), api_opcion(capacitacion), []).
:- http_handler(root(api/asignar/comision), api_opcion(comision), []).

% Opcion 6: Busqueda de expediente de profesor
:- http_handler(root(api/profesor), api_profesor, []).

% Administracion de asignaciones
:- http_handler(root(api/asignaciones), api_asignaciones, []).
:- http_handler(root(api/asignar/manual), api_asignar_manual, []).
:- http_handler(root(api/desasignar), api_desasignar, []).
:- http_handler(root(api/reiniciar), api_reiniciar, []).

% Registro dinamico en la Base de Conocimiento
:- http_handler(root(api/agregar/profesor), api_agregar_profesor, []).
:- http_handler(root(api/agregar/curso), api_agregar_curso, []).

% ----------------------------------------------------------------------------
% Controladores de rutas
% ----------------------------------------------------------------------------
api_indice(_Request) :-
    reply_json_dict(_{
        sistema: "Sistema Experto de Asignacion de Profesores - FCI UNACAR",
        version: "2.1 (Modular y Dinamico)",
        endpoints: [
            _{opcion: 1, ruta: "/api/asignar/academia?id=acad_ia[&guardar=si]"},
            _{opcion: 2, ruta: "/api/asignar/cuerpo_academico?id=ca1[&guardar=si]"},
            _{opcion: 3, ruta: "/api/asignar/proyecto?id=p1[&guardar=si]"},
            _{opcion: 4, ruta: "/api/asignar/curso?id=c1[&guardar=si]", desc: "Selecciona al mejor profesor"},
            _{opcion: 5, ruta: "/api/asignar/capacitacion?id=cap1[&guardar=si]"},
            _{opcion: 6, ruta: "/api/profesor?q=101", desc: "Expediente y asignaciones del profesor"},
            _{opcion: catalogos, rutas: ["/api/profesores", "/api/academias", "/api/cuerpos_academicos",
                                         "/api/proyectos", "/api/cursos", "/api/capacitaciones", "/api/comisiones"]},
            _{opcion: dinamico, rutas: [
                "/api/agregar/profesor?empleado=108&nombre=...&grado=doctorado&especialidad=...&cursos=C1,C2",
                "/api/agregar/curso?id=c13&creditos=8&nombre=...&objetivo=...&academia=acad_ia"
            ]},
            _{opcion: admin, rutas: [
                "/api/asignaciones",
                "/api/asignar/manual?tipo=proyecto&empleado=105&destino=p1",
                "/api/desasignar?tipo=proyecto&empleado=105&destino=p1",
                "/api/reiniciar"
            ]}
        ]
    }).

api_profesores(_Request) :-
    findall(_{empleado: E, nombre: N, grado: G, especialidad: Es, cursos_que_domina: C},
            profesor(E, N, G, Es, C), L),
    length(L, Total),
    reply_json_dict(_{total: Total, profesores: L}).

api_catalogo(Tipo, _Request) :-
    findall(E, entidad(Tipo, _, E), L),
    length(L, Total),
    reply_json_dict(_{tipo: Tipo, total: Total, elementos: L}).

api_opcion(Tipo, Request) :-
    http_parameters(Request, [ id(Id, [atom]),
                                guardar(G, [oneof([si, no]), default(no)]) ]),
    (   entidad(Tipo, Id, _)
    ->  rankear(Tipo, Id, Ranking),
        include(es_apto, Ranking, Aptos),
        ( Aptos = [Mejor|_] -> true ; Mejor = null ),
        ( G == si -> guardar(Tipo, Id, Aptos) ; true ),
        entidad(Tipo, Id, Info),
        length(Aptos, NAptos),
        reply_json_dict(_{opcion: Tipo, destino: Info, guardado: G,
                          mejor_candidato: Mejor, total_aptos: NAptos,
                          recomendados: Aptos, ranking_completo: Ranking})
    ;   reply_json_dict(_{error: "Destino no encontrado", tipo: Tipo, id: Id}, [status(404)])
    ).

api_profesor(Request) :-
    http_parameters(Request, [q(Q, [atom])]),
    findall(E, coincide_profesor(Q, E), L0), sort(L0, Emps),
    (   Emps == []
    ->  reply_json_dict(_{error: "Profesor no encontrado", q: Q}, [status(404)])
    ;   maplist(expediente, Emps, Exps),
        length(Exps, Total),
        reply_json_dict(_{q: Q, total: Total, resultados: Exps})
    ).

api_asignaciones(_Request) :-
    findall(_{tipo: T, empleado: E, profesor: PN, destino: D, nombre_destino: DN},
            (asignacion(T, E, D), profesor(E, PN, _, _, _), nombre_destino(T, D, DN)), L),
    length(L, Total),
    reply_json_dict(_{total: Total, asignaciones: L}).

api_asignar_manual(Request) :-
    tipos(Ts),
    http_parameters(Request, [ tipo(T, [oneof(Ts)]), empleado(E, [integer]), destino(D, [atom]) ]),
    (   \+ profesor(E, _, _, _, _)
    ->  reply_json_dict(_{error: "Profesor no existe"}, [status(404)])
    ;   \+ entidad(T, D, _)
    ->  reply_json_dict(_{error: "Destino no existe"}, [status(404)])
    ;   ( T == curso -> retractall(asignacion(curso, _, D)) ; true ),
        agregar_asignacion(T, E, D),
        expediente(E, Exp),
        reply_json_dict(_{mensaje: "Asignacion registrada", profesor: Exp})
    ).

api_desasignar(Request) :-
    tipos(Ts),
    http_parameters(Request, [ tipo(T, [oneof(Ts)]), empleado(E, [integer]), destino(D, [atom]) ]),
    eliminar_asignacion(T, E, D),
    reply_json_dict(_{mensaje: "Asignacion eliminada", tipo: T, empleado: E, destino: D}).

api_reiniciar(_Request) :-
    inicializar_asignaciones,
    reply_json_dict(_{mensaje: "Asignaciones restablecidas a los valores iniciales"}).

limpiar_espacio(In, Out) :- normalize_space(atom(Out), In).

% Adicion dinamica de un profesor
api_agregar_profesor(Request) :-
    http_parameters(Request, [
        empleado(Emp, [integer]),
        nombre(Nom, [atom]),
        grado(Grado, [oneof([licenciatura, maestria, doctorado])]),
        especialidad(Esp, [atom]),
        cursos(CursosAtom, [atom])
    ]),
    atomic_list_concat(CursosList0, ',', CursosAtom),
    maplist(limpiar_espacio, CursosList0, CursosList),
    agregar_profesor(Emp, Nom, Grado, Esp, CursosList),
    ( estudios(Emp, _, _, _) -> true ; agregar_estudios(Emp, ninguno, ninguno, ninguno) ),
    reply_json_dict(_{mensaje: "Profesor agregado exitosamente a la base de conocimiento",
                      empleado: Emp, nombre: Nom, grado: Grado, especialidad: Esp, cursos: CursosList}).

% Adicion dinamica de un curso
api_agregar_curso(Request) :-
    http_parameters(Request, [
        id(Id, [atom]),
        creditos(Cred, [integer]),
        nombre(Nom, [atom]),
        objetivo(Obj, [atom]),
        academia(Acad, [atom])
    ]),
    agregar_curso(Id, Cred, Nom, Obj, Acad),
    reply_json_dict(_{mensaje: "Curso agregado exitosamente a la base de conocimiento",
                      id: Id, nombre: Nom, creditos: Cred, academia: Acad}).

% ----------------------------------------------------------------------------
% Demo rapida en consola: ?- demo.
% ----------------------------------------------------------------------------
demo :-
    forall(member(T-Id, [academia-acad_ia, cuerpo_academico-ca1, proyecto-p1,
                         curso-c1, capacitacion-cap1, comision-com4]),
           ( rankear(T, Id, R), include(es_apto, R, A),
             nombre_destino(T, Id, N),
             format("~n[~w] ~w~n", [T, N]),
             forall(member(P, A), format("   ~w  ~w pts~n", [P.nombre, P.puntaje])) )),
    expediente(101, Exp),
    format("~n[opcion 6] ~w~n   asignaciones: ~p~n", [Exp.nombre, Exp.asignaciones]).
