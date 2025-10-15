
class VagonDormitorio {
    const camasPorCompartimento
    const cantCamas
    
    method cantidadMaximaDePasajeros()= camasPorCompartimento*cantCamas
    method cargaMaxima()=  1200
    method pesoMaximo()= 4000 + (80 * self.cantidadMaximaDePasajeros())+ self.cargaMaxima()  
    method tieneBanio() = true 
    method esPopular() = self.cantidadMaximaDePasajeros() > 50
    method recibirMantenimiento() {
      
    }
    
}

class VagonPasajeros {
  const largo
  const ancho
  const property tieneBanio
  var estaOrdenado
  
  method cantidadMaximaDePasajeros() {
    const base = if (ancho <= 3) largo * 8 else largo * 10
    return if (estaOrdenado) base else base - 15
  }
  
  method cargaMaxima() = if (tieneBanio) 300 else 800
  
  method pesoMaximo() = (2000 + (80 * self.cantidadMaximaDePasajeros())) + self.cargaMaxima()
  
  method esPopular() {
    self.cantidadMaximaDePasajeros() > 50
  }
  
   method recibirMantenimiento() {
    estaOrdenado = true
  }
}

class VagonCarga {
  const cargaIdeal
  var maderasSueltas
  
  method cargaMaxima() = cargaIdeal - (400 * maderasSueltas)
  
  method pesoMaximo() = 1500 + self.cargaMaxima()
  
  method tieneBanio() = false
  
  method cantidadMaximaDePasajeros() = 0
  
  method esPopular() = false
  
  method recibirMantenimiento() {
  maderasSueltas = 0.max(maderasSueltas - 2)
  }
}
