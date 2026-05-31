/// Supported Aptabase app-key regions.
enum AptabaseRegion {
  eu('EU', 'https://eu.aptabase.com'),
  us('US', 'https://us.aptabase.com'),
  dev('DEV', 'http://localhost:3000'),
  selfHosted('SH', null);

  const AptabaseRegion(this.code, this.host);

  /// Region segment used in an Aptabase app key.
  final String code;

  /// Hosted Aptabase base URL. `null` means the caller must provide a host.
  final String? host;

  static AptabaseRegion? fromCode(String code) {
    for (final region in values) {
      if (region.code == code) return region;
    }

    return null;
  }
}
