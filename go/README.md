# Morse Code API - Go Client

Morse Code is a simple tool for encoding and decoding Morse code. It returns the encoded or decoded Morse code.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Go client for the [Morse Code API](https://apiverve.com/marketplace/morsecode?utm_source=go&utm_medium=readme)

---

## Installation

```bash
go get github.com/apiverve/morsecode-api/go
```

---

## Configuration

Before using the Morse Code API client, you need to obtain your API key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=go&utm_medium=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=go&utm_medium=readme)

The Morse Code API documentation is found here: [https://docs.apiverve.com/ref/morsecode](https://docs.apiverve.com/ref/morsecode?utm_source=go&utm_medium=readme)

---

## Usage

```go
package main

import (
    "fmt"
    "log"

    "github.com/apiverve/morsecode-api/go"
)

func main() {
    // Create a new client
    client := morsecode.NewClient("YOUR_API_KEY")

    // Set up parameters
    params := map[string]interface{}{
        "audio": true,
        "text": "This Is A Message"
    }

    // Make the request
    response, err := client.Execute(params)
    if err != nil {
        log.Fatal(err)
    }

    fmt.Printf("Status: %s\n", response.Status)
    fmt.Printf("Data: %+v\n", response.Data)
}
```

---

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

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=go&utm_medium=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=go&utm_medium=readme), [Privacy Policy](https://apiverve.com/privacy?utm_source=go&utm_medium=readme), and [Refund Policy](https://apiverve.com/refund?utm_source=go&utm_medium=readme).

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
