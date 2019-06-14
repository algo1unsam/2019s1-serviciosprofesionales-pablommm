import profesionales.*
import universidades.*

class Empresa {
	var empleados = []
	var honorarioRferencia =3500
		method profecionalesDE(universidad){
			return empleados.filter{persona => persona.pertenceA(universidad)}
		}
		method profesionalMasCaroQue(){
			return empleados.filter{persona => persona.cobraMasQue(honorarioRferencia)}
		}
		method universidadesFormadoras(){
			return empleados.map{profe => profe.universidad()}.asList()
			}
		method profesionalMasBarato(){
			 return empleados.min{person => person.honorariosPorHora()}	
		}
		method genteAcotada(){
			 return empleados.all{person => person.cuantasProvincias()}	
		}
		method puedeAtender(solicitante){
			
		}
}
