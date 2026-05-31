import 'package:aptabase_flutter_plus/aptabase_flutter_plus.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FlutterAptabaseSystemInfoProvider', () {
    test('can be constructed', () {
      expect(FlutterAptabaseSystemInfoProvider(), isA<AptabaseSystemInfoProvider>());
    });
  });
}
