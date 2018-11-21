


class Pila 
    attr_accessor :tope, :max, :size, :vacia, :elemento, :name, :carnet
    def initialize()
        @tope = nil
        @max = -1
        @size = 0
        @vacia = true 
        @elemento = {
            name: name,
            carnet: carnet,
            siguiente: nil 
        }
    end 

    def insertar(cont)
        if @size < @max || @max == -1 
            cont += 1 
            system('clear')
            puts "Insertar un nuevo elemento: "
            puts " "
            puts "Ingrese el nombre: "
            name = gets.chomp
            puts "Ingrese el carnet: "
            carnet = gets.chomp.to_i
            @elemento = {
                name: name,
                carnet: carnet,
                siguiente: nil 
            }
            if  @vacia
                @tope = @elemento
                @vacia = false  
                @size += 1
            else
                @elemento.siguiente = @tope 
                @tope = @elemento
                @size += 1
            end
        else 
            puts "Ya no se permite ingresar más elementos"
            puts ""
            puts "Pulse cualquier tecla para continuar"
            gets()
        end 
    end


    def mostrar()
        element = @tope
        if @vacia 
            puts "Pila Vacía"
        else 
            if @size == 1
                puts "Estudiante: #{element.name}    Carnet: #{element.carnet}"
            else
                puts "Estudiante: #{element.name}    Carnet: #{element.carnet}"
                begin
                    nuevo_element = element.siguiente
                    element = nuevo_element
                    puts "Estudiante: #{element.name}    Carnet: #{element.carnet}"
                end while element.siguiente != nil
                gets()
            end
        end 
    end



    def por_carnet(cont) 
        camino = " "
        cont2 = 0 
        puts "Ingrese el valor a buscar: "
        carnett = gets.to_i
        a = @tope 
        cont2 += 1
        if carnett == a.carnet
            puts "El estudiante #{a.name} con carnet  #{carnett}  esta en la posicion: #{cont - 1}"
            gets()
        else
            camino += " #{a.name} - #{a.carnet}"
            k = 0
            begin
                nextt = a.siguiente
                if nextt.siguiente != carnett
                    camino += " #{a.name} - #{a.carnet} "
                end
                a = nextt
                z = a        
                cont2 = cont2 + 1
                if cont2==cont && z.carnet != carnett 
                    k = k + 1
                    z.carnet = carnett
                end
            end while z.carnet != carnett
            if k == 0
                posicion = cont - cont2
                puts "Carnet #{carnett} está en la posicion: #{posicion}"
                puts "El camino es: #{camino}"
            else
                puts "El elemento no existe"
            end
            gets()
        end 
    end 


    def por_posicion(cont)
        camino = " "
        cont3 = cont - 1   
        b = @tope 
        puts "Ingrese la posicion: "
        num = gets.to_i
        if num > cont - 1 || num < 0
            puts "La posicion no existe"
            gets
        elsif num == cont - 1
            puts "El elemento en la posicion #{num} es: #{a.name} y carnet: #{a.carnet}"
            gets
        else 
            camino += "#{a.name} - #{a.carnet} "
            begin
            a.carnet 
            aux = a.siguiente
            if cont3 > num
                camino += "#{a.name} - #{a.carnet}"   
            end
            a = aux
            cont3 -= 1
        end while cont3 != num
        puts "El elemento en la posicion #{num} es: #{a.name} - #{a.carnet}"
        puts "El camino es: #{camino}"
        end
        gets 
    end

    def maximo(cont)
        print "Ingrese un limite de elementos: "
        maxx = gets.to_i
        if maxx > 0
            @max = maxx
            b = cont - @max 
            i = 0
            if b > 0
                cont -= @max 
                begin
                    nodo = @tope 
                    @tope = nodo.siguiente
                    nodo = nil
                    i += 1
                end while i != b
            end
        else
            @max = maxx
        end
    end 


    def eliminar(cont)
        cont -= 1
        nodo = @tope 
        if nodo == nil
            puts "No hay elementos a eliminar"
            @tope = nil
            @vacia = true
        else
            puts "Se ha eliminado el elemento: #{nodo.name} - #{nodo.carnet}"
            @tope = nodo.siguiente
            nodo.siguiente = nil
        end
        gets()
    end  
end 

def eliminar()
    if @vacia == true 
        puts "No hay elementos a eliminar"
    else 
        elemento = {}
        elemento = @tope 
        @tope = elemento.siguiente
        elemento.siguiente = nil
        @size -= 1
        return elemento
    end 
end

# class Elemento 
#     attr_accessor :name, :carnet, :siguiente
#     attr_reader :name, :carnet, :siguiente
#     attr_writer :name, :carnet, :siguiente

#     def initialize(name, carnet)
#         @name = name 
#         @carnet = carnet 
#         @siguiente = nil 
#     end 
# end 


cont = 0


begin 
    puts ''
    puts "         Menú   "
    puts ''
    puts '1. Ver elementos'
    puts '2. Buscar elemento por carnet'
    puts '3. Buscar elemento por posicion'
    puts '4. Insertar un nuevo elemento'
    puts '5. Definir maximo elementos'
    puts '6. Eliminar elemento'
    puts '7. Salir'
    puts ''
    print 'Ingrese una opcion: '
    puts ''
    opcion = gets.chomp.to_i
    system('clear')

    pila = Pila.new()

    if opcion == 1
        pila.mostrar()
        puts pila
    elsif opcion == 2
        pila.por_carnet(cont)
    elsif opcion == 3
        pila.por_posicion(cont)
    elsif opcion == 4
        pila.insertar(cont) 
    elsif opcion == 5
        pila.maximo(cont)
    elsif opcion == 6
        pila.eliminar(cont)
    end
end while opcion  != 7

