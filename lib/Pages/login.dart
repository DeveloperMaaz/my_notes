import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_notes/controller/google_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/cover.png'))),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Text(
                'Create and Manage your Notes',
                style: TextStyle(
                    fontSize: 36.0,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                  onPressed: () {
                    signInWithGoogle(context);
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 12.0)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey[700])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google.png',
                        height: 32.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Continue with Google',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'lato',
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
