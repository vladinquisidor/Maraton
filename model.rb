# => Script: Modelo
# encoding: utf-8
require 'csv'
class LeerJuego

  def initialize(file)
    @file = file
    @num = 0
    @buenas = 0
    @malas = 0
  end
  def lanzaPregunta
    CSV.foreach(@file) do |read|
      if @num % 2 == 0
        puts "Pregunta"
        puts read
        print "\nIntento: "
        resp = gets.chomp
        esperarResp(resp)
        puts
      end
      @num += 1
    end
  end

  def esperarResp(dato)
    cont = 0
    CSV.foreach(@file) do |matchRes|
      if cont == @num + 1
          if dato.to_s.downcase == matchRes.join("").downcase
            puts "Correcto"
            @buenas += 1
          else
            puts "Incorrecto!"
            @malas += 1
          end
        break
      end
      cont += 1
    end
    puts "Acabaste:"
    puts "Tuviste #{@buenas} Correctas y #{@malas} Incorrectas."

  end

end
