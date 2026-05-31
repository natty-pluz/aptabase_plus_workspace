/// Queue storage abstraction used by the Dart SDK.
///
/// Implement this interface to persist queued analytics events in a runtime-
/// appropriate store such as browser storage, a local file, a database, secure
/// storage, or framework-specific preferences.
abstract interface class AptabaseStorage {
  Future<void> init();

  Future<Iterable<MapEntry<String, String>>> getItems(int length);

  Future<void> addEvent(String key, String event);

  Future<void> deleteEvents(Set<String> keys);
}
