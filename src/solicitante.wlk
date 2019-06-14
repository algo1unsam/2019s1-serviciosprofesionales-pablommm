import universidades.*
import empresa.*
import profesionales.*

class Solicitante {

	var property tipoDeSolicitante

	method puedeSerAtendido(empresa) {
		return tipoDeSolicitante.atendidoPorProfesional(empresa, self)
	}
}


object persona {

	var property provinciaorigen 
	
	method serAtendido(empresa,solicitante){
		return "prueba"
	}
	method atendidoPorProfesional(empresa, solicitante) {
		return (empresa.empleados().provinciasDondePuedeTrabajar().asSet().intersection(self.provinciaorigen()).asSet())>0
	}

}

object institucion {

	var property universidadesOk = []

	method atendidoPorProfesional(empresa, solicitante) {
		return (empresa.empleados().provinciasDondePuedeTrabajar().asSet().intersection(self.universidadesOk()).asSet().size()) > 0
	}

}

