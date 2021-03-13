import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  // This is a getter
  String get resultPhrase {
    String resultText;
    if (resultScore >= 28) {
      resultText = 'You are Epic! ';
    } else if (resultScore >= 15) {
      resultText = 'You are Fantastic! ';
    } else if (resultScore >= 10) {
      resultText = 'You are Awsome! ';
    } else {
      resultText = 'You are Cool! ';
    }
    return resultText;
  }
  // getter doest not take any arguemts

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ),textColor: Colors.red,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
