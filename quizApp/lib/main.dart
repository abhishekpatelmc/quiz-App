import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(BasicApp());

class BasicApp extends StatefulWidget {
  @override
  _BasicAppState createState() => _BasicAppState();
}

// Adding _ before the class makes it private so that it cant be used by other classe
class _BasicAppState extends State<BasicApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your fav color',
      'answers': [
        {'text': 'white', 'score': 10},
        {'text': 'black', 'score': 4},
        {'text': 'green', 'score': 6},
        {'text': 'yellow', 'score': 7}
      ],
    },
    {
      'questionText': 'what\'s your fav food',
      'answers': [
        {'text': 'rice', 'score': 5},
        {'text': 'idly', 'score': 8},
        {'text': 'pizza', 'score': 7},
        {'text': 'burger', 'score': 6}
      ],
    },
    {
      'questionText': 'which\'s is your fav movie',
      'answers': [
        {'text': 'harry potter', 'score': 10},
        {'text': 'iron man', 'score': 9},
        {'text': 'avnegers', 'score': 8},
        {'text': 'star wars', 'score': 7}
      ],
    },
  ];

  // making this variable also private so that it cant be accessed anywhere else
  var _questionIndex = 0;
  var _totalScore = 0;

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false ;

    _totalScore += score;

    // setstate is used to change the state
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('we have more question coming....');
    } else {
      print('No more questions !');
    }
  }

  @override
  Widget build(BuildContext context) {
    // questions=[]; this does not work if questions is not a const

  return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first Flutter'),
        ),

        // the below code is a tertionry conditon ? indiactes the ternionary condition
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,resetQuiz),
      ),
    );
  }
}
