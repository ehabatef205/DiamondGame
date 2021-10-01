import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
            child: Padding(
                padding:EdgeInsets.only(left: 30, right: 30, bottom: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: Colors.indigo,
                          textColor: Colors.white,
                          onPressed: selectHandler,
                          child: Text(answerText, textAlign: TextAlign.center,)),
                    ),
                  ],
                ))
      ),
    ); //Container
  }
} 
