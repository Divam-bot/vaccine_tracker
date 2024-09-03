import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// enum for radio button
enum Gender { Male, Female }

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _agecontroller = TextEditingController();
  TextEditingController _adharcontroller = TextEditingController();
  TextEditingController _addresscontroller = TextEditingController();

  // variable to refer user collection
  CollectionReference user_collection =
      FirebaseFirestore.instance.collection('Users');

  // variable for radio button
  Gender? _rvalue = Gender.Male;
  @override
  Widget build(BuildContext context) {
    // taking data from login page
    Map _docData = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Register Form"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //image
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
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
              height: 40,
            ),
            TextField(
              //controller assignment
              controller: _namecontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter Name(will be printed on certificate)'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              //controller assignment
              controller: _agecontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                  hintText: 'Enter Your Age)'),
            ),
            SizedBox(
              height: 20,
            ),

            // to make border around gender selector row we use container
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade500),
              ),
              child: Row(
                children: <Widget>[
                  Text("Gender"),
                  Expanded(
                    child: ListTile(
                      title: Text('Male'),
                      leading: Radio<Gender>(
                        value: Gender.Male,
                        groupValue: _rvalue,
                        onChanged: (Gender? value) {
                          setState(() {
                            _rvalue = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text("Female"),
                      leading: Radio<Gender>(
                        value: Gender.Female,
                        groupValue: _rvalue,
                        onChanged: (Gender? value) {
                          setState(() {
                            _rvalue = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              //controller assignment
              controller: _adharcontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Adhar no.',
                  hintText: 'Enter Your Adhar-Card number'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              //controller assignment
              controller: _addresscontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                  hintText: 'Enter Your Permanant address'),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () async {
                String docID = _docData["docID"];
                String _gen;
                _rvalue == Gender.Male ? _gen = "Male" : _gen = "Female";
                user_collection.doc("$docID").set({
                  'Name': _namecontroller.text,
                  "Age": _agecontroller.text,
                  "Gender": _gen,
                  "Adhar": _adharcontroller.text,
                  "Address": _addresscontroller.text,
                  "Vaccine": "",
                  "Dosage": 0
                }).then((_) {
                  print('Added');
                  Navigator.pushReplacementNamed(
                    context,
                    "/find_location",
                  );
                }).catchError((error) => print('Add failed: $error'));
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
