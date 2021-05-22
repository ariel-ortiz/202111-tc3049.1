require 'sinatra'

get '/' do
  'Hello, World!'
end

get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  "Hello, #{params['name']}!"
end

get '/ejemplo' do
  @mensaje = 'Esta es una prueba.'
  @info = ['primavera', 'verano', 'otoño', 'invierno']
  erb :ejemplo
end