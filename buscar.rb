id_buscado = ARGV.shift.to_i

File.open("Nombres.txt", 'r') do |fp|
	File.open("Nombres.nuevo.txt", 'w') do |fp2|
		id = 1

		fp.readlines.each do |linea|
			nombre, agregado = linea.chomp.split(/,/)

			if id_buscado == id
				fp2.puts "#{nombre},#{agregado},#{Time.now}"
			else
				fp2.puts "#{nombre},#{agregado},"
			end

			id += 1

		end
	end
end