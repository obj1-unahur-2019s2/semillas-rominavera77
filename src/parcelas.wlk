import semillas.*

class Parcela {
	const property largo
	const property ancho
	var property horasDeSol 
	const property plantas = []
	
	method superficie(){ return largo * ancho}
	method cantidadMaximaDePlantas(){
		if(ancho>largo){ return self.superficie() / 5}
		else { return self.superficie() / 3}
	}
	method tieneComplicaciones(){ 
		return plantas.any({ planta => planta.horasDeSol() < self.horasDeSol()})
	}
	method plantar(unaPlanta){ 
		if(self.cantidadMaximaDePlantas() <= self.cantidadDePlantasPlantadas() or 
			unaPlanta.horasDeSol() <= self.horasDeSol() - 2){
			self.error("No se puede plantar")
		}
		//NO VA "else"!! 
		//El error corta la ejecucion 
		else {plantas.add(unaPlanta) }
	}
	method cantidadDePlantasPlantadas(){
		return plantas.size()
	}
}

class ParcelaEcologica inherits Parcela{
	method seAsociaBien(unaPlanta){
		return not self.tieneComplicaciones() and unaPlanta.esIdeal()
	}
}

class ParcelaIndustrial inherits Parcela{
	method seAsociaBien(unaPlanta){
		return plantas.size()<= 2 and unaPlanta.esFuerte()
	}
}
 
 object inta {
 	const property parcelas = []
 	
 	method promedioPlantasPorParcela(){
 		
 	}
 }
 /*colección de parcelas.

Se pide realizar dos estadísticas:

    el promedio de plantas por parcela. Recordar para esto que un promedio se calcula 
    * como la suma (de plantas que hay en cada parcela) dividido por la cantidad (de parcelas que existen);
    obtener la parcela más autosustentable. Para esto, solo consideraremos 
    * aquellas parcelas con más de 4 plantas y elegiremos aquella que tenga mayor porcentaje de plantas "bien asociadas" (ver etapa 5).
  */
 
 
 
 