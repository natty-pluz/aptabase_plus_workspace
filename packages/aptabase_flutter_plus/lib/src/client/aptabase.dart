import 'package:aptabase_plus/aptabase_plus.dart' hide Aptabase;

import 'aptabase_flutter.dart';

/// Compatibility-style facade matching the original `Aptabase` entry point.
class Aptabase {
  Aptabase._();

  static AptabaseClient get instance => AptabaseFlutter.instance;

  static Future<AptabaseClient> init(
    String appKey, {
    AptabaseOptions options = const AptabaseOptions(),
    AptabaseStorage? storage,
    AptabaseSystemInfoProvider? systemInfoProvider,
    AptabaseTransport? transport,
    SessionIdGenerator? sessionIdGenerator,
    bool startTimer = true,
    bool attachLifecycle = true,
  }) {
    return AptabaseFlutter.init(
      appKey,
      options: options,
      storage: storage,
      systemInfoProvider: systemInfoProvider,
      transport: transport,
      sessionIdGenerator: sessionIdGenerator,
      startTimer: startTimer,
      attachLifecycle: attachLifecycle,
    );
  }

  static Future<void> dispose({bool flush = true}) {
    return AptabaseFlutter.dispose(flush: flush);
  }
}
