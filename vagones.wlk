
class VagonDormitorio {
    const compartimentos
    const cantCamas
    
    method cantidadMaximaDePasajeros()= compartimentos*cantCamas
    method cargaMaxima()=  1200
    method pesoMaximo()= 4000 + (80 * self.cantidadMaximaDePasajeros())+ self.cargaMaxima()  
    method tieneBanio() = true 
    method recibirMantenimiento() {
      
    }
    
}

