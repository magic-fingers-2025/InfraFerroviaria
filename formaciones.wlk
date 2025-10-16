import vagones.*

//Etapa 1
class Formacion {
    var vagones = []
    var locomotoras = [] //Para etapa 2 locomotora

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

    //Etapa 2 locomotora
    method agregarLocomotora(unaLocomotora) = locomotoras.add(unaLocomotora)

    method velocidadMaxima() = locomotoras.map({l => l.velocidadMaxima()}).min()

    method esEficiente() = locomotoras.all({l => l.esEficiente()})

    method pesoTotal() = vagones.sum({v => v.pesoMaximo()}) + locomotoras.sum({l => l.peso()})

    method arrastreTotal() = vagones.sum({l => l.arrastre()})

    method puedeMoverse() = self.arrastreTotal() >= self.pesoTotal()

    method kilosDeEmpujeFaltantes() = (self.pesoTotal() - self.arrastreTotal().max()) 
}