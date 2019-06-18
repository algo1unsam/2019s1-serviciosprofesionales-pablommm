import profesionales.*
import empresa.*

class Universidades {
	var property provincia = #{}
	var property honorariosPorHora
	var property donaciones
	
	method recibirDonacion(money){
		donaciones =+ money
	}
	
}
