class VagonDePasajero {
    const largo
    const ancho
    // lo defino como property para poder luego consultarlo
    const property tieneBaño
    var property estaOrdenado
    //  capacidad de pasajeros por metro
    method cantidadDePasajerosPorMetro() = if(ancho<=3) 8 * largo else 10*largo
    // cantidad de pasajeros descontando si no esta ordenado
    method cantPasajeros() = if(!estaOrdenado) self.cantidadDePasajerosPorMetro()-15 else self.cantidadDePasajerosPorMetro()
    // cantidad maxima de craga dependiendo si tiene baños
    method cargaMaxima() = if(tieneBaño)300 else 800
    method pesoMaximo() = 2000 + (80* self.cantPasajeros()) + self.cargaMaxima()
    method hacerMantenimiento() {
        if(!estaOrdenado) estaOrdenado=true
     }
                               
}

class VagonDeCarga {

    const cargaMaximaIdeal
    // utilizo var property ya que me va a pedir luego volver a setearlo
    var property maderasSueltas
    // utilizo property para poder hacer luego el get correspondiente
    const property tieneBaño=false
    method cargaMaxima()=  cargaMaximaIdeal- (400* self.maderasSueltas())
    method pesoMaximo()= 1500 + self.cargaMaxima()
    // como no  puede llevar pasajeros devuelvo cero( mantengo polimorfismo)
    method cantPasajeros() = 0 
    // aca lo que hago es simplificarlo si maderas sueltas es mayor o igual 2 puede hacer Mantenimiento , sino es 0
    method hacerMantenimiento() {
        if(self.maderasSueltas()>= 2) self.maderasSueltas(self.maderasSueltas()-2) else self.maderasSueltas(0)
         
     }

  
}

class VagonDormitorio {
    const compartimentos
    const cantCamas
    const property tieneBaño=true
    method cantPasajeros()= compartimentos*cantCamas
    method cargaMaxima()=  1200
    method pesoMaximo()= 4000 + (80 * self.cantPasajeros())+ self.cargaMaxima()  
    method hacerMantenimiento() {
      
    }
    
}

