File.open("Nombres.txt", 'r') do |fp|

	id = 1

	fp.readlines.each do |linea|
		nombre, fecha = linea.chomp.split(/,/)

		printf("%3d - %s\n",id, nombre)

		id+=1
	end
end