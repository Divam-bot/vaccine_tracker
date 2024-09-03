import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

// glabal variable for dosage retrieval
late int _currentdosage;
late String _currentname;

class BookingConfirm extends StatefulWidget {
  const BookingConfirm({Key? key}) : super(key: key);

  @override
  _BookingConfirmState createState() => _BookingConfirmState();
}

class _BookingConfirmState extends State<BookingConfirm> {
  final CollectionReference center_ref =
      FirebaseFirestore.instance.collection("Centers");

  final CollectionReference user_ref =
      FirebaseFirestore.instance.collection("Users");
  Map nav_data = {};

  // variables for current user
  late FirebaseAuth _auth;
  late User _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
  }

  // retrieving user dosage data
  void getdosage() {
    user_ref.doc(_user.phoneNumber).get().then((value) {
      var data = value.data();
      setState(() {
        _currentdosage = data["Dosage"];
        _currentname = data["Name"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    nav_data = ModalRoute.of(context)?.settings.arguments as Map;
    // checking for enough vaccine slots at center
    int newval = 0;

    if (nav_data["center_slots"] < 1) {
      print("fail");
    } else {
      newval = nav_data["center_slots"] - 1;
    }
    // defining new dosage
    getdosage();
    int _newdosage = _currentdosage + 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Slot"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 500,
              width: 300,
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlue.shade50),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Name of Benificiary: ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        _currentname,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Center Name: ",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          nav_data["center_name"],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Vaccination Date: ",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          nav_data["center_date"],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Vaccine Type: ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        nav_data["center_type"],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Vaccination age group: ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        nav_data["center_age"],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Center Address: ",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          nav_data["center_address"],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    if (newval == 0) {
                      print("Unsuccessful");
                    } else {
                      center_ref
                          .doc(nav_data["doc_id"])
                          .update({"slots": newval}).then((value) {
                        print("Center Updated");
                        user_ref
                            .doc(_user.phoneNumber)
                            .update({
                              "Vaccine": nav_data["center_type"],
                              "Dosage": _newdosage
                            })
                            .then((value) => print("User Updated"))
                            .catchError((error) =>
                                print("Failed to update user: $error"));

                        Navigator.pushNamed(context, "/home",
                            arguments: {"popup": 1});
                      }).catchError((error) {
                        print("Failed to update user: $error");
                        Navigator.pushNamed(context, "/home",
                            arguments: {"popup": 0});
                      });
                    }
                  },
                  child: Text("Confirm"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
