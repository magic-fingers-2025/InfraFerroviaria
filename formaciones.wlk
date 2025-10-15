import vagones.*

//Etapa 1
class Formacion {
    var vagones = []

    method agregarVagon(unVagon) = vagones.add(unVagon)

    //requerimientos
    method cantidadMaximaDePasajeros() = vagones.sum({v => v.cantidadMaximaDePasajeros()})

    method cantidadVagonesPopulares() = vagones.count({v => v.esPopular()})

    method esFormacionCarguera() = vagones.all({v => v.cargaMaxima() >= 1000})

    //dispersion de pesos
    method pesoMaximoMayor() = vagones.map({v => v.pesoMaximo()}).max()
    method pesoMaximoMenor() = vagones.map({v => v.pesoMaximo()}).min()
    method dispersionDePesos() = self.pesoMaximoMayor() - self.pesoMaximoMenor()

    method cantidadDeBanios() = vagones.count({v => v.tieneBanio()})

    method hacerMantenimiento() = vagones.forEach({v => v.recibirMantenimiento()})

    //si esta equilibrada
    method conPasajeros() = vagones.filter({v => v.cantidadMaximaDePasajeros() > 0})
    method maximoPasajeros() = self.conPasajeros().map({v => v.cantidadMaximaDePasajeros()}).max()
    method minimoPasajeros() = self.conPasajeros().map({v => v.cantidadMaximaDePasajeros()}).min()
    method estaEquilibrada() = self.conPasajeros().size() <= 1 or (self.maximoPasajeros() - self.minimoPasajeros() <= 20) 

    //si esta organizada
    method estaOrganizada() {
        return vagones == self.vagonesConPasajeros() + self.vagonesSinPasajeros()
    }

    method vagonesConPasajeros() = vagones.filter({v => v.cantidadMaximaDePasajeros() > 0})
    method vagonesSinPasajeros() = vagones.filter({v => v.cantidadMaximaDePasajeros() == 0})

  
}