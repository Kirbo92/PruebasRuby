def tres
	yield
	yield
	yield
end

def escribir(fp, valor)
	fp.puts(valor)
end

File.open("Prueba.txt", 'w') do |v|
	tres do
		escribir(v,"Hola")
	end
end