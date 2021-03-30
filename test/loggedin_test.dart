// This is a practice for Flutter Widget test
//
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class LoggedInWidget extends StatelessWidget {
  final String photoURL;
  final String displayName;
  final String email;

  const LoggedInWidget({
    Key key,
    @required this.photoURL,
    @required this.displayName,
    @required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        alignment: Alignment.center,
        color: Colors.pink.shade300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Logged In',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            CircleAvatar(
              maxRadius: 25,
              // backgroundImage: NetworkImage(photoURL),
              child: Text(photoURL),
            ),
            SizedBox(height: 8),
            Text(
              'Name: ' + displayName,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Email: ' + email,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
                label:
                    Text("Logout", style: TextStyle(color: Colors.pink[300])),
                icon: Icon(Icons.logout, color: Colors.pink[300]),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  ),
                ),
                onPressed: () {})
          ],
        ),
      )),
    );
  }
}

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows building and interacting
  // with widgets in the test environment.
  testWidgets('Test Widget for Practice', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    // WidgetsFlutterBinding.ensureInitialized(); // Initializing the app with Firebase
    await tester.pumpWidget(LoggedInWidget(
      email: 'hello@gmail.com',
      photoURL: 'random url',
      displayName: 'hello world',
    ));

    // Create the Finders.
    final liFinder = find.text('Logged In');
    final loFinder = find.text('Logout');
    final emailFinder = find.text('Email: hello@gmail.com');
    final nameFinder = find.text('Name: hello world');
    final photoFinder = find.text('random url');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(liFinder, findsOneWidget);
    expect(loFinder, findsOneWidget);
    expect(emailFinder, findsOneWidget);
    expect(nameFinder, findsOneWidget);
    expect(photoFinder, findsOneWidget);
  });
}
