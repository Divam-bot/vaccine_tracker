import 'package:flutter/material.dart';

class DistrictTab extends StatefulWidget {
  const DistrictTab({Key? key}) : super(key: key);

  @override
  _DistrictTabState createState() => _DistrictTabState();
}

class _DistrictTabState extends State<DistrictTab> {
  TextEditingController statecontroller = TextEditingController();
  TextEditingController districtcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            autocorrect: true,
            autofillHints: <String>["gujarat", "maharastra"],
            controller: statecontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter State Name",
              labelText: "State",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            controller: districtcontroller,
            autocorrect: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter District name",
              labelText: "District",
            ),
          ),
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 15,
            ),
            Container(
              child: ElevatedButton(
                child: Text("cancel"),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              child: ElevatedButton(
                child: Text("Find Centers"),
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}
