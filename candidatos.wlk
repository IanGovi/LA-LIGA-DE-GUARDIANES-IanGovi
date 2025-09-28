import laLigaDeGuardianes.*
object helia {
    var rol = "Candidato"
    method cambiarRolA(unRol) {
        rol = unRol
    }
    method fuerza() = 22
    method tieneEstudiosAvanzados() = false
    method entrenar() {}
}

object astro {
    var rol = "Candidato"
    method cambiarRolA(unRol) {
        rol = unRol
    }
    var cantidadDeManejoDeArmas = 0
    method fuerza() = cantidadDeManejoDeArmas * 10
    method tieneEstudiosAvanzados() = cantidadDeManejoDeArmas > 5
    method entrenar() {
        cantidadDeManejoDeArmas += 1
    }
}

object zoe {
    var rol = "Candidato"
    method cambiarRolA(unRol) {
        rol = unRol
    }
    var property roles = #{}
    method fuerza() = 8 + roles.size()
    method tieneEstudiosAvanzados() = roles.contains("Estratega")
    method entrenar() {
        roles.add(liga.rolDestacado())
    }
}