import 'package:aptabase_flutter_plus/aptabase_flutter_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  group('SharedPreferencesAptabaseStorage', () {
    setUp(() {
      SharedPreferencesAsyncPlatform.instance = InMemorySharedPreferencesAsync.empty();
    });

    test('is an AptabaseStorage adapter', () {
      final storage = SharedPreferencesAptabaseStorage();

      expect(storage, isA<AptabaseStorage>());
    });

    test('stores and returns queued events', () async {
      final storage = SharedPreferencesAptabaseStorage();

      await storage.init();
      await storage.addEvent('aptabase_event_1', '{"name":"opened"}');
      await storage.addEvent('aptabase_event_2', '{"name":"clicked"}');

      final items = await storage.getItems(10);

      expect(
        items.map((entry) => entry.key),
        containsAll(<String>['aptabase_event_1', 'aptabase_event_2']),
      );
      expect(
        items.map((entry) => entry.value),
        containsAll(<String>['{"name":"opened"}', '{"name":"clicked"}']),
      );
    });

    test('hydrates existing queued events from shared preferences', () async {
      final firstStorage = SharedPreferencesAptabaseStorage();
      await firstStorage.init();
      await firstStorage.addEvent('aptabase_event_1', '{"name":"opened"}');

      final secondStorage = SharedPreferencesAptabaseStorage();
      await secondStorage.init();

      final items = await secondStorage.getItems(10);

      expect(items, hasLength(1));
      expect(items.single.key, 'aptabase_event_1');
      expect(items.single.value, '{"name":"opened"}');
    });

    test('deletes queued events from memory and shared preferences', () async {
      final firstStorage = SharedPreferencesAptabaseStorage();
      await firstStorage.init();
      await firstStorage.addEvent('aptabase_event_1', '{"name":"opened"}');
      await firstStorage.deleteEvents(<String>{'aptabase_event_1'});

      final firstItems = await firstStorage.getItems(10);
      expect(firstItems, isEmpty);

      final secondStorage = SharedPreferencesAptabaseStorage();
      await secondStorage.init();

      final secondItems = await secondStorage.getItems(10);
      expect(secondItems, isEmpty);
    });
  });
}
