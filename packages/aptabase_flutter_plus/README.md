# aptabase_flutter_plus

Flutter defaults for `aptabase_plus`.

This package provides:

- Flutter lifecycle flushing.
- `SharedPreferencesAsync` backed storage.
- `package_info_plus` and `device_info_plus` backed system information.
- A compatibility-style `Aptabase.init(...)` facade.

## Usage

```dart
import 'package:aptabase_flutter_plus/aptabase_flutter_plus.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Aptabase.init('A-US-0000000000');
  runApp(const MyApp());
}
```
