import cosas2.*


object camion {
    const tara = 1000
    const carga = []
    method cargar(unaCosa){
        carga.add(unaCosa)
        unaCosa.serCargado()
    }
    method descargar(unaCosa){
        carga.remove(unaCosa)
    }
    method pesoTotal(){
        return
            tara + carga.sum({c=>c.peso()})
    }
    method losPesosSonPares(){
        return 
            carga.all({c=>c.peso() % 2 == 0})
    }
    method algunaPesa(unPeso){
        return
            carga.any({c=>c.peso() == unPeso})
    }
    method peligroDeCarga(unNivel){
        return
            (carga.filter({c=> c.nivelDePeligrosidad() == unNivel})).first()
    }
    method superanPeligrosidad(unNivel){
        return
            carga.filter({c=>c.nivelDePeligrosidad() > unNivel})
    }
    method superanPeligrosidadDe(unaCosa){
        return
            self.superanPeligrosidad(unaCosa.nivelDePeligrosidad())
    }
    method excedePesoMaximo() = self.pesoTotal() > 2500
    method puedeCircularConPeligrosidad(peligrosidadLimite){
        return
            !self.excedePesoMaximo() && carga.all({c=>c.nivelDePeligrosidad() < peligrosidadLimite})
    }
    method tieneCosaConPeso(unPeso, otroPeso){
        return 
            carga.any({c=>c.peso()}.between(unPeso, otroPeso))
    }
    method laCargaMasPesada(){
        return
            carga.max({c=>c.peso()})
    }

    /////////////Parte 2
    method totalDeBultos(){
       return carga.sum({c=>c.bultosQueOcupa()})
    }
}