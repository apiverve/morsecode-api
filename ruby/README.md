# Morse Code API - Ruby Gem

Morse Code is a Morse code translator and decoder API: it converts plain text to Morse code dots and dashes and translates Morse back into text. It provides character counts, dit and dah totals, and validation status, while paid plans add downloadable audio tones.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_morsecode'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_morsecode
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_morsecode'

# Initialize the client
client = APIVerve::Morsecode::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  audio: true,
  text: "This Is A Message"
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ audio: true, text: "This Is A Message" })
  puts response["data"]
rescue APIVerve::Morsecode::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Morsecode::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Morsecode::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "text": "This Is A Message",
    "morse": "- .... .. ... / .. ... / .- / -- . ... ... .- --. . ",
    "stats": {
      "characters": 17,
      "dits": 25,
      "dahs": 7
    },
    "valid": true,
    "audio": {
      "audioFile": "a11f9d7f-1fd2-4b10-86de-82defaf18c57.wav",
      "format": ".wav",
      "downloadURL": "https://storage.googleapis.com/apiverve/APIData/morsecode/a11f9d7f-1fd2-4b10-86de-82defaf18c57.wav?GoogleAccessId=635500398038-compute%40developer.gserviceaccount.com&Expires=1765925804&Signature=TiktgUsHV0ipCaRwNNiEihtD5e1SacBHBwWLGvsrnLJTkH%2BH5fRsII5hxk7nEqTypya05Dg4BHTxu672tRU%2Bhb3F8g%2BQYL7u3PMaCHzcnrrpcjSh0hH7%2BWVfEyHxPf5cCuKliISePCOlpbVsU8xtFL8p1DfgTV2FeD8Rmwo3SVpCG4LHpYXJWoZVET2IbS4dZS%2Brn9kvnoBvApgDJgc5EEufOZHYLba6278g0HTgQaOIhdSNhpeSpCwPuSw6q3eK%2FGqzhD5PtzTBMPN1hMvXIZPX11EYRG%2FLbqvltu6gVgbYL5khcG5zQbDse2vXphAys8fMq7PiZSGe1ODf63Gakw%3D%3D",
      "duration": "13.20s",
      "frequency": "600Hz",
      "sampleRate": "8000Hz",
      "expires": 1765925804517
    }
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/morsecode?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/morsecode?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/morsecode?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
