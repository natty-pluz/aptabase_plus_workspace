# aptabase_plus

`aptabase_plus` is a pure Dart Aptabase client extracted from the original Flutter SDK.

It does not depend on Flutter, `package_info_plus`, `device_info_plus`, or `shared_preferences`. Instead, it exposes small interfaces so each runtime can provide its own storage, system information, and HTTP transport.

## Basic Dart usage

```dart
import 'package:aptabase_plus/aptabase_plus.dart';

Future<void> main() async {
  final client = await Aptabase.init(
    'A-DEV-0000000000',
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
  );

  await client.trackEvent('app_started');
  await client.flush();
}
```

For persistent storage, implement `AptabaseStorage` or use the Flutter adapter package.
