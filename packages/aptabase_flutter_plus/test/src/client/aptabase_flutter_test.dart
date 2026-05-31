import 'package:aptabase_flutter_plus/aptabase_flutter_plus.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AptabaseFlutter', () {
    test('throws before initialization', () {
      expect(() => AptabaseFlutter.instance, throwsStateError);
    });
  });
}
