:-use_module(library(pce)).
:-use_module(library(pce_style_item)).
:-pce_image_directory('./imagen1').


:- dynamic color/2. %Numero de colores que se utilizan
:- dynamic respuesta/2.
:-dynamic si/1,no/1. %suceptible a generar cambios entre verdadero o falso

resource(pizarronutc, image, image('pizarraUnnoba.jpg')). % instruccion para cargar la imagen en la carpeta que esta almacenada .jpg
resource(li, image, image('logo2.jpg')).
resource(descripcion, image, image('info.jpg')).
imagen_portada(Pantalla, Imagen) :- new(Figura, figure),                  %variables y funciones que se utilizan para que se pueda visualizar la imagen mediante la  interfaz grafica
                                     new(Bitmap, bitmap(resource(Imagen),@on)),
                                     send(Bitmap, name, 1),
                                     send(Figura, display, Bitmap),
                                     send(Figura, status, 1),
                                     send(Pantalla, display,Figura,point(0,0)).




inicio:- %Inicio de nuestro programa, creando el objeto de dialogo con la variable D
   new(D,dialog('SISTEMA EXPERTO UNNOBA',size(800,2350))),% inicio de nuestra interfaz principal

   new(Label4,label(text,'           Bienvenido al sistema experto de TEST VOCACIONAL')),
	send(Label4,colour,blue),
   new(Label5,label(text,'        Sistema de orientaci�n sobre las carreras en la UNNOBA')),
	send(Label5,colour,blue),
   new(Label6,label(text,'                                    � Muchos �xitos !')),
	send(Label6,colour,blue),
   new(Label7,label(text,'')),
	send(Label7,colour,blue),
   new(Label9,label(text,'                                  ')),

   send(Label9,colour,red),

   new(Label10,label(text,'                                  ')),

   send(Label10,colour,red),

   new(Label12,label(text,'')),

   send(Label12,colour,blue),


 %llama a los label y los adjunta para mostrarlos en la ventana principal
   imagen_portada(D, li),

   send(D,append(Label4)),

   send(D,append(Label5)),

   send(D,append(Label6)),

   send(D,append(Label7)),

   send(D,append(Label9)),

   send(D,append(Label10)),

   send(D,append(Label12)),

%crea el boton que almacenamos en nuestra variable para la funcion que se ha programado anteriormente
   new(Boton1,button('Iniciar',and(message(@prolog,principal),
                                   and(message(D,open))))),
   send(Boton1,colour,blue),
   new(Bcancelar,button('Anular',and(message(D,destroy),message(D,free)))),
   send(Bcancelar,colour,blue),
   new(Boton2,button('Ayuda',and(message(@prolog,main1),
                                 and(message(D,open),message(D,free))))),
   send(Boton2,colour,blue),

   new(Boton3,button('Carreras',and(message(@prolog,main2),
                                    and(message(D,open),message(D,free))))),
   send(Boton3,colour,blue),

%llamada de los botones para que se muestren en la interfaz
   send(D,append(Boton1)),
   send(D,append(Bcancelar)),
   send(D,append(Boton2)),
   send(D,append(Boton3)),
   send(D,open_centered).


:-inicio.

%Llamando a la funcion principal de nuestro boton iniciar


principal:-
	new(D2, dialog('SISTEMA EXPERTO UNNOBA',size(500,400))), %inicio de nuestra interfaz emergente
	new(Label10, label(nombre,'')),send(Label10,colour,red),%color de texto de la variable D2

        imagen_portada(D2, pizarronutc), % carga de imagen


	new(@texto,label(text,'                                            Una vez finalizado el TEST podras ver los resultados:')),
        new(@respl,label(text,'')),
        new(@resp2,label(text,'')),
        new(@resp3,label(text,'')),
	new(Salir,button('Salir',and(message(D2,destroy),message(D2,free)))),



        new(@nombre, text_item('Nombre:')),
        new(@apellido, text_item('Apellido:')),
        send(D2, display, @nombre, point(50, 80)),
        send(D2, display, @apellido, point(50, 120)),

	new(@boton,button('Da click si estas listo',message(@prolog,botones))),

	send(D2, append(Label10)),
	new(@btncarrera,button('�analisis?')), %boton para iniciar el test
        send(D2, display,Label10,point(10,20)), %mostrar el contenido de nuestra ventana
	send(D2, display,@boton,point(310,80)), %numeros ajustan las posiciones del  boton
	send(D2, display,@texto,point(50,40)),
	send(D2, display,Salir,point(340,330)),
	send(D2, display,@respl,point(90,90)),
	send(D2,open_centered).                 %fin de la funcion





% se muestra la respuesta de tu test que realizaste por medio de las preguntas

resultado(ingenieria_en_informatica):-ingenieria_en_informatica,!.
resultado(licenciatura_en_genetica):-licenciatura_en_genetica,!.
resultado(contabilidad):-ingenieria_en_alimentos,!.
resultado(abogacia):-abogacia,!.
resultado(contador):-contador,!.
resultado(no_se_encontro_ninguna_carrera_adecuada_para_ti).


%se declran las variables de cada carrera y despues se colocan las preguntas coreespodientes


ingenieria_en_informatica:-carrera_ingenieria_en_informatica,
	%consultar('�Te interesa analizar, dise�ar e implementar sistemas de informaci�n para optimizar procesos y facilitar la toma de decisiones?'),
	consultar('�Te atrae la idea de colaborar en la definici�n de pol�ticas y estrategias inform�ticas en una organizaci�n?'),
	consultar('�Te gusta la idea de dise�ar y administrar redes de computadoras, asegurando una comunicaci�n eficiente y segura?'),
	consultar('�Te atrae la investigaci�n y desarrollo en el campo de la inform�tica, buscando soluciones innovadoras para problemas tecnol�gicos?').

licenciatura_en_genetica:-carrera_genetica,
	%consultar('�Te sentis intrigado por la posibilidad de contribuir al desarrollo de productos a trav�s de la comprensi�n y aplicaci�n de los principios gen�ticos,que rigen la herencia y la variabilidad en los organismos vivos?'),
	consultar('�Sent�s curiosidad por realizar estudios e investigaciones en �reas como biolog�a ,gen�tica molecular, vegetal, animal y microbiolog�a, explorando los secretos del ADN c�mo determina las caracter�sticas de los seres vivos?'),
	consultar('�Te atrae la idea de participar en investigaciones para mejorar la producci�n agropecuaria,aplicando los principios de la gen�tica para optimizar la salud y productividad de las plantas y animales?'),
        consultar('�Te interesa desarrollar sistemas de diagn�stico de laboratorio relacionados con la sanidad humana, animal y vegetal, basados en el an�lisis de material gen�tico para comprender y prevenir como por ejemplo enfermedades hereditarias?').

ingenieria_en_alimentos:-carrera_alimentos,
	%consultar('�Te atrae la idea de proyectar, planificar, dirigir y controlar instalaciones, maquinarias e instrumentos
	%en establecimientos industriales y comerciales involucrados en la producci�n y procesamiento de alimentos?'),
	consultar('�Sientes inter�s en dise�ar, implementar y controlar sistemas de procesamiento industrial de alimentos,
        as� como en investigar y desarrollar nuevas t�cnicas en la fabricaci�n y transformaci�n de productos alimenticios?'),
	consultar('�Te gusta la idea de dise�ar, implementar, controlar y supervisar operaciones relacionadas con el control
        de calidad de materias primas, productos en elaboraci�n y productos finales en la industria alimentaria?'),
        consultar('�Te interesa participar en la realizaci�n de estudios relacionados con el saneamiento ambiental,
        seguridad e higiene en la industria alimentaria, contribuyendo a garantizar la calidad y seguridad de los productos?').

abogacia:-carrera_abogacia,
	%consultar('�Te atrae la idea de representar legalmente a personas y entidades en situaciones judiciales y extrajudiciales?'),
	consultar('�Te gusta resolver problemas y conflictos aplicando el Derecho y buscando la justicia?'),
	consultar('�Te interesa asesorar a empresas y tener la posibilidad de trabajar de forma independiente en cuestiones legales?'),
	consultar('�Te resulta intrigante la idea de brindar opiniones jur�dicas en diversos temas legales?').

contador:-carrera_contador,
        %consultar('�Te gusta gestionar pol�ticas, estrategias y proyectos, as� como participar en el dise�o,
	%ejecuci�n y evaluaci�n de funciones de planificaci�n y organizaci�n en diversas organizaciones?'),
	consultar('�Te atrae la idea de participar en la definici�n de objetivos y metas de las organizaciones,
        desarrollar cursos de acci�n y evaluar el impacto econ�mico, social y ambiental de tus decisiones?'),
	consultar('�Te interesa asesorar, planificar y coordinar actividades econ�micas, patrimoniales, financieras e impositivas en organizaciones?'),
	consultar('�Te gusta trabajar con n�meros y estar involucrado/a en el asesoramiento financiero y econ�mico de empresas?').

no_se_encontro_ninguna_carrera_adecuada_para_ti:-no_hay_una_carrera.


%funcion de corte cada vez que se anula una pregunta de la carrera posteriormente mandara hacia la siguiente

carrera_ingenieria_en_informatica:-consultar('�Te interesa analizar, dise�ar e implementar sistemas de informaci�n para optimizar procesos y facilitar la toma de decisiones?'),!.
carrera_genetica:-consultar('�Te sentis intrigado por la posibilidad de contribuir al desarrollo de productos a trav�s de la comprensi�n y aplicaci�n de los principios gen�ticos
,que rigen la herencia y la variabilidad en los organismos vivos?'),!.
carrera_alimentos:-consultar('�Te atrae la idea de proyectar, planificar, dirigir y controlar instalaciones, maquinarias e instrumentos
en establecimientos industriales y comerciales involucrados en la producci�n y procesamiento de alimentos?'),!.
carrera_abogacia:-consultar('�Te atrae la idea de representar legalmente a personas y entidades en situaciones judiciales y extrajudiciales?'),!.
carrera_contador:-consultar('�Te gusta gestionar pol�ticas, estrategias y proyectos, as� como participar en el dise�o,
ejecuci�n y evaluaci�n de funciones de planificaci�n y organizaci�n en diversas organizaciones?'),!.


preguntar(Problema):-new(A1,dialog('Responde las siguientes preguntas')),
	new(L9,label(texto,'Pregunta:')),
	new(L10,label(text,Problema)),
% crear botones para si y no
	new(Z1,button(si,and(message(A1,return,si)))),
	new(Z2,button(no,and(message(A1,return,no)))),
	send(A1,gap,size(25,25)),
% llamada de los botones y ventanas emergentes
	send(A1,append(L9)),
	send(A1,append(L10)),
	send(A1,append(Z1)),
	send(A1,append(Z2)),

	send(A1,default_button,si),
	send(A1,open_centered),
        get(A1,confirm,Answer),
	asserta(preguta_respuesta(Problema,Answer)),
        write(Answer),
        send(A1,destroy),
%confirmacion de respuesta si y no
 (   (Answer==si)->assert(si(Problema)); %confirma las preguntas si es si en confirmacion y si es no erroneo
 assert(no(Problema)),fail).

%cada vez que el usuario contesta una pregunta la pantalla se limpria y se vuelve a preguntar
consultar(S):-(si(S)->true; (no(S)->fail; preguntar(S))).

limpiar :- retractall(si(_)), retractall(no(_)).

% borrado de la ventana emergente para dar el resultado final
botones:-borrado,
        get(@nombre,selection,Nombre),
        get(@apellido,selection,Apellido),
        write(Nombre),
        write(Apellido),
	send(@boton,free),
	send(@btncarrera,free),
        send(@nombre,free),
        send(@apellido,free),% resultado de la carrera elegida

resultado(Carrera),
	send(@texto, selection('                            Hemos analizado sus respuestas y la carrera mas adecuada para ti es:')),
        concatenar(Nombre,Apellido,NombreCompleto),
        new(L44,label(text,NombreCompleto,bold)),

        new(Men,dialog('Resultado')),
        new(L56,label(text,Carrera)),

        send(Men,append,L44),

        mostrar_preguntas_respuestas(Men),
        new(L57,label(text,'La carrera adecuada es: ',bold)),
        send(Men,append,L57),
        send(Men,append,L56),
        send(Men,open_centered),
        limpiar.


concatenar(Nombre,Apellido,NombreCompleto):-
        atomic_list_concat([Nombre,' ',Apellido],NombreCompleto).

        %send(@respl,selection(Carrera)),	 %new(@boton, button('Iniciar su evaluacion',message(@prolog, botones))),
	%send(Menu, display,@boton,point(40,600)),       %llamando los resultados de la ventana emergente
	%send(Menu, display,@btncarrera,point(20,50)),
	%send(Menu, append, new(Ayuda, popup(Ayuda))),

mostrar_preguntas_respuestas(Men) :-
    % Recorrer la lista de hechos pregunta_respuesta/2
    preguta_respuesta(Pregunta, Respuesta),
    % Mostrar la pregunta y la respuesta en el di�logo
    send(Men, append, label(text, Pregunta)),
    send(Men, append, label(text, Respuesta)),
    fail. % Continuar buscando m�s soluciones
mostrar_preguntas_respuestas(_). % Detenerse cuando no haya m�s soluciones

borrado:-send(@respl,selection('')). %fin del programa

%boton de textos para saber la guia basica

main1:-
    new(D3, dialog('Manual de uso - Test Vocacional',size(500,400))),
    new(Label10, label(nombre,'')),
    send(Label10,colour,red),

    imagen_portada(D3, pizarronutc),
    new(@texto,label(text,'Gu�a b�sica para saber el funcionamiento de la p�gina de Prolog:')),
    new(@texto1,label(text,'Este sistema est� dise�ado para interactuar e informar al usuario que desee saber informaci�n sobre la ')),
    new(@texto2,label(text,'Universidad Nacional del Noroeste de la Prov. de Buenos Aires.')),
    new(@texto4,label(text,'Haz clic en "Iniciar" y responde las preguntas que aparezcan en la interfaz.')),
    new(@texto5,label(text,'Contesta las preguntas de acuerdo con las habilidades y aptitudes que consideres\n que tienes y pones en pr�ctica.')),
    new(@texto6,label(text,'\nDespu�s se te mostrar�n tus resultados de acuerdo con la carrera que consideremos m�s apta para ti.')),
    new(@texto8,label(text,'Presiona "Salir". �')),


        new(Salir,button('Salir',and(message(D3,destroy),message(D3,free)))),

    send(D3, append(Label10)),
    send(D3, display,Label10,point(10,20)),
    send(D3, display,@texto,point(50,40)),
    send(D3, display,@texto1,point(70,70)),
    send(D3, display,@texto2,point(78,82)),
    send(D3, display,@texto4,point(150,150)),
    send(D3, display,@texto5,point(85,200)),
    send(D3, display,@texto6,point(85,214)),
    send(D3, display,@texto8,point(85,245)),
    send(D3, display,Salir,point(400,400)),
    send(D3,open_centered).


main2:-
    new(D4, dialog('Informaci�n sobre las Carreras', size(600, 500))),
    send(D4, append, label(text, 'Informaci�n sobre las Carreras',bold)),
    send(D4, append, label(text, 'Ingenier�a en Inform�tica:',bold)),
    send(D4, append, label(text, ' *Planificar, dirigir, realizar y/o evaluar sistemas de apoyo al diagn�stico por im�genes; sistemas de procesamiento de im�genes satelitales y sonido.')),
    send(D4, append, label(text, ' *Dise�ar, implementar y controlar la calidad de software.')),
    send(D4, append, label(text, ' *Desempe�arse en organizaciones o de manera independiente, en el mantenimiento de procesos autom�ticos de datos y software espec�fico de comunicaciones de datos.')),
    send(D4, append, label(text, ' *Dirigir �reas de inform�tica.')),
    send(D4, append, label(text, '')), % Agrega un espacio en blanco para separar las descripciones

    send(D4, append, label(text, 'Licenciatura en Gen�tica:',bold)),
    send(D4, append, label(text, ' *Desarrollar productos generados por manipulaci�n gen�tica.')),
    send(D4, append, label(text, ' *Realizar estudios e investigaciones referidos a la biolog�a, gen�tica molecular, vegetal, animal y microbiol�gica.')),
    send(D4, append, label(text, ' *Participar en la realizaci�n de estudios e investigaciones a los efectos del mejoramiento de la producci�n agropecuaria.')),
    send(D4, append, label(text, ' *Desarrollar sistemas de diagn�stico de laboratorio en el �mbito de la sanidad humana, animal y vegetal, basados en los an�lisis de material gen�tico.')),    send(D4, append, label(text, '')), % Agrega un espacio en blanco para separar las descripciones
    % Informaci�n para Abogado
    send(D4, append, label(text, 'Abogado:',bold)),
    send(D4, append, label(text, '* Ejercer la representaci�n legal � judicial y extrajudicial y el patrocinio jur�dico de personas y entidades p�blicas y/o privadas ante el Poder Judicial Nacional o Provincial, en todas las ramas del Derecho p�blico y privado.')),
    send(D4, append, label(text, ' *Resolver conflictos, conforme al Derecho y a la Justicia.')),
    send(D4, append, label(text, ' *Asesorar empresas y trabajar de manera independiente.')),
    send(D4, append, label(text, ' *Asesorar en todo asunto que requiera opini�n jur�dica.')),
    send(D4, append, label(text, '')), % Agrega un espacio en blanco para separar las descripciones

    % Informaci�n para Contador P�blico
    send(D4, append, label(text, 'Contador P�blico:',bold)),
    send(D4, append, label(text, ' *Asesorar, planificar y coordinar la ejecuci�n y el control de actividades inherentes a aspectos econ�micos, patrimoniales, financieros e impositivos en cualquier tipo de organizaci�n p�blica o privada.')),
    send(D4, append, label(text, ' *Actuar como asesor/a o consultor/a en la pr�ctica independiente.')),
    send(D4, append, label(text, ' *Otorgar fe p�blica del estado econ�mico, financiero y patrimonial de personas f�sicas y jur�dicas.')),
    send(D4, append, label(text, ' *Emitir opini�n sobre la razonabilidad de los estados contables e informes de sindicatura y auditor�a.')),
    send(D4, append, label(text, ' *Actuar en el �mbito de la justicia laboral y societaria.')),
    send(D4, append, label(text, '')),

    send(D4, append, label(text, 'Ingenier�a en Alimentos:', bold)),
    send(D4, append, label(text, ' *Proyectar, planificar, dirigir y controlar las instalaciones, maquinarias e instrumentos de establecimientos industriales y/o comerciales en los que se involucre la fabricaci�n, conservaci�n, transformaci�n, fraccionamiento, envasado, transporte y almacenaje de productos alimenticios.')),
    send(D4, append, label(text, ' *Dise�ar, implementar y controlar sistemas de procesamiento industrial de alimentos; Investigar y desarrollar t�cnicas de fabricaci�n, transformaci�n y fraccionamiento.')),
    send(D4, append, label(text, ' *Dise�ar, implementar, controlar y supervisar las operaciones correspondientes al control de calidad de las materias primas a procesar, los productos en elaboraci�n y los productos elaborados en la industria alimentaria.')),
    send(D4, append, label(text, ' *Participar en la realizaci�n de estudios relativos al saneamiento ambiental, seguridad e higiene en la industria alimentaria.')),

    send(D4, open_centered).






