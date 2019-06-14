import profesionales.*
import universidades.*
import solicitante.*

class Empresa {

	var property empleados = []
	var honorarioRferencia = 3500

	method profecionalesDE(universidad) {//cuantos profesionales de una universidad particular 
		return empleados.filter{ persona => persona.pertenceA(universidad) }.size()
	}
	method lugaresDeServicio(){// me va a retornar todos las provincias donde trabaja
		return empleados.map{persona => persona.provinciasDondePuedeTrabajar()}
	}

	method profesionalMasCaroQue() {
		return empleados.filter{ persona => persona.cobraMasQue(honorarioRferencia) }
	}

	method universidadesFormadoras() {
		return empleados.map{ profe => profe.universidad() }.asList()
	}

	method profesionalMasBarato() {
		return empleados.min{ person => person.honorariosPorHora() }
	}

	method genteAcotada() {
		return empleados.all{ person => person.cuantasProvincias() }
	}
	method atenderSolicitante(solicitante){
		if (solicitante.tipoDeSolicitante() == "persona"){
			return empleados.intersection(solicitante.provinciaorigen()).size() > 0
		}else{
			return empleados.intersection(solicitante.universidadesOk()).size() > 0
		}
	}

}//fin de empresa

