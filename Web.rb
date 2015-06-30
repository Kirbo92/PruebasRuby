require 'sinatra'
require './MiPrograma'

before do
	@app = Programa::App.new
	@app.vista = self
end

get '/nombres' do
	@app.lista
end

public 
def nombres_leidos
	erb :nombres
end

