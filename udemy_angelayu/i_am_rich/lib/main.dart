import 'package:flutter/material.dart';

/*
 this is the comment for flutter
 */
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("I am rich"),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Image(
            image:
              AssetImage("images/diamond.png"),
          ),
        ),
      ),
    ),
  );
}
