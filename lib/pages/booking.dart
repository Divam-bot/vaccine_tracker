import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  var state_data = {
    "gujarat": ["kutch", "bharuch", "ahmedabad", "godhra", "surat", "vadodra"],
    "Maharashtra": ["Mumbai", "Goa"]
  };
  var center_data = {
    "kutch": ["k_c1", "k_c2", "K_c3", "k_c4", "k_c5", "k_c6"],
    "bharuch": ["b_c1", "b_c2", "b_c3", "b_c4", "b_c5", "b_c6"]
  };
  var pin_data = {
    "kutch": ["370201", "370202"],
    "bharuch": ["340301", "340302"]
  };

  final CollectionReference center_ref =
      FirebaseFirestore.instance.collection("Centers");
  Map pindata = {};

  Future<List<Map<String, dynamic>>> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await center_ref.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    //print(allData);
    return allData;
  }

  @override
  Widget build(BuildContext context) {
    // setting up vaccintaion date one day after
    var now = DateTime.now();
    print(
        DateTime(now.year, now.month, now.day + 1).toString().substring(0, 10));
    var date =
        DateTime(now.year, now.month, now.day + 1).toString().substring(0, 10);
    pindata = ModalRoute.of(context)?.settings.arguments as Map;

    print(pindata["pin"]);
    print("Now from firestore\n");
    var final_data = [getData()];
    print(final_data);
    return Scaffold(
      appBar: AppBar(
        title: Text("choose your center !"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: center_ref.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              print("id is: \n" + document.reference.id);
              return Container(
                child: MyCard(
                  center_address: document['Address'],
                  center_name: document["Name"],
                  center_slots: document["slots"],
                  center_type: document["vaccine"],
                  doc_id: document.reference.id,
                  center_age: document["Age"],
                  center_date: date,
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class MyCard extends StatefulWidget {
  final String? center_name;
  final String? center_address;
  final int? center_slots;
  final String? center_type;
  final String? doc_id;
  final String? center_age;
  final String? center_date;
  const MyCard({
    Key? key,
    this.center_name,
    this.center_address,
    this.center_slots,
    this.center_type,
    this.doc_id,
    this.center_age,
    this.center_date,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 250,
      padding: new EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.lightBlue.shade400,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.local_hospital, size: 60),
              title: Text(widget.center_name.toString(),
                  style: TextStyle(fontSize: 30.0)),
              subtitle: Text(widget.center_address.toString(),
                  style: TextStyle(fontSize: 18.0)),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.orange.shade400,
                    child: Text(
                      widget.center_slots.toString(),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    minRadius: 20,
                  ),
                  label: Container(
                    child: const Text('Slots Remaining'),
                    width: 180,
                  ),
                  labelPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  clipBehavior: Clip.none,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                SizedBox(
                  width: 50,
                ),
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.orange.shade400,
                    child: Text(
                      widget.center_age.toString(),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    minRadius: 20,
                  ),
                  label: Container(
                    child: const Text('Age Group'),
                    width: 180,
                  ),
                  labelPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  clipBehavior: Clip.none,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Chip(
                  label: Container(
                    width: 200,
                    child: Text(
                      "Vaccine Type: " + widget.center_type.toString(),
                    ),
                  ),
                  labelPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  clipBehavior: Clip.none,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                SizedBox(
                  width: 50,
                ),
                Chip(
                  label: Container(
                    width: 200,
                    child: Text(
                      "Date: " + widget.center_date.toString(),
                    ),
                  ),
                  labelPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  clipBehavior: Clip.none,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: const Text(
                  'Book',
                  textScaleFactor: 2,
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/booking_confirm",
                    arguments: {
                      "center_name": widget.center_name.toString(),
                      "center_address": widget.center_address.toString(),
                      "center_slots": widget.center_slots,
                      "center_type": widget.center_type.toString(),
                      "doc_id": widget.doc_id.toString(),
                      "center_age": widget.center_age.toString(),
                      "center_date": widget.center_date.toString(),
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
