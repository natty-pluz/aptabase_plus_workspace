/// System and app metadata attached to each Aptabase event.
class AptabaseSystemInfo {
  const AptabaseSystemInfo({
    required this.osName,
    required this.osVersion,
    required this.locale,
    required this.appVersion,
    required this.appBuildNumber,
    required this.isDebug,
    this.sdkVersion,
  });

  final String osName;
  final String osVersion;
  final String locale;
  final String appVersion;
  final String appBuildNumber;
  final bool isDebug;
  final String? sdkVersion;

  AptabaseSystemInfo copyWith({
    String? osName,
    String? osVersion,
    String? locale,
    String? appVersion,
    String? appBuildNumber,
    bool? isDebug,
    String? sdkVersion,
  }) {
    return AptabaseSystemInfo(
      osName: osName ?? this.osName,
      osVersion: osVersion ?? this.osVersion,
      locale: locale ?? this.locale,
      appVersion: appVersion ?? this.appVersion,
      appBuildNumber: appBuildNumber ?? this.appBuildNumber,
      isDebug: isDebug ?? this.isDebug,
      sdkVersion: sdkVersion ?? this.sdkVersion,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'isDebug': isDebug,
      'osName': osName,
      'osVersion': _truncate(osVersion, 100),
      'locale': locale,
      'appVersion': appVersion,
      'appBuildNumber': appBuildNumber,
      'sdkVersion': sdkVersion,
    };
  }

  static String _truncate(String value, int maxLength) {
    if (value.length <= maxLength) return value;

    return value.substring(0, maxLength);
  }
}
