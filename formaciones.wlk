// para el class depositos es necesario tener los siguientes metodos:
// en la class Vagones:
// pesoMaximo()
// en la class Locomotora:
// pesoMaximo()
// pesoCapazDeArrastrar()
// en la class Formacion:
// esCompleja()
// agregarVagon() ESTE NOMBRE NO ME COPA, CAMBIARLO
// en la class Formacion tiene que haber una lista general (la formacion) y otros dos methods que
//  traen los vagones y las locomotoras por separado para ahi adentro utilizar methods especificos para cada clase por separado.
//  POR LO QUE ESTE NOMBRE DE AGREGAR VAGON hace referencia a agregar un X a la formacion en general, no a la lista de vagones de la formacion
class Depositos {
  const property formacionesDepositadas = []
  // todas las Formaciones depositadas
  const property locomotorasSueltas = []
  
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
  
  method agregarUnaLocomotoraAUnaFormacion(unaFormacion) {
    if (not unaFormacion.puedeMoverse()) {
      // Si puede moverse no hace nada
      const empujeFaltante = unaFormacion.cuantosKilosDeEmpujeLeFaltan()
      //se guarda cuanto falta para poder moverse, porque tambien podria ya tener una locomotora que no le de para empujar
      const locomotoraAdecuada = self.encontrarLocomotoraAdecuada(
        empujeFaltante
      ) // busca una locomotora adecuada para lo que necesita esa formacion
      
      if (locomotoraAdecuada != null) {
        // si hayamos una locomotora capaz de mover la formacion la agregamos y quitamos del deposito
        unaFormacion.agregarVagon(locomotoraAdecuada)
        locomotorasSueltas.remove(locomotoraAdecuada)
      }
    }
  }
}