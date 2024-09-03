import 'package:flutter/material.dart';
import 'package:vacc_tracker_app/pages/pincode_tab.dart';
import 'package:vacc_tracker_app/pages/district_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// defining a global string to store name from firebase for one time read
String _currentusername = "";

class FindLocation extends StatefulWidget {
  const FindLocation({Key? key}) : super(key: key);

  @override
  _FindLocationState createState() => _FindLocationState();
}

class _FindLocationState extends State<FindLocation> {
  // refreencing user collection
  CollectionReference user_ref = FirebaseFirestore.instance.collection("Users");
  late FirebaseAuth _auth;
  late User _user;

  // bool variable to control UI on basis of logged in or logout
  bool _islogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
  }

  Future<void> _signOut() async {
    await _auth.signOut();
  }

// retrieving user name data
  void getname() {
    user_ref.doc(_user.phoneNumber).get().then((value) {
      var data = value.data();
      setState(() {
        _currentusername = data["Name"];
      });
    });
  }

// method to display user name if user is logged in
  getUsernameWidget(context) {
    return Text(
      _currentusername[0].toUpperCase(),
      textAlign: TextAlign.center,
      textScaleFactor: 7,
    );
  }

  // method to display Empty user if user is not logged in
  getEmptyuserWidget(context) {
    return Icon(Icons.add_a_photo_rounded);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                width: 120,
                child: _islogin
                    ? getUsernameWidget(context)
                    : getEmptyuserWidget(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.orange[350],
                  border: Border.all(color: Colors.amber),
                ),
              ),
              Container(
                child: Text("Status: "),
              ),
              Divider(
                color: Colors.grey[800],
                thickness: 2,
              ),
              SizedBox(
                height: 150,
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  await _signOut();
                },
                label: Text("Logout"),
                icon: Icon(Icons.logout),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton.icon(
                onPressed: null,
                icon: Icon(Icons.exit_to_app),
                label: Text("EXIT"),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue[20],
          elevation: 0,
          toolbarHeight: 140,
          flexibleSpace: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(60, 20, 60, 0),
                    child: Text(
                      "Vaccine Tracker",
                      textScaleFactor: 3,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(60, 20, 0, 0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                        'images/images.jpg',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Select Location",
                textScaleFactor: 2,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.contacts), text: "Pin"),
              Tab(icon: Icon(Icons.camera_alt), text: "State"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PincodeTab(),
            DistrictTab(),
          ],
        ),
      ),
    );
  }
}
