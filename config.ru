require 'sinatra'


ruta = File.expand_path(File.dirname(__FILE__))

set :environment, :development
set :root, ruta
set :app_file, File.join(ruta, 'MiPrograma.rb')
disable :run

run Sinatra::Application