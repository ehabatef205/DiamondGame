import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:diamondgame/level10/level10.dart';
import 'package:flutter/material.dart';
import 'package:diamondgame/models/name.dart';
import 'package:diamondgame/utilities/database_helper.dart';

import '../start.dart';
import 'quiz9.dart';
import 'result9.dart';

class level9 extends StatefulWidget {
  Name name;

  level9(this.name);

  @override
  State<StatefulWidget> createState() {
    return _level9(name);
  }
}

class _level9 extends State<level9> {
  Name name;

  _level9(this.name);

  SQL_Helper helper = new SQL_Helper();

  final _questions = const [
    {
      'questionText':
          'كتاب عدد أرقام صفحاته 88، كم مرة سوف يظهر الرقم 8 في ترقيم الكتاب؟',
      'answers': [
        {'text': '10', 'score': 1},
        {'text': '5', 'score': 0},
        {'text': '1', 'score': 0},
        {'text': '7', 'score': 0},
      ]
    },
    {
      'questionText': 'هناك رقم واحد خطأ في هذه الأعداد ما هو 60،52،45،39،35',
      'answers': [
        {'text': '40', 'score': 0},
        {'text': '50', 'score': 0},
        {'text': '35', 'score': 1},
        {'text': '60', 'score': 0},
      ]
    },
    {
      'questionText':
          'هناك 3 قطط قاموا باصطياد 3 فئران في 3 دقائق، كم عدد القطط التي تصطاد 80 فأر في 80 دقيقة؟',
      'answers': [
        {'text': '20', 'score': 0},
        {'text': '80', 'score': 0},
        {'text': '50', 'score': 0},
        {'text': '3', 'score': 1},
      ]
    },
    {
      'questionText': 'عشرة وعشرتين: ومثلهم الضعف، و5 و 3و 2 ، ما مجموعهم؟',
      'answers': [
        {'text': '90', 'score': 0},
        {'text': '100', 'score': 1},
        {'text': '50', 'score': 0},
        {'text': '80', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو مؤلف معجم لسان العرب؟',
      'answers': [
        {'text': 'طه حسين', 'score': 0},
        {'text': 'الخوارزمي ', 'score': 0},
        {'text': 'ابن منظور', 'score': 1},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو الفيلسوف الذي كان تلميذا لسقراط؟',
      'answers': [
        {'text': 'أفلاطون', 'score': 1},
        {'text': ' طوسون', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'رع', 'score': 0},
      ]
    },
    {
      'questionText': 'أين ولد الشاعر أبو العلاء المعري؟',
      'answers': [
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'في معرة النعمان', 'score': 1},
        {'text': 'في دمشق', 'score': 0},
        {'text': 'في القاهرة', 'score': 0},
      ]
    },
    {
      'questionText': 'في أي جامعة تعلم فيها الشاعر أحمد شوقي؟',
      'answers': [
        {'text': 'جامعة عين شمس', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'جامعة كاليفورنيا', 'score': 0},
        {'text': 'جامعة مونبلييه', 'score': 1},
      ]
    },
    {
      'questionText': 'من هو شاعر الفرس الأكبر؟',
      'answers': [
        {'text': 'الفردوسي', 'score': 1},
        {'text': 'الأندلسي', 'score': 0},
        {'text': 'أبو جهل', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو صاحب كتاب ”حي بن يقظان” ؟',
      'answers': [
        {'text': 'ابن خلدون', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'ابن طفيل', 'score': 1},
        {'text': 'ابن رشد', 'score': 0},
      ]
    },
    {
      'questionText':
      'من القائل: غنى النفس ما يكفيك من سد فاقة فأن زاد شيئا عاد ذاك الغنى فقرا؟',
      'answers': [
        {'text': 'أبو العتاهية', 'score': 1},
        {'text': 'الفرزدق', 'score': 0},
        {'text': 'أبو تمام', 'score': 0},
        {'text': 'أبو نواس', 'score': 0},
      ]
    },
    {
      'questionText':
      'كم عدد اللترات التي يحتاجها الدماغ البشري من الدماء يوميا لكي يعمل؟',
      'answers': [
        {'text': '1000', 'score': 1},
        {'text': '500', 'score': 0},
        {'text': '10000', 'score': 0},
        {'text': '100', 'score': 0},
      ]
    },
    {
      'questionText':
      'من القائل: عش عزيزا أو مت وأنت كريم بين طعن القنا وحفق البنود؟',
      'answers': [
        {'text': 'أبو فراس الحمداني', 'score': 0},
        {'text': 'عنترة بن شداد', 'score': 0},
        {'text': 'أبو تمام', 'score': 0},
        {'text': 'أبو الطيب المتنبي', 'score': 1},
      ]
    },
    {
      'questionText':
      'عاصمة عربية كانت تسمى قديما(فيلادليفيا) فما هي؟',
      'answers': [
        {'text': 'بغداد', 'score': 0},
        {'text': 'بيروت', 'score': 0},
        {'text': 'القاهرة', 'score': 0},
        {'text': 'عمان', 'score': 1},
      ]
    },
    {
      'questionText':
      'كم يبلغ معدل بعد الشمس عن الأرض؟',
      'answers': [
        {'text':'49مليون كم', 'score': 0},
        {'text': '249مليون كم ', 'score': 0},
        {'text': '349مليون كم', 'score': 0},
        {'text': '149 مليون كم', 'score': 1},
      ]
    },
  ];

  List<int> a = new List<int>(10);

  List<int> q() {
    List<int> n = new List<int>.generate(15, (index) => index);
    n.shuffle();
    print(n);
    return n;
  }

  int _questionIndex = 0;
  int resultScore = 0;
  int _scoreLevel = 0;

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
    name.level = 9;
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
                                                    left: 15,
                                                    bottom: 8,
                                                    right: 8),
                                                child: Container()),
                                          ),
                                          Expanded(
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 8,
                                                    right: 8),
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
