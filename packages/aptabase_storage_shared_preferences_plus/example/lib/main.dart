import 'package:aptabase_flutter_plus/aptabase_flutter_plus.dart';
import 'package:aptabase_storage_shared_preferences_plus/aptabase_storage_shared_preferences_plus.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const appKey = String.fromEnvironment('APTABASE_APP_KEY', defaultValue: 'A-DEV-0000000000');

  await Aptabase.init(
    appKey,
    options: const AptabaseOptions(debugLogEnabled: true),
    storage: SharedPreferencesAptabaseStorage(),
  );

  runApp(const SharedPreferencesStorageExampleApp());
}

class SharedPreferencesStorageExampleApp extends StatelessWidget {
  const SharedPreferencesStorageExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aptabase Shared Preferences Storage',
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Shared Preferences Storage')),
        body: Center(
          child: FilledButton(
            onPressed: () async {
              await Aptabase.instance.trackEvent('shared_preferences_example_tapped');
            },
            child: const Text('Track event'),
          ),
        ),
      ),
    );
  }
}
