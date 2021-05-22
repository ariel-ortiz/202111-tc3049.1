require 'json'
require 'faraday'
require 'sinatra'

URL = 'https://kss1ggcwh4.execute-api.us-west-2.amazonaws.com/default/books'

get '/' do
  'Hello, World!'
end

get '/hello/:name' do
  "Hello, #{params['name']}!"
end

get '/ejemplo' do
  @mensaje = 'Esta es una prueba.'
  @info = ['primavera', 'verano', 'otoño', 'invierno']
  erb :ejemplo
end

get '/books' do
  connection = Faraday.new(url: URL)
  response = connection.get
  @books = []
  if response.success?
    @books = JSON.parse(response.body)
  end
  erb :books
end
