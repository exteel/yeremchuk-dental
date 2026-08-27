import 'package:flutter_test/flutter_test.dart';
import 'package:yeremchuk_dental/app/app.dart';
import 'package:yeremchuk_dental/screens/home_screen.dart';

void main() {
  group('App', () {
    testWidgets('renders HomeScreen', (tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
