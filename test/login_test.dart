// This is a practice for Flutter Widget test
//
import 'package:flutter_test/flutter_test.dart';
import 'package:class_activity/setup/login.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows building and interacting
  // with widgets in the test environment.
  testWidgets('Test Widget for Practice', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(Login());

    // Create the Finders.
    final fFinder = find.text('Sign In');
    final tFinder = find.text('Welcome back!');
    final trFinder = find.text('Sign in with Google');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(fFinder, findsOneWidget);
    expect(tFinder, findsOneWidget);
    expect(trFinder, findsOneWidget);
  });
}
