import 'package:aptabase_plus/aptabase_plus.dart';
import 'package:test/test.dart';

void main() {
  group('AptabaseAppKey', () {
    test('parses hosted region keys', () {
      final key = AptabaseAppKey.tryParse('A-EU-0123456789');

      expect(key, isNotNull);
      expect(key!.region, AptabaseRegion.eu);
      expect(key.eventsEndpoint().toString(), 'https://eu.aptabase.com/api/v0/events');
    });

    test('requires host for self-hosted keys', () {
      final key = AptabaseAppKey.tryParse('A-SH-0123456789');

      expect(key, isNotNull);
      expect(key!.eventsEndpoint(), isNull);
      expect(
        key.eventsEndpoint(selfHostedHost: 'https://analytics.example.com').toString(),
        'https://analytics.example.com/api/v0/events',
      );
    });

    test('returns null for invalid keys', () {
      expect(AptabaseAppKey.tryParse('bad-key'), isNull);
      expect(AptabaseAppKey.tryParse('A-AU-0123456789'), isNull);
    });
  });
}
