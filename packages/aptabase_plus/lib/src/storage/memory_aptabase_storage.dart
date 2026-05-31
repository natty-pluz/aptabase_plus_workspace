import 'aptabase_storage.dart';

/// Non-persistent storage useful for tests, examples, and short-lived Dart apps.
class MemoryAptabaseStorage implements AptabaseStorage {
  final _events = <String, String>{};

  @override
  Future<void> init() async {}

  @override
  Future<void> addEvent(String key, String event) async {
    _events[key] = event;
  }

  @override
  Future<void> deleteEvents(Set<String> keys) async {
    for (final key in keys) {
      _events.remove(key);
    }
  }

  @override
  Future<Iterable<MapEntry<String, String>>> getItems(int length) async {
    return _events.entries.take(length).toList(growable: false);
  }

  /// Visible for tests and examples.
  int get length => _events.length;
}
