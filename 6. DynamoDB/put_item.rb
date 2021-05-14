require 'aws-sdk-dynamodb'

dynamodb = Aws::DynamoDB::Client.new

new_item = {
  Author: 'Ernest Cline',
  Title: 'Ready Player Two',
  Year: 2020,
  Note: 'This is a really cool book!'
}

dynamodb.put_item(table_name: 'Books', item: new_item)

puts 'Item has been put'
