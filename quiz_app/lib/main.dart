import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import 'result.dart';
import 'quiz.dart';

void main() {
  runApp(MyApp());
}

// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      'questionText': 'What\'s your Favorite Colour?', // this is called mapping
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 4},
        {'text': 'Blue', 'score': 8}
      ],
    },
    {
      'questionText': 'What\'s your Favorite PC/Mobile Game?',
      'answers': [
        {'text': 'Valorant', 'score': 10},
        {'text': 'GTA V RP', 'score': 9},
        {'text': 'CS 1.6', 'score': 7},
        {'text': 'Forza Horizon', 'score': 2}
      ],
    },
    {
      'questionText': 'Which Laptop Brand Do You prefer?',
      'answers': [
        {'text': 'Asus Rog', 'score': 10},
        {'text': 'Apple MacBook', 'score': 9},
        {'text': 'Microsoft Surface', 'score': 7},
        {'text': 'HP Omen', 'score': 2}
      ],
    },
  ];
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We Still Have More Questions to GO!!');
    }
  }

  @override //decorater
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Center(
                child: Text('Quiz App'),
              )),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
