import 'package:example_app/app/home/home_page.dart';
import 'package:example_app/app/sign_in/sign_in_page.dart';
import 'package:example_app/services/auth.dart';
import 'package:example_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User user = snapshot.data;

            if (user == null) {
              return SignInPage(
                auth: auth,
              );
            }
            return
                // Provider<Database>(
                // create: () => FirestoreDatabase(uid: user.uid),
                // child:
                HomePage(
              auth: auth,
              // ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
