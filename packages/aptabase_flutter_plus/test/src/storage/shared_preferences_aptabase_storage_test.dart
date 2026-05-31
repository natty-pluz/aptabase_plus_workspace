import 'package:aptabase_flutter_plus/aptabase_flutter_plus.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SharedPreferencesAptabaseStorage', () {
    test('is an AptabaseStorage adapter', () {
      final storage = SharedPreferencesAptabaseStorage();
      expect(storage, isA<AptabaseStorage>());
    });
  });
}
