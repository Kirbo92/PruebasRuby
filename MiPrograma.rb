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

		def nombres
			@nombres
		end

		def lista
			@nombres = []
			File.open("Nombres.txt", 'r') do |fp|

				id = 1

				fp.readlines.each do |linea|

					@nombres << [id, Nombres.new(*linea.chomp.split(/,/))]
					id+=1
				end
			end

			@vista.nombres_leidos

		end

	end

	class Cli

		def initialize(d)
			@app = d
		end

		def self.run
			ui = Cli.new(App.new)
			ui.empezar
		end

		def nombres_leidos
			@app.nombres.each do |id,n|
				puts "#{id} - #{n}"
			end
		end

		def lista
			@app.lista
		end

		def empezar
			@app.vista = self
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

			#rescue
			#	puts "Mete un comando correcto"
			end
		end

	end
end



# Hemos cambiado a llamada directa a Run
Programa::Cli.run

