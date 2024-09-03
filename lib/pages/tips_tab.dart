import 'package:flutter/material.dart';

class TipsTabWidget extends StatefulWidget {
  const TipsTabWidget({Key? key}) : super(key: key);

  @override
  _TipsTabWidgetState createState() => _TipsTabWidgetState();
}

class _TipsTabWidgetState extends State<TipsTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "Tips Before Vaccination",
                    textScaleFactor: 2,
                  ),
                  Container(
                    width: 350,
                    child: Divider(
                      color: Colors.grey[800],
                      thickness: 2,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "- Ensure a sound sleep to be well recharged",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "- Eat healthy food before going for vaccination",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "- Avoid too processed or heavy foods a day before",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "- Drink liquids that can keep you hydrated",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "- Avoid alcohol or other intoxicants on the vaccination day, as it may dehydrate you",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerRight,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "Tips After Vaccination",
                    textScaleFactor: 2,
                  ),
                  Container(
                    width: 350,
                    child: Divider(
                      color: Colors.grey[800],
                      thickness: 2,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "- After taking the vaccine, wait for 30 minutes and observe for any side effects",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "- Do not panic in case of vaccine side effects",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "- Consult your doctor if you feel nausea, allergy, dizziness, etc",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "- Do not overexert yourself and take enough rest",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "- Avoid alcohol and smoking",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "- Drink fluids to keep yourself hydrated",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "Guidelines",
                    textScaleFactor: 2,
                  ),
                  Container(
                    width: 350,
                    child: Divider(
                      color: Colors.grey[800],
                      thickness: 2,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "\u2022 Vaccine doses provided free of cost by Government of India will be allocated to States/UTs based on criteria such as population, disease burden and the progress of vaccination. Wastage of vaccine will affect the allocation negatively.",
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '''\u2022 Within the population group of citizens more than 18 years of age, States/UTs may decide their own prioritization factoring in the vaccine supply schedule.''',
                    ),
                  ),
                ],
              ),
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
