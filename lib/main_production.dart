import 'package:yeremchuk_dental/app/app.dart';
import 'package:yeremchuk_dental/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
