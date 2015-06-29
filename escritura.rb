nombre = ARGV.shift

File.open("Nombres.txt", 'a') do |f|
	f.puts "#{nombre},#{Time.now}"
end

puts "#{nombre} agregado"