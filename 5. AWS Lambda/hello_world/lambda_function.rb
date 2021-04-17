require 'json'

def lambda_handler(event:, context:)
    { statusCode: 200,
      body: JSON.generate({
        message: 'Hello from Lambda by Ariel!',
        code: 66
      }),
    }
end
