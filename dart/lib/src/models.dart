/// Response models for the Morse Code API.

/// API Response wrapper.
class MorsecodeResponse {
  final String status;
  final dynamic error;
  final MorsecodeData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  MorsecodeResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory MorsecodeResponse.fromJson(Map<String, dynamic> json) => MorsecodeResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? MorsecodeData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Morse Code API.

class MorsecodeData {
  String? text;
  String? morse;
  MorsecodeDataStats? stats;
  bool? valid;
  MorsecodeDataAudio? audio;

  MorsecodeData({
    this.text,
    this.morse,
    this.stats,
    this.valid,
    this.audio,
  });

  factory MorsecodeData.fromJson(Map<String, dynamic> json) => MorsecodeData(
      text: json['text'],
      morse: json['morse'],
      stats: json['stats'] != null ? MorsecodeDataStats.fromJson(json['stats']) : null,
      valid: json['valid'],
      audio: json['audio'] != null ? MorsecodeDataAudio.fromJson(json['audio']) : null,
    );
}

class MorsecodeDataStats {
  num? characters;
  num? dits;
  num? dahs;

  MorsecodeDataStats({
    this.characters,
    this.dits,
    this.dahs,
  });

  factory MorsecodeDataStats.fromJson(Map<String, dynamic> json) => MorsecodeDataStats(
      characters: json['characters'],
      dits: json['dits'],
      dahs: json['dahs'],
    );
}

class MorsecodeDataAudio {
  String? audioFile;
  String? format;
  String? downloadURL;
  String? duration;
  String? frequency;
  String? sampleRate;
  num? expires;

  MorsecodeDataAudio({
    this.audioFile,
    this.format,
    this.downloadURL,
    this.duration,
    this.frequency,
    this.sampleRate,
    this.expires,
  });

  factory MorsecodeDataAudio.fromJson(Map<String, dynamic> json) => MorsecodeDataAudio(
      audioFile: json['audioFile'],
      format: json['format'],
      downloadURL: json['downloadURL'],
      duration: json['duration'],
      frequency: json['frequency'],
      sampleRate: json['sampleRate'],
      expires: json['expires'],
    );
}

class MorsecodeRequest {
  bool? audio;
  String text;

  MorsecodeRequest({
    this.audio,
    required this.text,
  });

  Map<String, dynamic> toJson() => {
      if (audio != null) 'audio': audio,
      'text': text,
    };
}
