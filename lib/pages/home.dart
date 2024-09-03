import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vacc_tracker_app/pages/home_tab.dart';
import 'package:vacc_tracker_app/pages/news_tab.dart';
import 'package:vacc_tracker_app/pages/tips_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';

// defining a global string to store name from firebase for one time read
String _currentusername = "";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    // checking for modal variable
    Map popupdata = ModalRoute.of(context)?.settings.arguments as Map;
    int popup = popupdata?["popup"];

    // getting name for drawer

    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        //print('User is currently signed out!');
        setState(() {
          _islogin = false;
        });
      } else {
        //print('User is signed in!');
        setState(() {
          _islogin = true;
          getname();
        });
      }
    });
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
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
              SizedBox(
                height: 8,
              ),
              Container(
                child: Text(
                  "Status: 1st Dose vaccinated, 2nd dose due on 24th Aug,21",
                  textScaleFactor: 1.5,
                ),
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
          title: Row(
            children: <Widget>[
              Text("Vaccine Tracker"),
              Container(
                padding: EdgeInsets.fromLTRB(200, 0, 0, 0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                    'images/images.jpg',
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.info), text: "Tips"),
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(text: "News", icon: Icon(Icons.contacts)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TipsTabWidget(),
            HomeTabWidget(),
            NewsTabWidget(),
          ],
        ),
      ),
    );
  }
}
