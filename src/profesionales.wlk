import universidades.*
import empresa.*
import solicitante.*
/*porque no puedo usar una super clase?? */
// esta clase está completa, no necesita nada más
class ProfesionalAsociado {

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

}

// a esta clase le faltan métodos
class ProfesionalVinculado {

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

}

// a esta clase le faltan atributos y métodos
class ProfesionalLibre {

	var universidad
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

}

