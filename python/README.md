Morse Code API
============

Morse Code is a simple tool for encoding and decoding Morse code. It returns the encoded or decoded Morse code.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Python API Wrapper for the [Morse Code API](https://apiverve.com/marketplace/morsecode?utm_source=pypi&utm_medium=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-morsecode
```

Using `pip3`:

```bash
pip3 install apiverve-morsecode
```

---

## Configuration

Before using the morsecode API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_morsecode.apiClient import MorsecodeAPIClient

# Initialize the client with your APIVerve API key
api = MorsecodeAPIClient("[YOUR_API_KEY]")

query = { "audio": true, "text": "This Is A Message" }

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Morse Code API documentation is found here: [https://docs.apiverve.com/ref/morsecode](https://docs.apiverve.com/ref/morsecode?utm_source=pypi&utm_medium=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_morsecode.apiClient import MorsecodeAPIClient

# Initialize the client with your APIVerve API key
api = MorsecodeAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = { "audio": true, "text": "This Is A Message" }
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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
      "audioFile": "9187cc09-7f1c-4ef6-91b2-47b45a779d37.wav",
      "format": ".wav",
      "downloadURL": "https://storage.googleapis.com/apiverve.appspot.com/morsecode/9187cc09-7f1c-4ef6-91b2-47b45a779d37.wav?GoogleAccessId=635500398038-compute%40developer.gserviceaccount.com&Expires=1760978073&Signature=msdNuo4gid8r%2F89Tkuo9ybJOh2qccrs9ceqDXX4QAmeTMVNVwqWeLh1ULL2%2BXQAo4p%2FBav7x7K7xIJQyDFqyIMsqlZnSopGHvaFAKLF7K%2BJZlZORk3XrG0KN2VvvTrGWbOLytOdPa8xlxYeWNQZjA48QyNCWgDEG5ovLcbS3HWrPM%2BYz4yE80MV60eb6orHaA0%2FQsVuPAKNYta1GwcyXWGU7HzP8gAUhf6tdsG6bdvcv7Vs92iKv0fSKxxsHiziVe6zQQOKqAzMtzTg9RnujEVksCiq7KzRMsSLKizWBLRvPokEpbaydds8N%2B35fQztmnykFCQ2RDXxxoHQsB2fZzQ%3D%3D",
      "duration": "13.20s",
      "frequency": "600Hz",
      "sampleRate": "44100Hz",
      "expires": 1760978073054
    }
  }
}
```

---

## Error Handling

The API client provides comprehensive error handling through the `MorsecodeAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_morsecode.apiClient import MorsecodeAPIClient, MorsecodeAPIClientError

api = MorsecodeAPIClient("[YOUR_API_KEY]")

query = { "audio": true, "text": "This Is A Message" }

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except MorsecodeAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_morsecode.apiClient import MorsecodeAPIClient, MorsecodeAPIClientError

api = MorsecodeAPIClient("[YOUR_API_KEY]")

query = { "audio": true, "text": "This Is A Message" }

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except MorsecodeAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_morsecode.apiClient import MorsecodeAPIClient, MorsecodeAPIClientError

query = { "audio": true, "text": "This Is A Message" }

# Using context manager ensures proper cleanup
with MorsecodeAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except MorsecodeAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_morsecode.apiClient import MorsecodeAPIClient

# Enable debug mode
api = MorsecodeAPIClient("[YOUR_API_KEY]", debug=True)

query = { "audio": true, "text": "This Is A Message" }

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_morsecode.apiClient import MorsecodeAPIClient

api = MorsecodeAPIClient("[YOUR_API_KEY]")

try:
    query = { "audio": true, "text": "This Is A Message" }
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=readme) and all legal documents and agreements.

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
