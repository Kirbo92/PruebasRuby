module Programa

	class Nombres
		def initialize(nomb, creacion, busqueda = nil)
			@nomb, @creacion, @busqueda = nomb, creacion, busqueda
		end

		def nomb
			@nomb
		end

		def creacion
			@creacion
		end

		def busqueda
			@busqueda
		end

		def buscado?
			@busqueda
		end

		def to_s
			@nomb
		end

	end


	class App
		def initialize
			@vista = nil
		end

		def vista=(v)
			@vista = v
		end

		def lista
			@nombres = []
			File.open("Nombres.txt", 'r') do |fp|

				id = 1

				fp.readlines.each do |linea|

					nombres << Nombres.new(*linea.chomp.split(/,/))

					id+=1
				end
			end

			@vista.nombres_leidos

		end

	end

	class Cli

		def lista
			File.open("Nombres.txt", 'r') do |fp|

				id = 1

				fp.readlines.each do |linea|

					n = Nombres.new(*linea.chomp.split(/,/))

					printf("%3d - %s\n",id, n)
					printf("%s\n", n.creacion)
					printf("%s\n", n.busqueda) if n.encontrado?
					id+=1
				end
			end
		end

		def empezar
			begin
				cmd = ARGV.shift.to_sym

				case cmd
				when :escritura
					puts "Vamos a escribir"
				when :lectura
					lista
				when :buscar
					puts "Vamos a buscar"
				end

			rescue
				puts "Mete un comando correcto"
			end
		end

	end
end




p = Programa::Cli.new
p.empezar
