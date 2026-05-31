import 'package:aptabase_plus/aptabase_plus.dart';
import 'package:test/test.dart';

void main() {
  group('MemoryAptabaseStorage', () {
    test('stores, reads, and deletes queued events', () async {
      final storage = MemoryAptabaseStorage();
      await storage.init();

      await storage.addEvent('one', '{"eventName":"one"}');
      await storage.addEvent('two', '{"eventName":"two"}');

      expect(await storage.getItems(1), hasLength(1));
      expect(await storage.getItems(10), hasLength(2));

      await storage.deleteEvents({'one'});

      final items = await storage.getItems(10);
      expect(items.map((entry) => entry.key), ['two']);
    });
  });
}
