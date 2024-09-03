import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class HomeTabWidget extends StatefulWidget {
  const HomeTabWidget({Key? key}) : super(key: key);

  @override
  _HomeTabWidgetState createState() => _HomeTabWidgetState();
}

class _HomeTabWidgetState extends State<HomeTabWidget> {
  late FirebaseAuth _auth;
  late User _user;

  int flag = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
  }

  helplineWidget() {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      child: Text(
        "Helpline Number : 9845575341",
        textScaleFactor: 1.5,
      ),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  faqWidget() {
    return Container(
      margin: EdgeInsets.all(5),
      child: Text("Faqs ... "),
      decoration: BoxDecoration(
        color: Colors.orange.shade300,
      ),
    );
  }

  Future<void> _failDialog(String msg) async {
    switch (await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(msg),
          content: Text(
              "Your due date for 2nd Dose is on 24th August, 2021 till then you cannot book vaccine slots..."),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              "A robust and easy to use vaccine tracking app for fast,comfortable and easy vaccine slot booking",
              textAlign: TextAlign.center,
              textScaleFactor: 2,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              child: Text(
                "Book Now",
                textScaleFactor: 2.3,
              ),
              onPressed: () {
                //print("User id is: " + _user.uid);
                _user == null
                    ? Navigator.pushNamed(context, "/login")
                    : Navigator.pushNamed(context, "/find_location");
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Health Ministry Helpline : 1075",
                          textScaleFactor: 1.5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Child Helpline number: 1098",
                          textScaleFactor: 1.5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Senior Citizen Helpline : 14567",
                          textScaleFactor: 1.5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Mental Health : 08046110007",
                          textScaleFactor: 1.5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 100),
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "FAQ",
                          textScaleFactor: 1.6,
                        ),
                        Divider(
                          color: Colors.grey[800],
                          thickness: 2,
                        ),
                        Expanded(
                          child: Text(
                            "-> What is difference between ...",
                            textScaleFactor: 1.5,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "-> Is vaccination safe for ...",
                            textScaleFactor: 1.5,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "-> What are side effects of ...",
                            textScaleFactor: 1.5,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "-> Covaxine or covishield ...",
                            textScaleFactor: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  "@ Copyright to D1",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Terms & Conditions",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
