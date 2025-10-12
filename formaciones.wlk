import vagones.*

class Formacion {
  const property vagones = []
  
  method agregarVagon(unVagon) {
    vagones.add(unVagon)
  }
  
  method quitarVagon(unVagon) {
    vagones.remove(unVagon)
  }
  method cantidadDePasajeros() = vagones.sum({v=>v.cantPasajeros()})
  method cantVagonesPopulares() = vagones.filter({v=>v.cantPasajeros()>50}).size()
  method esCarguero() = vagones.all({v=>v.cargaMaxima()>=1000})
  //busco el vagon con el Maximo pesoMax
  method vagonMasPesado() =  vagones.max({v=>v.pesoMaximo()})
  //busco el vagon con el mimimo pesoMax
  method vagonMasliviano() =  vagones.min({v=>v.pesoMaximo()})
  // utilizo los metodos anteriores para mayor claridad y facilidad
  method dispersionDePesos() =  self.vagonMasPesado().pesoMaximo() - self.vagonMasliviano().pesoMaximo()
  method cantidadBaños() = vagones.filter({v=>v.tieneBaño()}).size()
  //mantenimiento
  method hacerMantenimiento() = vagones.forEach({v=>v.hacerMantenimiento()})
  // desgloso para poder hacer si esta equilibrada , primero verifico que  haya pasajeros al menos en 2 vagones
  method hayPasajeros() = vagones.filter({v=>v.cantPasajeros()>0}).size()>=2
  // busco vagon con Mayor Pasajeros
  method vagonConMayorPasajeros ()= vagones.max({v=>v.cantPasajeros()}).cantPasajeros()
  //  luego vagon con menor  pasajeros
  method vagonConMenosPasajeros()=vagones.min({v=>v.cantPasajeros()}).cantPasajeros()
  // metodo final
  method estaEquilibrada() = if(self.hayPasajeros()) self.vagonConMayorPasajeros()- self.vagonConMenosPasajeros()<=20

  // desglose para armar el metodo  estaOrganizada
  method todosLosVagonesConPasajerosOSinPasajeros() = vagones.all({v=>v.cantPasajeros()>0}) || vagones.all({v=>v.cantPasajeros()==0})
  //con este metodo Verifico si HAY algun vagon vacio delante de uno con pasajeros
  method hayVagonesSinPasajerosDelanteDeVagonesConPasajeros() {
     var vagonSinPasajeros = false
     var hayDesorden=false
     vagones.forEach({ v=>if(v.cantPasajeros()==0){ vagonSinPasajeros=true }else if(vagonSinPasajeros) {hayDesorden=true}})return hayDesorden}

  // metodo final 
  method estaOrganizada() = self.todosLosVagonesConPasajerosOSinPasajeros() ||   !self.hayVagonesSinPasajerosDelanteDeVagonesConPasajeros()

 
 


}