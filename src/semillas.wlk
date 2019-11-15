class Planta{
	const property horasDeSol = 0
	const property anioDeSemilla = 0
	var property altura = 0		// metros
	
	method esFuerte(){
		return horasDeSol > 10	
	}
	method espacioQueOcupa()		// mt2
	method daSemillas(){ return self.esFuerte() }
	method esIdeal(unaParcela)
	//method seAsociaBien(unaParcela){
		//if()
	//}
}
/*
    para las parcelas ecológicas: que la parcela no tenga complicaciones y sea ideal para la planta;
    para las parcelas industriales: que haya como máximo 2 plantas y que la planta en cuestión sea fuerte.
 */

class Menta inherits Planta{
	
	override method horasDeSol(){return 6}
	override method daSemillas(){ return altura > 0.4}
	override method espacioQueOcupa(){return altura * 3}
	//la menta prefiere suelos extensos, 
	//por lo cual le resultan ideales las parcelas con una superficie mayor a 6 metros cuadrados. 
	override method esIdeal(unaParcela){
		return unaParcela.superficie() > 6
	}
}

class Soja inherits Planta {
	override method horasDeSol(){
		if(altura<0.5){return 6}
		else if(altura.between(0.5,1)){ return 7}
		else {return 9}
	}
	override method daSemillas(){ return anioDeSemilla > 2007 and altura > 1}
	override method espacioQueOcupa(){ return altura / 2}
	//la soja común va bien si la cantidad de sol que recibe la parcela es exactamente igual a los que ella tolera;
	override method esIdeal(unaParcela){
		return self.horasDeSol() == unaParcela.horasDeSol()
	}
}

class Quinoa inherits Planta{
	override method daSemillas(){ 
		return super() or anioDeSemilla < 2005
	}
	override method espacioQueOcupa(){ return 0.5}
	//la quinoa es bajita y por eso anda mejor en parcelas en las que no haya ninguna planta cuya altura supere los 1.5 metros
	override method esIdeal(unaParcela){
		return unaParcela.plantas().all({planta => planta.altura() < 1.5})
	}
}

class SojaTransgenica inherits Soja{
	override method daSemillas(){ return false}
	override method esIdeal(unaParcela){
		return unaParcela.plantas().size() < 1
	}
}

class Hierbabuena inherits Menta{
	override method espacioQueOcupa(){ return super() * 2}
}

/*Cada planta define ciertas condiciones para saber si una parcela le resulta ideal:

    la menta prefiere suelos extensos, por lo cual le resultan ideales las parcelas con una superficie mayor a 6 metros cuadrados. 
    * La hierbabuena, como buena menta que es, se comporta igual;
    la quinoa es bajita y por eso anda mejor en parcelas en las que no haya ninguna planta cuya altura supere los 1.5 metros;
    la soja común va bien si la cantidad de sol que recibe la parcela es exactamente igual a los que ella tolera;
    la soja transgénica está pensada como monocultivo, así que prefiere parcelas cuya cantidad máxima de plantas sea igual a 1.

Agregar a las plantas la capacidad de decir si una parcela le resulta ideal.
 */



/*La soja transgénica nunca da nuevas semillas, 
 * porque las empresas que las comercializan las someten adrede a un proceso de esterilización 
 * (que les asegura no perder nunca a su clientes). Ojo: la consulta siempre tiene que dar falso, incluso si se cumple la condición general.

La hierbabuena se esparce más rápido que la menta y por eso el espacio que ocupa es el 
* doble del que ocuparía una planta de menta de las mismas características.
 */
 
 
/*Quinoa

Existen muchas cepas de esta nutritiva planta andina y es por eso que la cantidad de horas de sol
*  que tolera la configuraremos para cada planta. Ocupa siempre 0.5 metros cuadrados y
*  la condición alternativa para saber si da semillas es que el año de obtención de la semilla que le dio origen sea anterior al 2005.

Por ejemplo:

    si tenemos una quinoa que tolera 12 horas de sol y su semilla de origen es de 2010, se trata de una planta que da semillas.
    si tenemos una planta que tolere 9 horas de sol pero cuya semilla de origen es de 2001, también da semillas.
 */