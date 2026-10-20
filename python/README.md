Morse Code API
============

Morse Code is a Morse code translator and decoder API: it converts plain text to Morse code dots and dashes and translates Morse back into text. It provides character counts, dit and dah totals, and validation status, while paid plans add downloadable audio tones.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-morsecode.svg)](https://pypi.org/project/apiverve-morsecode/)

This is a Python wrapper for the [Morse Code API](https://apiverve.com/marketplace/morsecode?utm_source=pypi&utm_medium=referral&utm_content=readme)

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

Before using the Morse Code API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_morsecode.apiClient import MorsecodeAPIClient

# Initialize the client with your APIVerve API key
api = MorsecodeAPIClient("[YOUR_API_KEY]")

query = {
    "audio": true,
    "text": "This Is A Message"
}

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

The Morse Code API documentation is found here: [https://docs.apiverve.com/ref/morsecode](https://docs.apiverve.com/ref/morsecode?utm_source=pypi&utm_medium=referral&utm_content=readme).
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
query = {
    "audio": true,
    "text": "This Is A Message"
}
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

---

## Error Handling

The API client provides comprehensive error handling through the `MorsecodeAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_morsecode.apiClient import MorsecodeAPIClient, MorsecodeAPIClientError

api = MorsecodeAPIClient("[YOUR_API_KEY]")

query = {
    "audio": true,
    "text": "This Is A Message"
}

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

query = {
    "audio": true,
    "text": "This Is A Message"
}

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

query = {
    "audio": true,
    "text": "This Is A Message"
}

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

query = {
    "audio": true,
    "text": "This Is A Message"
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_morsecode.apiClient import MorsecodeAPIClient

api = MorsecodeAPIClient("[YOUR_API_KEY]")

query = {
    "audio": true,
    "text": "This Is A Message"
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
