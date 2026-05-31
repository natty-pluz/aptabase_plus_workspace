import 'dart:async';

import 'package:aptabase_plus/aptabase_plus.dart';
import 'package:flutter/widgets.dart';

/// Bridges Flutter app lifecycle changes to an Aptabase client.
class FlutterAptabaseLifecycle {
  FlutterAptabaseLifecycle(this.client);

  final AptabaseClient client;
  AppLifecycleListener? _listener;

  void attach() {
    _listener?.dispose();
    _listener = AppLifecycleListener(
      onInactive: () => unawaited(client.flush(reason: 'lifecycle inactive')),
      onResume: client.start,
      onDetach: () => unawaited(client.dispose()),
    );
  }

  void detach() {
    _listener?.dispose();
    _listener = null;
  }
}
