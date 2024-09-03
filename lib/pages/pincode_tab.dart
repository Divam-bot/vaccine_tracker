import 'package:flutter/material.dart';

class PincodeTab extends StatefulWidget {
  const PincodeTab({Key? key}) : super(key: key);

  @override
  _PincodeTabState createState() => _PincodeTabState();
}

class _PincodeTabState extends State<PincodeTab> {
  TextEditingController pincodecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            controller: pincodecontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter Pincode",
              labelText: "Pincode",
            ),
          ),
        ),
        ButtonBar(
          children: <Widget>[
            ElevatedButton(
              child: Text("cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
                child: Text("Find Centers"),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    "/booking",
                    arguments: {"pin": pincodecontroller.text},
                  );
                }),
          ],
        )
      ],
    );
  }
}
