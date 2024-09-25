import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(90, 0, 90, 0),
      child: RaisedButton(
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: selectHandler,
        color: Colors.teal[600],
      ),
    );
  }
}
