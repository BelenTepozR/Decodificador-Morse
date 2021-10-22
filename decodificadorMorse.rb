class Nodo

    def initialize(dato)
        @hijoDer = nil
        @hijoIzq = nil
        @dato = dato
        @visitado = false
    end

    attr_reader :hijoDer
    attr_writer :hijoDer

    attr_reader :hijoIzq
    attr_writer :hijoIzq

    attr_reader :dato
    attr_reader :visitado
    attr_writer :visitado

end

class Arbol
    def initialize(dato)
        @raiz = Nodo.new(dato)
        @nodos = Array.new
        @nodos.push(@raiz)
    end

    attr_reader :raiz
    attr_reader :nodos

    def insertar(padre, dato, inicio)

        if padre != inicio.dato
            if inicio.hijoIzq != nil && inicio.hijoIzq.visitado == false
                insertar(padre, dato, inicio.hijoIzq)
            end
            if inicio.hijoDer != nil && inicio.hijoDer.visitado == false
                insertar(padre, dato, inicio.hijoDer)
            end
        else
            nuevo = Nodo.new(dato)
            if inicio.hijoIzq == nil
                inicio.hijoIzq = nuevo
                @nodos.push(nuevo)
            else
                inicio.hijoDer = nuevo
                @nodos.push(nuevo)
            end
        end
    end

    def decodificar(palabra, nodoActual)
        if palabra.length == 0
            return nodoActual.dato
        else
            if palabra[0] == " "
                #puts "dato espacio o dos espacios #{nodoActual.dato}"
                palabra = palabra.reverse.chop.reverse
                if palabra[0] == " "
                    return nodoActual.dato + " " + decodificar(palabra.reverse.chop.reverse, raiz)
                else
                    return nodoActual.dato + decodificar(palabra, raiz)
                end
            else
                if palabra[0] == "."
                    decodificar(palabra.reverse.chop.reverse, nodoActual.hijoIzq)
                else
                    decodificar(palabra.reverse.chop.reverse, nodoActual.hijoDer)
                end
            end
        end
    end
end

class Principal

    attr_accessor :arbol

    def initialize()#constructor
        @arbol = nil
        self.crearArbol
        self.principal
    end

    def crearArbol
        @arbol = Arbol.new("Start")
        arbol.insertar("Start", "E", arbol.raiz)
        arbol.insertar("Start", "T", arbol.raiz)
        arbol.insertar("E", "I", arbol.raiz)
        arbol.insertar("E", "A", arbol.raiz)
        arbol.insertar("I", "S", arbol.raiz)
        arbol.insertar("I", "U", arbol.raiz)
        arbol.insertar("S", "H", arbol.raiz)
        arbol.insertar("S", "V", arbol.raiz)
        arbol.insertar("H", "5", arbol.raiz)
        arbol.insertar("H", "4", arbol.raiz)
        arbol.insertar("V", "", arbol.raiz)
        arbol.insertar("V", "3", arbol.raiz)
        arbol.insertar("U", "F", arbol.raiz)
        arbol.insertar("U", "Ü", arbol.raiz)
        arbol.insertar("Ü", "", arbol.raiz)
        arbol.insertar("Ü", "2", arbol.raiz)
        arbol.insertar("A", "R", arbol.raiz)
        arbol.insertar("A", "W", arbol.raiz)
        arbol.insertar("R", "L", arbol.raiz)
        arbol.insertar("R", "Ä", arbol.raiz)
        arbol.insertar("Ä", "+", arbol.raiz)
        arbol.insertar("W", "P", arbol.raiz)
        arbol.insertar("W", "J", arbol.raiz)
        arbol.insertar("J", "", arbol.raiz)
        arbol.insertar("J", "1", arbol.raiz)
        arbol.insertar("T", "N", arbol.raiz)
        arbol.insertar("T", "M", arbol.raiz)
        arbol.insertar("N", "D", arbol.raiz)
        arbol.insertar("N", "K", arbol.raiz)
        arbol.insertar("D", "B", arbol.raiz)
        arbol.insertar("D", "X", arbol.raiz)
        arbol.insertar("B", "6", arbol.raiz)
        arbol.insertar("B", "=", arbol.raiz)
        arbol.insertar("X", "/", arbol.raiz)
        arbol.insertar("X", "Ï", arbol.raiz)
        arbol.insertar("K", "C", arbol.raiz)
        arbol.insertar("K", "Y", arbol.raiz)
        arbol.insertar("M", "G", arbol.raiz)
        arbol.insertar("M", "O", arbol.raiz)
        arbol.insertar("G", "Z", arbol.raiz)
        arbol.insertar("G", "Q", arbol.raiz)
        arbol.insertar("Z", "7", arbol.raiz)
        arbol.insertar("O", "Ö", arbol.raiz)
        arbol.insertar("O", "CH", arbol.raiz)
        arbol.insertar("Ö", "8", arbol.raiz)
        arbol.insertar("CH", "9", arbol.raiz)
        arbol.insertar("CH", "0", arbol.raiz)
    end

    def principal
        
        puts "Bienvenido al decodificador de código Morse"
        puts "Ingresa la palabra a decodificar (Deja un espacio entre letra y dos entre palabras)"
        palabra = gets.chomp
        puts "Tu palabra decodificada es: #{arbol.decodificar(palabra, arbol.raiz)}"
        #arbol.nodos.each{ |n| puts n.dato}
    end
end

p = Principal.new