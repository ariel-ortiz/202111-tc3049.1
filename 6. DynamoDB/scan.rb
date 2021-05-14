require 'aws-sdk-dynamodb'

dynamodb = Aws::DynamoDB::Client.new
response = dynamodb.scan(table_name: 'Books')
items = response.items
p items
puts
p items[0]['Title']