import universidades.*
import empresa.*
import solicitante.*

class Profesional {

	method cobrarImporte(dinero)

}

/*porque no puedo usar una super clase?? */
// esta clase está completa, no necesita nada más
class ProfesionalAsociado inherits Profesional {

	var universidad

	method universidad() {
		return universidad
	}

	method pertenceA(parametro) {
		return universidad == parametro
	}

	method universidad(univ) {
		universidad = univ
	}

	method provinciasDondePuedeTrabajar() {
		return #{ "Entre Ríos", "Corrientes", "Santa Fe" }
	}

	method honorariosPorHora() {
		return 3000
	}

	method cobraMasQue(parametro) {
		return self.honorariosPorHora() > parametro
	}

	method cuantasProvincias() {
		return ((self.provinciasDondePuedeTrabajar()).size()) >= 3
	}

	override method cobrarImporte(dinero) {
		asociacionProfesionalesLitoral.recibirDonacion(dinero)
	}

}

// a esta clase le faltan métodos
class ProfesionalVinculado inherits Profesional {

	var universidad

	method universidad() {
		return universidad
	}

	method universidad(univ) {
		universidad = univ
	}

	method provinciasDondePuedeTrabajar() {
		return universidad.provincia()
	}

	method honorariosPorHora() {
		return universidad.honorariosPorHora()
	}

	method cobraMasQue(parametro) {
		return self.honorariosPorHora() > parametro
	}

	method cuantasProvincias() {
		return ((self.provinciasDondePuedeTrabajar()).size()) >= 3
	}

	override method cobrarImporte(dinero) {
		universidad.recibirDonacion(dinero / 2)
	}

}

// a esta clase le faltan atributos y métodos
class ProfesionalLibre inherits Profesional {

	var universidad
	var importesExtra = 0
	var property provinciasDondePuedeTrabajar = []
	var property honorariosAdcionales

	method universidad() {
		return universidad
	}

	method universidad(univ) {
		universidad = univ
	}

	method honorariosPorHora() {
		return universidad.honorariosPorHora() + self.honorariosAdcionales()
	}

	method cobraMasQue(parametro) {
		return self.honorariosPorHora() > parametro
	}

	method cuantasProvincias() {
		return ((self.provinciasDondePuedeTrabajar()).size()) >= 3
	}

	override method cobrarImporte(dinero) {
		importesExtra = +dinero
	}

	method darDinero(cantidad, profesional) {
		profesional.cobrarImporte(cantidad)
		importesExtra -= cantidad
	}

}

object asociacionProfesionalesLitoral {

	var totalRecaudado

	method recibirDonacion(money) {
		totalRecaudado = +money
	}

}

