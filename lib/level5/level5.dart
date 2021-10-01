import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:diamondgame/level6/level6.dart';
import 'package:flutter/material.dart';
import 'package:diamondgame/models/name.dart';
import 'package:diamondgame/utilities/database_helper.dart';

import '../start.dart';
import 'quiz5.dart';
import 'result5.dart';

class level5 extends StatefulWidget {
  Name name;

  level5(this.name);

  @override
  State<StatefulWidget> createState() {
    return _level5(name);
  }
}

class _level5 extends State<level5> {
  Name name;

  _level5(this.name);

  SQL_Helper helper = new SQL_Helper();

  final _questions = const [
    {
      'questionText': 'ما هو إسم الجهاز الذي يستخدم في قياس الضغط الجوي ؟',
      'answers': [
        {'text': 'البارومتر', 'score': 1},
        {'text': 'المزطاب', 'score': 0},
        {'text': 'الترمومتر', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو العالم الذي إخترع التلسكوب ؟',
      'answers': [
        {'text': 'ابن سينا', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'جاليليو', 'score': 1},
        {'text': 'ألبرت أينشتاين', 'score': 0},
      ]
    },
    {
      'questionText': 'أول من أخترع خيوط الجراحة هو العالم ؟',
      'answers': [
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'الفارابى', 'score': 0},
        {'text': 'ابن رشد', 'score': 0},
        {'text': 'أبو بكر الرازى', 'score': 1},
      ]
    },
    {
      'questionText': 'من هو العالم الذي قام باختراع أول ماكينة حلاقة ؟',
      'answers': [
        {'text': 'ألفرد نوبل', 'score': 0},
        {'text': 'كينج جيليت', 'score': 1},
        {'text': 'لويس بايل', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو العالم الذي قام باختراع الآلة الحاسبة ؟',
      'answers': [
        {'text': 'بليز باكسل', 'score': 1},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'إسحاق نيوتن', 'score': 0},
        {'text': 'ماكس بلانك', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو العالم الذي إخترع جهاز التكييف ؟',
      'answers': [
        {'text': 'جيمس واتسون', 'score': 0},
        {'text': 'ويليس كارير', 'score': 1},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'اسحاق نيوتن', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو أول من صنف فصائل الدم للإنسان ؟',
      'answers': [
        {'text': 'جون ويلكنز', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'ريتشارد دوكينز', 'score': 0},
        {'text': 'لاندشتاينر', 'score': 1},
      ]
    },
    {
      'questionText': 'من هو العالم الذي إكتشف الدورة الدموية الصغرى ؟',
      'answers': [
        {'text': 'ابن النفيس', 'score': 1},
        {'text': 'جابر بن حيان', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'الحسن بن الهيثم', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو العالم الذي قام بإختراع الديناميت ؟',
      'answers': [
        {'text': 'لويس باستور', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'ألفرد نوبل', 'score': 1},
        {'text': 'ماري كوري', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو العالم الذي إستطاع إكتشاف البنسلين ؟',
      'answers': [
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'هوارد فلوري', 'score': 0},
        {'text': 'روبرت كوخ', 'score': 0},
        {'text': 'ألكسندر فلمنج', 'score': 1},
      ]
    },
    {
      'questionText': 'ما اسم الشجرة التي ترمز للسلام منذ القدم ؟',
      'answers': [
        {'text': 'الزيتون', 'score': 1},
        {'text': 'التين ', 'score': 0},
        {'text': 'صفصاف', 'score': 0},
        {'text': 'السنديان', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو ابن اخ سيدنا إسماعيل عليه السلام ؟',
      'answers': [
        {'text': 'يعقوب عليه السلام', 'score': 0},
        {'text': 'يوسف عليه السلام ', 'score': 1},
        {'text': 'إبراهيم عليه السلام', 'score': 0},
        {'text': 'إسحاق عليه السلام', 'score': 0},
      ]
    },
    {
      'questionText': 'اللى بيته من ازاز ميحدفش الناس ب ........ ؟',
      'answers': [
        {'text': 'الطوب', 'score': 1},
        {'text': 'الزلط ', 'score': 0},
        {'text': 'الحديد', 'score': 0},
        {'text': 'القطن', 'score': 0},
      ]
    },
    {
      'questionText': 'فى اى عام توفى الفنان حسن حسنى ........ ؟',
      'answers': [
        {'text': '2019', 'score': 0},
        {'text': '2020 ', 'score': 1},
        {'text': '2021', 'score': 0},
        {'text': '2018', 'score': 0},
      ]
    },
    {
      'questionText': 'من اول مسجد وضع في الارض .... ؟',
      'answers': [
        {'text': 'المسجد الحرام', 'score': 1},
        {'text': 'المسجد النبوى ', 'score': 0},
        {'text': 'المسجد الاموى', 'score': 0},
        {'text': 'المسجد الاقصى', 'score': 0},
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
    name.level = 5;
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
