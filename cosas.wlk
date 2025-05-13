import camion.*


object knightRider{
    method peso() = 500
    method nivelDePeligrosidad() = 10
}


object bumblebee{
    var transformado = robot
    method transformar(unaCosa){
        transformado = unaCosa
    }
    method peso() = 800
    method nivelDePeligrosidad() = if(transformado == auto) 15 else 30

}
object robot{}
object auto{}

object paqueteDeLadrillos{
    var property cantidad = 15
    method peso() = 2 * cantidad
    method nivelDePeligrosidad() = 2
}

object arenaAGranel{
    var peso = 20
    method peso() = peso
    method peso(nuevo){
        peso = nuevo
    }
    method nivelDePeligrosidad() = 1
}

object bateriaAntiaerea{
    //var misiles = []
    var tieneMisiles = false
    method tieneMisiles() = tieneMisiles
    //method peso() = if(misiles.isEmpty()) 300 else 200
    method peso() = if(tieneMisiles == true) 300 else 200
    //method nivelDePeligrosidad() = if(misiles.isEmpty()) 100 else 0
    method nivelDePeligrosidad() = if(self.tieneMisiles() == true) 100 else 0
    method añadirMisiles() {
        if(tieneMisiles == false){
            tieneMisiles = !tieneMisiles
        }
    }
}

object contenedorPortuario{
    var cosasContenidas = []
    method peso() = 100 + cosasContenidas.sum({c=>c.peso()})
    method elMasPeligroso(){
        return cosasContenidas.max({c=>c.nivelDePeligrosidad()})
    }
    method nivelDePeligrosidad() = 
        if(!cosasContenidas.isEmpty()){self.elMasPeligroso()} else 0
    method agregar(unaCosa){
        cosasContenidas.add(unaCosa)
    }
}

object residuosRadioactivos{
    var peso = 0
    method peso(nuevo){
        peso = nuevo
    } 
    method peso() = peso
    method nivelDePeligrosidad() = 200
}

object embalajeDeSeguridad{
    var cosaEnvuelta = null
    method envolver(algo){
        cosaEnvuelta = algo
    }
    method peso() = cosaEnvuelta.peso()
    method nivelDePeligrosidad() {
        cosaEnvuelta.nivelDePeligrosidad() / 2
    }
}