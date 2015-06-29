require 'sinatra'
require './MiPrograma'

before do
	@app = Programa::App.new
	@app.vista = self
end

get '/nombres' do
	erb :nombres
end

