import 'package:flutter/material.dart';

class NewsTabWidget extends StatefulWidget {
  const NewsTabWidget({Key? key}) : super(key: key);

  @override
  _NewsTabWidgetState createState() => _NewsTabWidgetState();
}

class _NewsTabWidgetState extends State<NewsTabWidget> {
  drawcards() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Text("This is a cornorna news click to view more"),
          ElevatedButton.icon(
            onPressed: null,
            icon: Icon(Icons.arrow_forward),
            label: Text(""),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              "Latest Updates",
              textScaleFactor: 2,
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            color: Colors.grey[800],
            thickness: 2,
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Experts still advise mask-wearing and say it's safe and effective",
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        ElevatedButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.arrow_forward),
                          label: Text(""),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Delhi runs out of Covishield stock, many vaccine centers shut today",
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        ElevatedButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.arrow_forward),
                          label: Text(""),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Kids complain of post-COVID symptoms like breathlessness, headache in Delhi",
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        ElevatedButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.arrow_forward),
                          label: Text(""),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "PM Modi interacts with chief ministers to discuss the COVID-19 situation",
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        ElevatedButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.arrow_forward),
                          label: Text(""),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Concerns over COVID-19 mount before Olympic Games begin",
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        ElevatedButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.arrow_forward),
                          label: Text(""),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Text("This is a cornorna news click to view more"),
                        ElevatedButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.arrow_forward),
                          label: Text(""),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Text("This is a cornorna news click to view more"),
                        ElevatedButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.arrow_forward),
                          label: Text(""),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Text("This is a cornorna news click to view more"),
                        ElevatedButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.arrow_forward),
                          label: Text(""),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.grey[800],
            thickness: 2,
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      color: Colors.orangeAccent[40],
                      image: DecorationImage(
                        image: AssetImage(
                          'images/images1.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      color: Colors.orangeAccent[40],
                      image: DecorationImage(
                        image: AssetImage(
                          'images/images2.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
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
