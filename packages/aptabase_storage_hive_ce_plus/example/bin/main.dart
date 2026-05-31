import 'dart:io';

import 'package:aptabase_plus/aptabase_plus.dart';
import 'package:aptabase_storage_hive_ce_plus/aptabase_storage_hive_ce_plus.dart';

Future<void> main(List<String> args) async {
  const appKey = String.fromEnvironment('APTABASE_APP_KEY', defaultValue: 'A-DEV-0000000000');

  final storageDirectory = Directory('.dart_tool/aptabase_hive_example')
    ..createSync(recursive: true);

  final storage = await HiveCeAptabaseStorage.open(directoryPath: storageDirectory.path);

  final client = await Aptabase.init(
    appKey,
    options: const AptabaseOptions(debugLogEnabled: true),
    storage: storage,
    systemInfoProvider: const StaticAptabaseSystemInfoProvider(
      AptabaseSystemInfo(
        osName: 'dart',
        osVersion: '3.x',
        locale: 'en',
        appVersion: '1.0.0',
        appBuildNumber: '1',
        isDebug: true,
      ),
    ),
    startTimer: false,
  );

  await client.trackEvent('hive_ce_storage_example_started', props: {'argumentCount': args.length});

  await client.flush();
  await Aptabase.dispose(flush: false);
  await storage.close();
}
