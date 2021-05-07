require 'json'
require 'faraday'

URL = 'https://2tmctatied.execute-api.us-west-2.amazonaws.com/default/quotations'

connection = Faraday.new(url: URL)
response = connection.get do |request|
  request.params['id'] = 1
end

if response.success?
  data = JSON.parse(response.body)
  puts "- Status code: #{response.status}"
  puts "- ID: #{data['id']}"
  puts "- Author: #{data['author']}"
  puts "- Excerpt: #{data['excerpt']}"
end
