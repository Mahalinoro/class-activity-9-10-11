import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:class_activity/provider/google.dart';
import 'package:class_activity/setup/login.dart';
import 'package:class_activity/setup/loggedin.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatelessWidget {

  // Widget for circular progress indicator
  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          Center(child: CircularProgressIndicator()),
        ],
      );

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);

              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapshot.hasData) {
                return LoggedInWidget();
              } else {
                return Login();
              }
            },

          )
        )
      )
      
    );
    
  }
}
