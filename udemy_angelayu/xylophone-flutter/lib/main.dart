import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  Expanded createKeys(String note, Color keyColor){
    return Expanded(
        child: FlatButton(
          color: keyColor,
          onPressed: (){
            final player=AudioCache();
            player.play(note);
          },
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              createKeys("note1.wav", Colors.red),
              createKeys("note2.wav", Colors.blue),
              createKeys("note3.wav", Colors.yellow),
              createKeys("note4.wav", Colors.green),
              createKeys("note5.wav", Colors.teal),
              createKeys("note6.wav", Colors.brown),
              createKeys("note7.wav", Colors.amber),
            ]
          ),
        ),
      ),
    );
  }
}
