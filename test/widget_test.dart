// This is a practice for Flutter Widget test
//
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class WidgetTest extends StatelessWidget {
  final String mail;
  final String name;
  final String password;

  const WidgetTest({
    Key key,
    @required this.mail,
    @required this.name,
    @required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Center(
          child: Column(
            children: [Text(mail), Text(name), Text(password)],
          ),
        ),
      ),
    );
  }
}

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows building and interacting
  // with widgets in the test environment.
  testWidgets('Test Widget for Practice', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(WidgetTest(
      mail: 'm@gmail.com',
      name: 'Mahaly',
      password: '123456',
    ));

    // Create the Finders.
    final mailFinder = find.text('m@gmail.com');
    final nameFinder = find.text('Mahaly');
    final passFinder = find.text('123456');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(mailFinder, findsOneWidget);
    expect(nameFinder, findsOneWidget);
    expect(passFinder, findsOneWidget);
  });
}
