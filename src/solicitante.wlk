import universidades.*
import empresa.*
import profesionales.*


class Persona {

	var property tipoDeSolicitante = "persona"
	var property provinciaorigen

	method serAtendido(empresa, solicitante) {
		return "prueba"
	}

	method puedeSerAtendido(empresa) {
		return (empresa.lugaresDeServicio().contains(provinciaorigen))
	}
}

class Institucion {

	var property tipoDeSolicitante = "institucion"
	var property universidadesOk = #{}

	method puedeSerAtendido(empresa) {
		return (empresa.universidadesFormadoras().asSet().intersection(universidadesOk.asSet())).size() > 0
	}

}

