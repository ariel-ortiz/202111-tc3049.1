require 'json'

def lambda_handler(event:, context:)
  uno_str = event.dig('queryStringParameters', 'uno')
  dos_str = event.dig('queryStringParameters', 'dos')
  tres_str = event.dig('queryStringParameters', 'tres')
  uno = uno_str.to_i
  dos = dos_str.to_i
  tres = tres_str.to_i
  suma = uno + dos + tres

  {
    statusCode: 200,
    headers: {
      "Content-Type" => "application/json; charset=utf-8"
    },
    body: JSON.generate(
      {
        message: 'Hello from Lambda!',
        code: 66,
        event_version: event['version'],
        path: event['rawPath'],
        param_values: event['queryStringParameters'],
        method: event.dig('requestContext', 'http', 'method'),
        suma: suma,
        function_name: context.function_name,
        function_version: context.function_version,
        memory: context.memory_limit_in_mb
      })
  }
end
