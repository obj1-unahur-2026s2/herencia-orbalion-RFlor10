class Equipos{
    const nombre // "string"
    const nivelDeEnergiaBase // num
    const entrenador 
    const tecnologiasComplementarias = [] //lista de tecnologías con nombre, valor energético y estado activo/inactivo

    method nombre() = nombre

    method nivelDeEnergiaBase() = nivelDeEnergiaBase
    
    method entrenador() = entrenador
   
    method tecnologiasComplementariasActivas() = tecnologiasComplementarias.filter({t => t.activa()})
    method cantTecnologiasComplementariasActivas() = self.tecnologiasComplementariasActivas().size()

    method energiaDeTecnologiasActivas() = self.tecnologiasComplementariasActivas().sum({ta => ta.valorEnergetico()})

    method energiaTotal() = self.nivelDeEnergiaBase() + self.energiaDeTecnologiasActivas()    
}

class Luminicos inherits Equipos{
    var nivelDeRadiacionCapturada //numero
    var cristalesSolares = []//"strings"

    method nivelDeRadiacionCapturada() = nivelDeRadiacionCapturada
    method cristalesSolares() = cristalesSolares

    override method energiaTotal() = if (self.nivelDeRadiacionCapturada() <= 5000) super() * 1.1  else super()
    // Multiplicar por 1.10 conserva el 100% y agrega un 10%.
}

class Sinteticos inherits Equipos{
    const nivelDeProcesamientoCentral // numeros en teraflops
    const cantidadDeModulosActivos //numero
    const estanCertificados = true

    method nivelDeProcesamientoCentral() = nivelDeProcesamientoCentral
    method cantidadDeModulosActivos() = cantidadDeModulosActivos
    method estanCertificados() = estanCertificados

    override method energiaTotal() = if (cantidadDeModulosActivos > 5) super() * 0.8 else super()
    //100 - 20 = 80, conservo el 80%

}

class Etericos inherits Equipos{
    const nivelDeFluctuacionDimensional // numero
    const cantidadDePortalesAbiertos // numero

    method nivelDeFluctuacionDimensional() = nivelDeFluctuacionDimensional
    method cantidadDePortalesAbiertos() = cantidadDePortalesAbiertos
}

class Entrenador{
    const ciclosDeExperiencia // numero
    var estaEnSintonia
    var nivelDePresicion  //min 0 max 100
    var rol
    const rolesPermitidos = ["Estratega Cuántico", "Arquitecto de Energía", "Guía Mental"]

    method rol() = rol

    method initialize(){
        if (not rolesPermitidos.contains(rol)){
            throw new Exception (message = "Rol no homologado por la FOZ")
        }
    }
    method esDeEliteGalactico() = if (ciclosDeExperiencia < 10)false
                                    else if (rol == "Estratega Cuántico") nivelDePresicion > 80
                                    else if (rol == "Arquitecto de Energía")  estaEnSintonia
                                    else true // para guia mental
     
    //method esDeEliteGalactico() = ciclosDeExperiencia > 10 and (
    //    (rol == "Estratega Cuántico" and nivelDePresicion > 80) or
    //    (rol == "Arquitecto de Energía" and estaEnSintonia) or
    //    (rol == "Guía Mental")
    //    )
         
    
}

class TecnologiasEspeciales{
    const nombre // ejemplos núcleos gravitacionales, interfaces de proyección mental, cámaras de fusión energética.
    const valorEnergetico // num
    const activa // bool

    method nombre() = nombre
    method valorEnergetico() = valorEnergetico
    method activa() = activa



}