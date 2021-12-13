import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'landingpage.dart';
import 'login.dart';

class Welcome extends StatelessWidget {

  Welcome({Key? key}) : super(key: key);

  final auth = FirebaseAuth.instance;

  // Future<String> getCurrentUID() async {
  //   return (auth.currentUser)!.uid;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Text(
                auth.currentUser!.uid,
                style: TextStyle(fontSize: 25),
              ),
              ElevatedButton(
                child: Text("Logout"),
                onPressed: () {
                  auth.signOut().then((value) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginWidget();
                    }));
                  });
                },
              )
              ,
              ElevatedButton(
                child: Text("Landing"),
                onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                          return LandingPageWidget();
                        }));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
