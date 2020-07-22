import 'package:flutter/material.dart';
import 'game_master.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:io';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  GameMaster game = GameMaster();
  int questionsLeft = 1;

  void checkAnswer(bool answer){
    setState(() {
      if (game.checkAnswer(answer)){
        print('correct!');
        scoreKeeper.add(
            Icon(
                Icons.check,
                color: Colors.green
            )
        );
      } else {
        print('wrong!');
        scoreKeeper.add(
          Icon(
              Icons.close,
              color: Colors.red
          ),
        );
      }
    });

  }

  void showPrompt(){
    setState(() {
      double percentage = game.getCorrectPercentage() * 100;
      percentage = double.parse(percentage.toStringAsFixed(2));
      Alert(
        context: context,
        title: "Quizzler",
        desc: "You reached the end of the quiz! You got $percentage %"
      ).show();

      game.reset();
      scoreKeeper = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                game.getQuestion().questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {

                  if ( questionsLeft > 0 ){
                    checkAnswer(true);
                  } else {
                    showPrompt();
                  }

                  questionsLeft = game.nextQuestion();

                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  if (questionsLeft > 0){
                    checkAnswer(false);
                  } else {
                    showPrompt();
                    //scoreKeeper.clear();
                  }

                  questionsLeft = game.nextQuestion();

                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
