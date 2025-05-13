import camion2.*


object knightRider{
    method peso() = 500
    method nivelDePeligrosidad() = 10
    method bultosQueOcupa() = 1
    method serCargado(){}
}


object bumblebee{
    var transformado = robot
    method transformar(unaCosa){
        transformado = unaCosa
    }
    method transformado() = transformado
    method peso() = 800
    method nivelDePeligrosidad() = if(transformado == auto) 15 else 30
    method bultosQueOcupa() = 2
    method serCargado(){
        if(transformado == auto){
            transformado = robot
        }
    }
}
object robot{}
object auto{}

object paqueteDeLadrillos{
    var property cantidad = 15
    method peso() = 2 * cantidad
    method nivelDePeligrosidad() = 2
    method bultosQueOcupa() {
        if(cantidad <= 100) return 1 
        else if(cantidad.between(101, 300)) return 2
        else return 3
    }
    method serCargado(){
        cantidad = cantidad + 12
    }
}

object arenaAGranel{
    var peso = 20
    method peso() = peso
    method peso(nuevo){
        peso = nuevo
    }
    method nivelDePeligrosidad() = 1
    method bultosQueOcupa() = 1
    method serCargado(){
        peso = 0.max(peso-10)
    }
}

object bateriaAntiaerea{
    //var misiles = []
    var tieneMisiles = false
    method tieneMisiles() = tieneMisiles
    //method peso() = if(misiles.isEmpty()) 300 else 200
    method peso() = if(tieneMisiles == true){ 300} else 200
    //method nivelDePeligrosidad() = if(misiles.isEmpty()) 100 else 0
    method nivelDePeligrosidad() = if(self.tieneMisiles() == true) 100 else 0
    method añadirMisiles() {
        tieneMisiles = !tieneMisiles
    }
    method bultosQueOcupa() = if(tieneMisiles == true) 1 else 2
    method serCargado() = if(tieneMisiles == false) self.añadirMisiles()
}

object contenedorPortuario{
    var cosasContenidas = []
    method peso() = 100 + cosasContenidas.sum()
    method elMasPeligroso(){
        return cosasContenidas.max({c=>c.nivelDePeligrosidad()})
    }
    method nivelDePeligrosidad() = 
        if(!cosasContenidas.isEmpty()){self.elMasPeligroso().nivelDePeligrosidad()} else 0
    method agregar(unaCosa){
        cosasContenidas.add(unaCosa)
    }
    method bultosQueOcupa() = 1 + cosasContenidas.sum({c=>c.bultosQueOcupa()})
    method serCargado(){
        cosasContenidas.forEach({c=>c.serCargado()})
    }
}

object residuosRadioactivos{
    var property peso = 0
    method nivelDePeligrosidad() = 200
    method bultosQueOcupa() = 1
    method serCargado(){
        peso = peso + 15
    }
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
    method bultosQueOcupa() = 2
    method serCargado(){}
}