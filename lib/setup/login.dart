import 'package:flutter/material.dart';
import 'package:class_activity/provider/google.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
          backgroundColor: Colors.pink[300],
        ),
        body: Column(
          children: [
            Spacer(),

            Align(
              alignment: Alignment.center,
              child: Container(
                child: Text(
                  "Welcome back!",
                  style: TextStyle(
                    color: Colors.pink[300],
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),

                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton.icon(
                label: Text("Sign in with Google"),
                icon: Icon(Icons.android_rounded),
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all<Color>(Colors.pink[300]),
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 12, vertical: 12)),
                ),
                onPressed: (){
                  final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                    provider.login();
                },
              ),
            ),

            SizedBox(
              height: 12,
            ),

            Spacer()
          ],
        )
      ),
    );
  }
}
