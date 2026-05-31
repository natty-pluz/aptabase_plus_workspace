import '../config/aptabase_options.dart';
import '../storage/aptabase_storage.dart';
import '../system/aptabase_system_info_provider.dart';
import '../transport/aptabase_transport.dart';
import '../utils/session_id_generator.dart';
import 'aptabase_client.dart';

/// Convenience singleton facade for simple Dart-only usage.
class Aptabase {
  Aptabase._();

  static AptabaseClient? _instance;

  static AptabaseClient get instance {
    final client = _instance;
    if (client == null) {
      throw StateError('Aptabase.init must be called before Aptabase.instance.');
    }

    return client;
  }

  static Future<AptabaseClient> init(
    String appKey, {
    AptabaseOptions options = const AptabaseOptions(),
    AptabaseStorage? storage,
    AptabaseSystemInfoProvider? systemInfoProvider,
    AptabaseTransport? transport,
    SessionIdGenerator? sessionIdGenerator,
    bool startTimer = true,
  }) async {
    final client = AptabaseClient(
      appKey: appKey,
      options: options,
      storage: storage,
      systemInfoProvider: systemInfoProvider,
      transport: transport,
      sessionIdGenerator: sessionIdGenerator,
    );

    await client.init(startTimer: startTimer);
    _instance = client;

    return client;
  }

  static Future<void> dispose({bool flush = true}) async {
    final client = _instance;
    _instance = null;
    await client?.dispose(flush: flush);
  }
}
