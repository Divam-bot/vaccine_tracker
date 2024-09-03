import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var data = {"9876543210": "1234", "0123456789": "123456"};

  // for controling textfields
  TextEditingController _phonecontroller = TextEditingController();
  TextEditingController _otpcontroller = TextEditingController();

  // declaring firebase auth instance
  FirebaseAuth _auth = FirebaseAuth.instance;
  // empty global string to store verification ID coming from firebase after verfication
  String v_id = "";

  // method for faliure dialog box
  Future<void> _failDialog(String msg) async {
    switch (await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(msg),
          content: Text("Sorry Error occured in this step"),
          actions: <Widget>[
            new TextButton(
              child: new Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    )) {
    }
  }

  // sign in function
  void signInWithPhoneAuthCredential(AuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      if (authCredential?.user != null) {
        String phonenum = authCredential.user.phoneNumber;
        print(phonenum);
        String docID = phonenum;
        await FirebaseFirestore.instance
            .collection("Users")
            .doc("$docID")
            .get()
            .then((doc) {
          if (doc.exists) {
            Navigator.pushReplacementNamed(context, "/find_location");
          } else {
            Navigator.pushReplacementNamed(context, "/register",
                arguments: {"docID": docID});
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      _failDialog(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.asset(
                    'images/images.jpg',
                    height: 250,
                    width: 350,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 0),
              // padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                //controller assignment
                controller: _phonecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                    hintText: 'Enter valid Phone number without country code'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Send OTP button
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                child: Text(
                  'Send OTP',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                onPressed: () async {
                  await _auth.verifyPhoneNumber(
                      phoneNumber: _phonecontroller.text,
                      verificationCompleted: (AuthCredential) async {
                        signInWithPhoneAuthCredential(AuthCredential);
                      },
                      verificationFailed: (verificationFailed) async {
                        _failDialog(
                            "Sorry verification failed please try again...");
                      },
                      codeSent: (v_id, resendToken) async {
                        setState(() {
                          this.v_id = v_id;
                        });
                      },
                      timeout: const Duration(seconds: 120),
                      codeAutoRetrievalTimeout: (v_id) async {});
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                //controller assignment
                controller: _otpcontroller,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'OTP',
                    hintText: 'Enter one time password sent to your phone'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Verify OTP button
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                child: Text(
                  'Verify',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                onPressed: () async {
                  AuthCredential phoneAuthCredential =
                      PhoneAuthProvider.credential(
                    verificationId: v_id,
                    smsCode: _otpcontroller.text,
                  );
                  signInWithPhoneAuthCredential(phoneAuthCredential);
                },
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
}
