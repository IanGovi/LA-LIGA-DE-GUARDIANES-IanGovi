import candidatos.*
object liga {
    const property candidatos = #{}
    const property guardianes = #{}
    var fuerzaMinimaAyudante = 0
    var fuerzaMaximaAyudante = 100
    var rolDestacado = "Inicial"

    method rolDestacado() = rolDestacado

    method fuerzaMinimaAyudante() = fuerzaMinimaAyudante

    method fuerzaMaximaAyudante() = fuerzaMaximaAyudante

    method agregarCandidato(candidato) {
        candidatos.add(candidato)
    }
    method entrenarTodosLosCandidatos() {
        candidatos.forEach({candidato => candidato.entrenar()})
    }

    method evaluacionDeIngresoGlobal(rol) {
        candidatos.forEach({candidato => self.evaluacionDeIngreso(candidato, rol)})
    }

    method evaluacionDeIngreso(candidato, rol) {
        if (self.puedeOcuparRol(candidato, rol)) {
            candidatos.remove(candidato)
            guardianes.add(candidato)
            candidato.cambiarRolA(rol)
        }
    }

    method puedeOcuparRol(unCandidato, unRol) {
        return 
            if (unRol == "Ayudante") {
                unCandidato.fuerza() >= self.fuerzaMinimaAyudante() and
                unCandidato.fuerza() <= self.fuerzaMaximaAyudante()
            }
            else if (unRol == "Estratega") {
            // usar el else if cuando sean almenos 3 condiciones
                unCandidato.tieneEstudiosAvanzados()
            }
            else {
                unRol == "Inicial"
            }
    }

    method cambiarFuerzaMinimaA(fuerzaMinima) {
        fuerzaMinimaAyudante = fuerzaMinima

    }
    method cambiarFuerzaMaximaA(fuerzaMaxima) {
        fuerzaMaximaAyudante = fuerzaMaxima

    }


    method cambiarRolDestacado(unRol) {
        rolDestacado = unRol
    }

    method fuerzaTotal() = guardianes.sum({guardian => guardian.fuerza()})
    method puedeSoportarAtaqueDe(unValor) = self.fuerzaTotal() > unValor * 2
    //Filtra por quienes cumplen la condicion
    method quienesSuperanPruebaPara(unRol) = candidatos.filter({candidato => self.puedeOcuparRol(candidato, unRol)})
}