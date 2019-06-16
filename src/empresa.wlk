import profesionales.*
import universidades.*
import solicitante.*

class Empresa {

	var property empleados = []
	var honorarioRferencia = 3500
	var property clientes = []

	method profecionalesDE(universidad) { // cuantos profesionales de una universidad particular 
		return empleados.filter{ persona => persona.pertenceA(universidad) }.size()
	}

	method lugaresDeServicio() { // me va a retornar todos las provincias donde trabaja
		return empleados.map{ persona => persona.provinciasDondePuedeTrabajar() }
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

	method atenderSolicitante(solicitante) { // aun no esta bien pulido
		if (solicitante.tipoDeSolicitante() == "persona") {
			return empleados.contains(solicitante.provinciaorigen())
		} else {
			return empleados.asSet().intersection(solicitante.universidadesOk()).size() > 0
		}
	}

	method profesionalesParaServicio(solicitante) {
		if (solicitante.tipoDeSolicitante() == "persona") {
			return empleados.contains(solicitante.provinciaorigen())
		} else {
			return empleados.asSet().intersection(solicitante.universidadesOk())
		}
	}

	method darServicio(solicitante) {
		if (self.atenderSolicitante(solicitante)) {
			 self.profesionalesParaServicio(solicitante).cobrarImporte(self.profesionalesParaServicio(solicitante).honorariosPorHora())
			clientes.add(solicitante)
		} else {
		 self.error("no puede ser atendido") 
		}
	}

} //fin de empresa

