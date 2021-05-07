require 'json'
require 'faraday'

# Replace the following URL with the corresponding API gateway endpoint
URL = 'https://7u0ehap743.execute-api.us-west-2.amazonaws.com/default/quotations'

connection = Faraday.new(url: URL)
response = connection.get do |request|
  request.params['id'] = 5
end

if response.success?
  data = JSON.parse(response.body)
  puts "- Status code: #{response.status}"
  puts "- ID: #{data['id']}"
  puts "- Author: #{data['author']}"
  puts "- Excerpt: #{data['excerpt']}"
end

puts

connection = Faraday.new(url: URL)
response = connection.get
if response.success?
  data = JSON.parse(response.body)
  p data
end
