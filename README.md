# Aptabase Plus Workspace

This workspace refactors the original `aptabase_flutter` SDK into two packages:

- `aptabase_plus`: a pure Dart Aptabase client that is storage, system-info, and transport agnostic.
- `aptabase_flutter_plus`: a Flutter convenience wrapper that supplies Flutter defaults for storage, system info, and lifecycle flushing.

The package names intentionally avoid occupying likely official Aptabase names such as `aptabase`, `aptabase_dart`, or `aptabase_core`.

## Layout

```txt
packages/
  aptabase_plus/
    example/        # Dart-only example
    lib/            # Pure Dart SDK
    test/           # Mirrored unit-test structure
  aptabase_flutter_plus/
    example/        # Flutter example
    lib/            # Flutter wrapper/adapters
    test/           # Mirrored Flutter tests
```

## Development

From each package directory:

```sh
dart pub get
dart test
```

For the Flutter package:

```sh
flutter pub get
flutter test
```

The Dart package has no Flutter dependency and can be used in Dart-only runtimes, command-line apps, server-side Dart, and frameworks that cannot depend on Flutter plugins.
