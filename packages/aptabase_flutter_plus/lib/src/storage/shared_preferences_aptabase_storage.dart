import 'package:aptabase_plus/aptabase_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// `shared_preferences` storage adapter for queued Aptabase events.
class SharedPreferencesAptabaseStorage implements AptabaseStorage {
  SharedPreferencesAptabaseStorage({
    SharedPreferencesAsync? preferences,
    this.keyPrefix = defaultKeyPrefix,
  }) : _preferences = preferences ?? SharedPreferencesAsync();

  static const defaultKeyPrefix = 'aptabase_event_';

  final SharedPreferencesAsync _preferences;
  final String keyPrefix;
  final _events = <String, String>{};

  @override
  Future<void> init() async {
    final keys = await _preferences.getKeys();
    final aptabaseKeys = keys.where((key) => key.startsWith(keyPrefix)).toList()..sort();

    for (final key in aptabaseKeys) {
      final value = await _preferences.getString(key);
      if (value != null) _events[key] = value;
    }
  }

  @override
  Future<void> addEvent(String key, String event) async {
    _events[key] = event;
    await _preferences.setString(key, event);
  }

  @override
  Future<void> deleteEvents(Set<String> keys) async {
    for (final key in keys) {
      _events.remove(key);
      await _preferences.remove(key);
    }
  }

  @override
  Future<Iterable<MapEntry<String, String>>> getItems(int length) async {
    return _events.entries.take(length).toList(growable: false);
  }
}
