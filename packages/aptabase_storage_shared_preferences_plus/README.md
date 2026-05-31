# aptabase_storage_shared_preferences_plus

`aptabase_storage_shared_preferences_plus` provides a `SharedPreferencesAsync` storage adapter for queued Aptabase Plus events.

Use this package when you are building a Flutter app and want the simplest persistent queue backend for `aptabase_flutter_plus` or `aptabase_plus`.

## Why this package exists

The Flutter integration package does not own storage anymore. Instead, storage is an adapter selected by the app. This package keeps `shared_preferences` out of the core SDK and out of projects that prefer another queue backend.

## Installation

```yaml
dependencies:
  aptabase_flutter_plus:
    path: ../aptabase_flutter_plus
  aptabase_storage_shared_preferences_plus:
    path: ../aptabase_storage_shared_preferences_plus
```

When published, replace the path dependencies with published version constraints.

## Usage with Flutter

```dart
import 'package:aptabase_flutter_plus/aptabase_flutter_plus.dart';
import 'package:aptabase_storage_shared_preferences_plus/aptabase_storage_shared_preferences_plus.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Aptabase.init(
    'A-US-0000000000',
    storage: SharedPreferencesAptabaseStorage(),
  );

  runApp(const MyApp());
}
```

## Usage with the core client

```dart
final client = AptabaseClient(
  appKey: 'A-US-0000000000',
  storage: SharedPreferencesAptabaseStorage(),
  systemInfoProvider: const StaticAptabaseSystemInfoProvider(
    AptabaseSystemInfo(
      osName: 'flutter',
      osVersion: 'unknown',
      locale: 'en',
      appVersion: '1.0.0',
      appBuildNumber: '1',
      isDebug: false,
    ),
  ),
);

await client.init();
```

This package depends on Flutter because `shared_preferences` is a Flutter plugin.

## Key prefix

By default, the adapter stores queued events under keys that begin with:

```text
aptabase_event_
```

You can override the prefix when sharing preferences with another system or when running multiple clients in the same app:

```dart
final storage = SharedPreferencesAptabaseStorage(
  keyPrefix: 'my_app_aptabase_event_',
);
```

Only keys with the configured prefix are loaded when the adapter initialises.

## Behaviour

The adapter keeps an in-memory copy of queued events after `init()` and mirrors changes to `SharedPreferencesAsync`:

- `init()` reads existing queued events from preferences;
- `addEvent()` writes the event to memory and preferences;
- `getItems()` returns the oldest queued entries up to the requested batch size;
- `deleteEvents()` removes successfully sent or discarded events from memory and preferences.

## When to choose this adapter

Choose this adapter when:

- you want the smallest Flutter setup;
- your event queue is expected to stay small;
- your app already depends on `shared_preferences`;
- you prefer platform-provided key-value persistence.

Consider `aptabase_storage_hive_ce_plus` when:

- you expect heavier offline queues;
- you want a pure Dart storage adapter;
- you already use Hive CE;
- you want future room for storage-level encryption or stronger database semantics.

## Testing

The tests use `InMemorySharedPreferencesAsync` from `shared_preferences_platform_interface`, so they do not touch platform storage.

```bash
flutter test packages/aptabase_storage_shared_preferences_plus
```

The test structure mirrors the source structure:

```text
lib/src/shared_preferences_aptabase_storage.dart
test/src/shared_preferences_aptabase_storage_test.dart
```
