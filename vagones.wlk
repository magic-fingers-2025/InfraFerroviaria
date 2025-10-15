
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

