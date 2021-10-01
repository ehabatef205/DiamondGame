import 'dart:async';
import 'dart:math';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:diamondgame/level2/level2.dart';
import 'package:flutter/material.dart';
import 'package:diamondgame/models/name.dart';
import 'package:diamondgame/start.dart';
import 'package:diamondgame/utilities/database_helper.dart';

import 'quiz1.dart';
import 'result1.dart';

class level1 extends StatefulWidget {
  Name name;
  level1(this.name);

  @override
  State<StatefulWidget> createState() {
    return _level1(this.name);
  }
}

class _level1 extends State<level1> {
  Name name;
  _level1(this.name);

  SQL_Helper helper = new SQL_Helper();

  var _questions = const [
    {
      'questionText':
          'من هو الأديب العربي الذي نال جائزة نوبل للآداب عام 1988م؟',
      'answers': [
        {'text': 'نجيب محفوظ', 'score': 1},
        {'text': 'العقاد', 'score': 0},
        {'text': 'النابلسى', 'score': 0},
        {'text': 'أبو تمام', 'score': 0},
      ]
    },
    {
      'questionText': 'من صاحب قصيدة البرده؟',
      'answers': [
        {'text': 'الجاحظ', 'score': 0},
        {'text': 'الخنساء', 'score': 0},
        {'text': 'كعب بن زهير', 'score': 1},
        {'text': 'المتنبى', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هي اول مهمة لأبولو هبطت ع سطح القمر ؟',
      'answers': [
        {'text': 'ابولو 9', 'score': 0},
        {'text': 'ابولو 10', 'score': 0},
        {'text': 'ابولو 8', 'score': 0},
        {'text': 'ابولو 11', 'score': 1},
      ]
    },
    {
      'questionText': 'أي من هذه العظام يصعب كسرها؟',
      'answers': [
        {'text': 'الجمجمة', 'score': 0},
        {'text': 'القصبة', 'score': 0},
        {'text': 'عظم الفخذ', 'score': 1},
        {'text': 'العضد', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هو أكبر حيوان على وجه الأرض حاليًا؟',
      'answers': [
        {'text': 'الحوت القاتل', 'score': 0},
        {'text': 'الحوت الأزرق', 'score': 1},
        {'text': 'الزرافة', 'score': 0},
        {'text': 'السبيدج الضخم', 'score': 0},
      ]
    },
    {
      'questionText': 'كم عدد العظام في جسم الإنسان؟',
      'answers': [
        {'text': '322', 'score': 0},
        {'text': '280', 'score': 0},
        {'text': '208', 'score': 0},
        {'text': '206', 'score': 1},
      ]
    },
    {
      'questionText': 'من الدولة المستضيفة لكأس العالم 2018 ؟',
      'answers': [
        {'text': 'روسيا', 'score': 1},
        {'text': 'جنوب افريقيا', 'score': 0},
        {'text': 'البرازيل', 'score': 0},
        {'text': 'المانيا', 'score': 0},
      ]
    },
    {
      'questionText':
          'ما هي النتيجة النهائية لمباراة ألمانيا ضد البرازيل 2014 في كأس العالم FIFA؟',
      'answers': [
        {'text': '2-1', 'score': 0},
        {'text': '4-0', 'score': 0},
        {'text': '5-2', 'score': 0},
        {'text': '7-1', 'score': 1},
      ]
    },
    {
      'questionText': 'متى تم تأسيس نادي شالكه؟',
      'answers': [
        {'text': '1909', 'score': 0},
        {'text': '1904', 'score': 1},
        {'text': '2001', 'score': 0},
        {'text': '1999', 'score': 0},
      ]
    },
    {
      'questionText': 'في أي عام وقع انهيار وول ستريت؟',
      'answers': [
        {'text': '1950', 'score': 0},
        {'text': '1930', 'score': 0},
        {'text': '1929', 'score': 1},
        {'text': '2000', 'score': 0},
      ]
    },
    {
      'questionText': 'كم عدد بطولات منتخب مصر في كاس الامم الافريقية ؟ ',
      'answers': [
        {'text': '7', 'score': 1},
        {'text': '5', 'score': 0},
        {'text': '4', 'score': 0},
        {'text': '8', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هو المحايد الضربى؟ ',
      'answers': [
        {'text': '1', 'score': 1},
        {'text': '6', 'score': 0},
        {'text': '0', 'score': 0},
        {'text': '2', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هو المحايد الجمعى ؟ ',
      'answers': [
        {'text': '1', 'score': 0},
        {'text': '6', 'score': 0},
        {'text': '0', 'score': 1},
        {'text': '2', 'score': 0},
      ]
    },
    {
      'questionText': 'من جاور السعيد يسعد ومن جاور الحداد ......؟ ',
      'answers': [
        {'text': 'يتكوى ب ناره', 'score': 1},
        {'text': 'يقعد في داره', 'score': 0},
        {'text': 'يستفيد من شغله', 'score': 0},
        {'text': 'يلعب ب ناره', 'score': 0},
      ]
    },
    {
      'questionText': 'يودع سره في ...؟',
      'answers': [
        {'text': 'اضعف خلقه', 'score': 1},
        {'text': 'اقوى خلقه', 'score': 0},
        {'text': 'اذكى خلقه', 'score': 0},
        {'text': 'اشطر خلقه', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو مخترع الدينامو ؟',
      'answers': [
        {'text': 'اينشتاين', 'score': 0},
        {'text': 'فارادى ', 'score': 1},
        {'text': 'اديسون', 'score': 0},
        {'text': 'ستيفن هوكينج', 'score': 0},
      ]
    },
    {
      'questionText': 'قبل ما تحمل جهزت الكمون , وقبل ما تولد سميته ....؟',
      'answers': [
        {'text': 'محمود', 'score': 0},
        {'text': 'مأمون ', 'score': 1},
        {'text': 'محمد', 'score': 0},
        {'text': 'ممدوح', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هو الكائن البحري الذي يتواجد له ثمان أرجل؟',
      'answers': [
        {'text': 'السلطعون', 'score': 0},
        {'text': 'الاخطبوط ', 'score': 1},
        {'text': 'القرش', 'score': 0},
        {'text': 'الحوت', 'score': 0},
      ]
    },
    {
      'questionText': 'عدد لاعبى فريق كرة القدم ؟',
      'answers': [
        {'text': '10', 'score': 0},
        {'text': '12 ', 'score': 0},
        {'text': '11', 'score': 1},
        {'text': '9', 'score': 0},
      ]
    },
    {
      'questionText': 'اين ولد سيدنا عيسى ..؟',
      'answers': [
        {'text': 'مصر', 'score': 0},
        {'text': 'الشام ', 'score': 0},
        {'text': 'فلسطين', 'score': 1},
        {'text': 'الكويت', 'score': 0},
      ]
    },
  ];

  List<int> a = new List<int>(10);

  List<int> q() {
    List<int> n = new List<int>.generate(20, (index) => index);
    n.shuffle();
    print(n);
    return n;
  }

  int _questionIndex = 0;
  int resultScore = 0;
  int _scoreLevel = 0;

  CountDownController _controller = CountDownController();

  void _answerQuestion(int score) {
    resultScore += score;
    _scoreLevel += score;
    i++;
    setState(() {
      _questionIndex = _questionIndex + 1;
      name.totalScore = resultScore;
      name.scoreLevel = _scoreLevel;
      name.question = _questionIndex;
      _save();
    });
  }

  void _save() async {
    int result;
    if (name.id != null) {
      // Case 1: Update operation
      result = await helper.updateName(name);
    } else {
      // Case 2: Insert Operation
      result = await helper.insertName(name);
    }
  }

  List<Name> namesList;
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Level 1 $a");
    a = q();
    if (name.question == 10) {
      resultScore = name.totalScore;
      _scoreLevel = name.scoreLevel;
      _questionIndex = name.question;
    } else {
      name.totalScore = name.totalScore - name.scoreLevel;
      name.scoreLevel = 0;
      resultScore = name.totalScore;
      name.question = 0;
      _scoreLevel = name.scoreLevel;
      _questionIndex = name.question;
    }
    name.level = 1;
    _save();
  }

  int i = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
          Navigator.push(
            context,
            // ignore: missing_return
            MaterialPageRoute(builder: (context) => Start()),
          );
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/game1.jpg"), fit: BoxFit.fill)),
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: _questionIndex < 10
                            ? Column(
                                children: [
                                  Quiz(
                                    answerQuestion: _answerQuestion,
                                    questionIndex: a[i],
                                    questions: _questions,
                                    totalScore: resultScore,
                                    name: name,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 20, bottom: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.70),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 15, bottom: 8, right: 8),
                                                  child: Container()),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 15, bottom: 8, right: 8),
                                                  child: Container()),
                                            )
                                          ],
                                        ),
                                        CircularCountDownTimer(
                                          color: Colors.white,
                                          height: 80,
                                          width: 80,
                                          isReverse: true,
                                          duration: 60,
                                          isReverseAnimation: true,
                                          fillColor: Colors.green,
                                          controller: _controller,
                                          onComplete: () {
                                            setState(() {
                                              _questionIndex = 10;
                                              name.question = 10;
                                              _save();
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : Result(name),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
