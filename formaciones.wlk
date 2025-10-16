import vagones.*

//Etapa 1
class Formacion {
    var vagones = []
    var locomotoras = [] //Para etapa 2 locomotora

    method agregarVagon(unVagon) = vagones.add(unVagon)

    //requerimientos
    method cantidadMaximaDePasajeros() = vagones.sum({v => v.cantidadMaximaDePasajeros()})

    method cantidadDeVagonesPopulares() = vagones.count({v => v.esPopular()})

    method esFormacionCarguera() = vagones.all({v => v.cargaMaxima() >= 1000})

    //dispersion de pesos
    method pesoMaximoMayor() = vagones.map({v => v.pesoMaximo()}).max()
    method pesoMaximoMenor() = vagones.map({v => v.pesoMaximo()}).min()
    method dispersionDePesos() = self.pesoMaximoMayor() - self.pesoMaximoMenor()

    method cantidadDeBanios() = vagones.count({v => v.tieneBanio()})

    method hacerMantenimiento() = vagones.forEach({v => v.recibirMantenimiento()})

    method estaEquilibrada() {
    // con map está todo bien si en alguno obtenemos una lista vacía. 
        
    return (self.maximoDePasajeros() - self.minimoDePasajeros()) <= 20

    }
    method maximoDePasajeros() = vagones.sum{v => v.cantidadMaximaDePasajeros()}
    // method maximoDePasajeros() = vagones.map{v => v.cantidadMaximaDePasajeros()}.max()
    method minimoDePasajeros() = vagones.map{v => v.cantidadMaximaDePasajeros()}.min()
  

    //si esta organizada
    method estaOrganizada() {
        return vagones == self.vagonesConPasajeros() + self.vagonesSinPasajeros()
    }

    method vagonesConPasajeros() = vagones.filter({v => v.cantidadMaximaDePasajeros() > 0})
    method vagonesSinPasajeros() = vagones.filter({v => v.cantidadMaximaDePasajeros() == 0})

    //Etapa 2 locomotora
    method agregarLocomotora(unaLocomotora) = locomotoras.add(unaLocomotora)

    method velocidadMaxima() = locomotoras.map({l => l.velocidadMaxima()}).min()

    method esEficiente() = locomotoras.all({l => l.esEficiente()})

    method pesoMaximo() = vagones.sum({v => v.pesoMaximo()}) + locomotoras.sum({l => l.peso()})

    method arrastreTotal() = locomotoras.sum({l => l.arrastre()})

    method puedeMoverse() = self.arrastreTotal() >= self.pesoMaximo()

    method empujeFaltante() = if (self.puedeMoverse()) 0 else (self.pesoMaximo() - self.arrastreTotal())
}
class Locomotora {
    const   property peso 
    const property arrastre
    const  property velocidadMaxima
    method esEficiente() =  arrastre>=peso*5

}

class Depositos {
  const formacionesDepositadas = []
  // todas las Formaciones depositadas
  const locomotorasSueltas = []
  
  // todas las locomotoras disponibles, solas
  method depositarFormacion(unaFormacion) {
    // add formacion
    formacionesDepositadas.add(unaFormacion)
  }
  
  method quitarFormacion(unaFormacion) {
    //remove formacion
    formacionesDepositadas.remove(unaFormacion)
  }
  
  method depositarLocomotora(unaLocomotora) {
    // add locomotoraSuelta
    locomotorasSueltas.add(unaLocomotora)
  }
  
  method quitarLocomotora(unaLocomotora) {
    // remove locomotoraSuelta
    locomotorasSueltas.remove(unaLocomotora)
  }
  
  //retorna un conjunto (con map) en el que le pregunta a cada formacion PRIMERO si tiene vagones, 
  //y sino devuelve un "null", una vez devuelto lo fltra para quedarse solo con los 
  //vagones mas pesados (el conjunto limpio de nulls) de cada Formacion.
  method vagonesMasPesados() = formacionesDepositadas.map(
    { f => if (f.vagonesEnFormacion().isEmpty()) null
           else f.vagonesEnFormacion().max({ v => v.pesoMaximo() }) }
  ).filter({ v => v != null })
  
  // el method es compleja resuelve la condicion dentro del class Formacion.
  method requiereConductorExperimentado() = formacionesDepositadas.any(
    { f => f.esCompleja() }
  )
  
  method encontrarLocomotoraAdecuada(empujeFaltante) = locomotorasSueltas.find(
    { l => l.pesoCapazDeArrastrar() >= empujeFaltante }
  )
  
  method agregarLocomotoraSiEsNecesaioA(unaFormacion) = if (not unaFormacion.puedeMoverse()) unaFormacion.agregarLocomotora(self.agregarLocomotoraComplementariaA(unaFormacion))

  method agregarLocomotoraComplementariaA(unaFormacion) = locomotorasSueltas.any{l => l.arrastre() >= unaFormacion.empujeFaltante() }.anyOne()
}