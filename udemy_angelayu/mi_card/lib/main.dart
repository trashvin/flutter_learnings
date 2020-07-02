import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
        backgroundColor: Colors.brown.shade500,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("assets/profile.jpg"),
              ),
              Text(
                  "Its.Kafenated",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Yellowtail'
                  ),
              ),
              Text(
                "we turn coffee to code",
                style: TextStyle(
                    color: Colors.brown.shade100,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'SourceSans',
                    letterSpacing: 2.0
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 100.0,
                child: Divider(
                  color: Colors.white
                )
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical:5.0,horizontal:55.0),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.brown,
                    ),
                    title: Text(
                      "+63123222334",
                      style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical:5.0,horizontal:55.0),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.mail,
                      color: Colors.brown,
                    ),
                    title:Text(
                      "coffe@code.com",
                      style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ),
              )
            ],
          )

        ),
      ),
      );
  }
}
