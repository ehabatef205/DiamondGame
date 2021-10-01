import 'package:flutter/material.dart';
import 'package:diamondgame/level1/question1.dart';
import 'package:diamondgame/models/name.dart';
import 'answer9.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  final int totalScore;
  final Name name;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
    @required this.totalScore,
    @required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.70), borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 15, bottom: 8, right: 8),
                    child: Column(
                      children: [
                        Text(
                          "الاسئلة",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          "${name.question + 1}/10",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CircleAvatar(
                      child: Text(
                        "9",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      backgroundColor: Colors.blue[800].withOpacity(0.8)
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 15, bottom: 8, right: 8),
                    child: Row(
                      children: [
                        Text(
                          totalScore.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(width: 5),
                        Image.asset("assets/game4.png", height: 35, width: 35),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Question(
              questions[questionIndex]['questionText'],
            ), //Question
            ...(questions[questionIndex]['answers']
            as List<Map<String, Object>>)
                .map((answer) {
              return Answer(
                      () => answerQuestion(answer['score']), answer['text']);
            }).toList(),
          ],
        ),
      ),
    ); //Column
  }
}
