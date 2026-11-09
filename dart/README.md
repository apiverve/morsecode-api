# Morse Code API - Dart/Flutter Client

Morse Code is a Morse code translator and decoder API: it converts plain text to Morse code dots and dashes and translates Morse back into text. It provides character counts, dit and dah totals, and validation status, while paid plans add downloadable audio tones.

[![pub package](https://img.shields.io/pub/v/apiverve_morsecode.svg)](https://pub.dev/packages/apiverve_morsecode)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Morse Code API](https://apiverve.com/marketplace/morsecode?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_morsecode: ^1.2.5
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_morsecode/apiverve_morsecode.dart';

void main() async {
  final client = MorsecodeClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'audio': true,
      'text': 'This Is A Message'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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

## API Reference

- **API Home:** [Morse Code API](https://apiverve.com/marketplace/morsecode?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/morsecode](https://docs.apiverve.com/ref/morsecode?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
