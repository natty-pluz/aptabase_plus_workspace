import 'dart:convert';

import '../system/aptabase_system_info.dart';

/// Analytics event queued before it is sent to Aptabase.
class AptabaseEvent {
  const AptabaseEvent({
    required this.timestamp,
    required this.sessionId,
    required this.eventName,
    required this.systemInfo,
    this.props,
  });

  final DateTime timestamp;
  final String sessionId;
  final String eventName;
  final AptabaseSystemInfo systemInfo;
  final Map<String, Object?>? props;

  Map<String, Object?> toJson() {
    return {
      'timestamp': timestamp.toUtc().toIso8601String(),
      'sessionId': sessionId,
      'eventName': eventName,
      'systemProps': systemInfo.toJson(),
      'props': props,
    };
  }

  String toJsonString() => jsonEncode(toJson());
}
