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
		return empleados.flatMap{ persona => persona.provinciasDondePuedeTrabajar() }.asSet() // no tocar
	}

	method profesionalMasCaroQue() {//me compara los honorarios con el parametro que ingreso
		return empleados.filter{ persona => persona.cobraMasQue(honorarioRferencia) }
	}

	method universidadesFormadoras() {// me devuelve las universidades de mis empleados
		return empleados.map{ profe => profe.universidad() }.asSet()
	}

	method profesionalMasBarato() {// el profesional que cobra menos
		return empleados.min{ person => person.honorariosPorHora() }
	}

	method genteAcotada() {// te confirma si todos los empleados trabajan 3 provincias o mas
		return empleados.all{ person => person.cuantasProvincias() }
	}

	method atenderSolicitante(solicitante) { //te confirma si podes atender al solicitante o no
		if (solicitante.tipoDeSolicitante() == "persona") {
			return self.lugaresDeServicio().contains(solicitante.provinciaorigen())
		} else {			
		 return (self.universidadesFormadoras().asSet().intersection(solicitante.universidadesOk().asSet())).size() > 0
		}
	}
	method profesionalesParaServicio(solicitante) {// te devuelve profesional que puede atender
		if (solicitante.tipoDeSolicitante() == "persona") {//este esta mal lo tengo que reahacer
		
			return self.lugaresDeServicio().asSet().intersection(solicitante.provinciaorigen().asSet())
			
		} else {
			return empleados.universidad().asSet().intersection(solicitante.universidadesOk().asSet())
		}
	}
	method darServicio(solicitante) {//este esta mal rehacer
		if (self.atenderSolicitante(solicitante)) {
			self.profesionalesParaServicio(solicitante).cobrarImporte(self.profesionalesParaServicio(solicitante).honorariosPorHora())
			clientes.add(solicitante)
		} else {
			self.error("no puede ser atendido")
		}
	}

} //fin de empresa

