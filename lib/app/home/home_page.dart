import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example_app/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> db_poc() async {
    final path = '/users/${auth.currentUser.uid}';
    final documentReference = FirebaseFirestore.instance.doc(path);
    await documentReference.set({'firstName': 'Sarthak', 'lastName': 'Diwan'});
    //POC to show data write to Firestore. Sorry I coudn't implement fully because of lack of time.
    //I am not using firebase realtime database because its old.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          TextButton(
            child: Text(
              'Logout',
            ),
            onPressed: _signOut,
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 18,
              ),
              primary: Colors.white,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: db_poc,
      ),
    );
  }
  // Using Firebase Anonymous Authentication
}
