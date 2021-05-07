require 'json'
require 'yaml'

QUOTATIONS = YAML.load_file('quotations.yaml')

def make_url(host, path, index)
  "https://#{host}#{path}?id=#{index}"
end

def get_resource(path, host)
  result = []
  QUOTATIONS.each_with_index do |quotation, index|
    result << {
      id: index,
      author: quotation['author'],
      url: make_url(host, path, index)
    }
  end
  result
end

def get_resource_by_id(id)
  {
    id: id,
    author: QUOTATIONS[id]['author'],
    excerpt: QUOTATIONS[id]['excerpt'],
  }
end

def make_response(code, body)
  {
    statusCode: code,
    headers: {
      "Content-Type" => "application/json; charset=utf-8"
    },
    body: JSON.generate(body)
  }
end

def lambda_handler(event:, context:)
  method = event.dig('requestContext', 'http', 'method')
  case method
  when 'GET'
    query_string = event['queryStringParameters'] || {}
    if query_string['id']
      id = query_string['id'].to_i
      if 0 <= id and id < QUOTATIONS.size
        make_response(200, get_resource_by_id(id))
      else
        make_response(404, {error: "ID #{id} not found"})
      end
    else
      path = event['rawPath']
      host = event.dig('requestContext', 'domainName')
      make_response(200, get_resource(path, host))
    end
  else
    make_response(405, {error: "Method not allowed: #{method}"})
  end
end
