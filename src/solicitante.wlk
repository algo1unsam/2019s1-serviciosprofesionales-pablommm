import universidades.*
import empresa.*
import profesionales.*

class Solicitante {
	/* 
	var property tipoDeSolicitante

	method puedeSerAtendido(empresa) {
		return tipoDeSolicitante.atendidoPorProfesional(empresa, self)
	}*/
}


class Persona inherits Solicitante{
	var property tipoDeSolicitante = "persona"
	var property provinciaorigen  
	
	method serAtendido(empresa,solicitante){
		return "prueba"
	}
	method puedeSerAtendido(empresa) {
		//return (empresa.empleados().provinciasDondePuedeTrabajar().asSet().intersection(self.provinciaorigen()).asSet())>0
		return (empresa.lugaresDeServicio().contains(provinciaorigen))
	}

}

class Institucion inherits Solicitante{
	var property tipoDeSolicitante = "institucion"
	var property universidadesOk = []

	method puedeSerAtendido(empresa) {
		return (empresa.lugaresDeServicio().asSet().intersection(universidadesOk)).size() > 0
	}

}

