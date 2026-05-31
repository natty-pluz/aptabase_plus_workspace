import 'dart:math';

/// Generates Aptabase session identifiers.
abstract interface class SessionIdGenerator {
  String generate();
}

/// Default session identifier generator used by the SDK.
class RandomSessionIdGenerator implements SessionIdGenerator {
  RandomSessionIdGenerator({Random? random}) : _random = random ?? Random();

  final Random _random;

  @override
  String generate() {
    final epochInSeconds = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final random = _random.nextInt(100000000).toString().padLeft(8, '0');

    return '$epochInSeconds$random';
  }
}
