require 'sinatra'
require './Web'

ruta = File.expand_path(File.dirname(__FILE__))

set :environment, :development
set :root, ruta
set :app_file, File.join(ruta, 'Web.rb')
disable :run

run Sinatra::Application