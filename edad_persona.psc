Proceso edad_persona
	// Fecha de creaci�n: 01/07/2021
	// By Janner Pareja.
	
	// Declarar variables..
	Definir edad,anio_nac,mes_nac,dia_nac,anio_act,mes_act,dia_act,num_dia,nueva_edad Como Entero;
	Definir nac_bisiesto,act_bisiesto Como Logico;
	
	// Asignamos valores
	anio_act <- 2021;
	mes_act <- 7;
	dia_act <- 1;
	nueva_edad <- 0;
	
	Mientras nueva_edad==0 Hacer
		
		Borrar Pantalla;
		
		// Capturamos datos de entrada
		Escribir 'Digite a�o de nacimiento.. (aaaa)';
		anio_nac<-validarDato();
		
		// Condicional
		Si (anio_nac<1890) O (anio_nac>anio_act) Entonces
			nueva_edad <- 0;
		SiNo
			
			// Ciclo Repetir
			Repetir
				// Capturamos datos de entrada
				Escribir 'Digite mes de nacimiento.. (1-12)';
				mes_nac<-validarDato();
				
				num_dia <- 0;
				// Condicionales anidados
				Si mes_nac==2 Entonces
					Si (anio_nac MOD 4==0) Y (anio_nac MOD 100<>0) O (anio_nac MOD 400==0) Entonces
						nac_bisiesto <- Verdadero;
					SiNo
						nac_bisiesto <- Falso;
					FinSi
					Si nac_bisiesto==Verdadero Entonces
						num_dia <- 29;
					FinSi
					Si nac_bisiesto==Falso Entonces
						num_dia <- 28;
					FinSi
				SiNo
					Si mes_nac==4 O mes_nac==6 O mes_nac==9 O mes_nac==11 Entonces
						num_dia <- 30;
					SiNo
						num_dia <- 31;
					FinSi
				FinSi
			Hasta Que mes_nac>0 Y mes_nac<=12
			
			// Ciclo Repetir
			Repetir
				// Capturamos datos de entrada
				Escribir 'Digite d�a de nacimiento.. (1-',num_dia,')';
				dia_nac<-validarDato();
				
				// Condicionales anidados
				Si anio_nac>1890 Y anio_nac<=2021 Entonces
					Si (anio_nac MOD 4==0) Y (anio_nac MOD 100<>0) O (anio_nac MOD 400==0) Entonces
						nac_bisiesto <- Verdadero;
					SiNo
						nac_bisiesto <- Falso;
					FinSi
					Si (anio_act MOD 4==0) Y (anio_act MOD 100<>0) O (anio_act MOD 400==0) Entonces
						act_bisiesto <- Verdadero;
					SiNo
						act_bisiesto <- Falso;
					FinSi
				FinSi
			Hasta Que dia_nac>0 Y dia_nac<=num_dia
			
			edad <- anio_act-anio_nac;
			
			// Condicionales anidados
			Si anio_act==anio_nac Entonces
				Escribir 'Edad: 0 a�os';
			SiNo
				//Esta condici�n se hace para cuando el mes de febrero del a�o actual trae 28 d�as (a�o no bisiesto), 
				//y el usuario naci� un 29 de febrero (a�o bisiesto)
				Si (mes_nac==2) Y (nac_bisiesto==Verdadero) Y (act_bisiesto==Falso) Entonces
					Si (anio_act>anio_nac) Y (mes_act>mes_nac) O (mes_act==mes_nac) Y (dia_act>=28) Entonces
						// Mostramos datos de salida
						Escribir 'Edad: ',edad,' a�os';
					FinSi
				SiNo
					Si (anio_act>anio_nac) Y (mes_act>mes_nac) O (mes_act==mes_nac) Y (dia_act>=dia_nac) Entonces
						// Mostramos datos de salida
						Escribir 'Edad: ',edad,' a�os';
					SiNo
						// Mostramos datos de salida
						Escribir 'Edad: ',edad-1,' a�os';
					FinSi
				FinSi
			FinSi
			
			nueva_edad <- 1;
			
			Repetir
				Escribir 'Conocer nueva edad.. (0)';
				nueva_edad<-validarDato();
				
				Si nueva_edad<>0 Entonces
					Borrar Pantalla;
				FinSi
			Hasta Que nueva_edad==0
			
		FinSi
	FinMientras
FinProceso

//SubProceso para validar los datos de entrada
SubProceso dato<-validarDato()
	Definir num,sub_cadena Como Cadena;
	Definir validarNum Como Logico;
	Definir long,j, dato Como Entero;
	
	Repetir
		//Escribir "Ingrese un numero";
		Leer num;
		
		long<-Longitud(num);
		validarNum<-Verdadero;
		
		Para j<-0 Hasta long-1 Con Paso 1 Hacer
			sub_cadena<-Subcadena(num,j,j);
			
			Si sub_cadena<>'0' Y sub_cadena<>'1' Y sub_cadena<>'2' Y sub_cadena<>'3' Y sub_cadena<>'4' Y sub_cadena<>'5' Y sub_cadena<>'6' Y sub_cadena<>'7' Y sub_cadena<>'8' Y sub_cadena<>'9' Entonces
				validarNum<-Falso;
			FinSi
			
		FinPara
		
		Si validarNum==Falso Entonces
			Escribir "Se requiere un numero Entero, por favor vuelva a intentarlo";
		FinSi
	Hasta Que validarNum==Verdadero
	
	dato<-ConvertirANumero(num);
FinSubProceso
