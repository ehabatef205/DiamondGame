import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:diamondgame/level9/level9.dart';
import 'package:flutter/material.dart';
import 'package:diamondgame/models/name.dart';
import 'package:diamondgame/utilities/database_helper.dart';
import '../start.dart';
import 'quiz8.dart';
import 'result8.dart';

class level8 extends StatefulWidget {
  Name name;

  level8(this.name);

  @override
  State<StatefulWidget> createState() {
    return _level8(name);
  }
}

class _level8 extends State<level8> {
  Name name;

  _level8(this.name);

  SQL_Helper helper = new SQL_Helper();

  final _questions = const [
    {
      'questionText': 'أصغر لاعب شارك في كاس العالم؟',
      'answers': [
        {'text': 'ليونيل ميسى', 'score': 0},
        {'text': 'نيمار', 'score': 0},
        {'text': 'كريستيانو رونالدو', 'score': 0},
        {'text': 'بيليه', 'score': 1},
      ]
    },
    {
      'questionText': 'ما هي أول غزوات المسلمين؟',
      'answers': [
        {'text': 'غزوة مؤتة', 'score': 0},
        {'text': 'غزوة ودان', 'score': 1},
        {'text': 'غزوة تبوك', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText': 'أين تم تصنيع أول كسوة للكعبة المُشرفة من بين تلك الدول؟',
      'answers': [
        {'text': 'فلسطين', 'score': 0},
        {'text': 'المملكة العربية السعودية', 'score': 0},
        {'text': 'مصر', 'score': 1},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText': 'كم يبلغ عدد أبواب وطبقات جهنم؟',
      'answers': [
        {'text': 'ستة أبواب وستة طبقات', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'سبعة أبواب وسبعة طبقات', 'score': 1},
        {'text': 'ثمانية أبواب وثمانية طبقات', 'score': 0},
      ]
    },
    {
      'questionText': 'من يكون الصحابي الجليل المُلقب بأبي التراب؟',
      'answers': [
        {'text': 'عثمان بن عفان', 'score': 0},
        {'text': 'علي بن أبي طالب', 'score': 1},
        {'text': 'زيد بن ثابت', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText': 'في أي مكان توجد مقبرة أمنا حواء؟',
      'answers': [
        {'text': 'القاهرة في مصر', 'score': 0},
        {'text': 'صنعاء في اليمن', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'جدة في المملكة العربية السعودية', 'score': 1},
      ]
    },
    {
      'questionText':
          'ما هي أعداد مفاتيح الغيب التي لا يعلمها إلّا الله تعالى؟',
      'answers': [
        {'text': 'أربعة مفاتيح', 'score': 0},
        {'text': 'خمسة مفاتيح', 'score': 1},
        {'text': 'ثلاثة مفاتيح', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هو الاسم الكيميائي للطباشير؟',
      'answers': [
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'كبريتيد', 'score': 0},
        {'text': 'كربونات الكالسيوم', 'score': 1},
        {'text': 'كلورات', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هي المادة التي يستخرج منها الفازلين؟',
      'answers': [
        {'text': 'الكوك', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'البرافين', 'score': 0},
        {'text': 'مادة النفط', 'score': 1},
      ]
    },
    {
      'questionText': 'من هو العالم الذي اكتشف الدورة الدموية الصغرى؟',
      'answers': [
        {'text': 'ابن خلدون', 'score': 0},
        {'text': 'الحسن البصري', 'score': 0},
        {'text': 'ابن النفيس', 'score': 1},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText':
      'كم مرة ورد أسم(هارون)في القرآن الكريم؟',
      'answers': [
        {'text': '12', 'score': 0},
        {'text': '21', 'score': 0},
        {'text': '20', 'score': 1},
        {'text': '25', 'score': 0},
      ]
    },
    {
      'questionText':
      'ما المقصود بالثرى في المثل الذي يقال(بعد الثريا عن الثرى)؟',
      'answers': [
        {'text': 'زحل', 'score': 0},
        {'text': 'المشتري', 'score': 0},
        {'text': 'الأرض', 'score': 1},
        {'text': 'عطارد', 'score': 0},
      ]
    },
    {
      'questionText':
      'ما جنسية العالم جوزف برستلي مكتشف الأوكسجين؟',
      'answers': [
        {'text': 'أمريكي', 'score': 0},
        {'text': 'الماني', 'score': 0},
        {'text': 'بريطاني', 'score': 1},
        {'text': 'روسى', 'score': 0},
      ]
    },
    {
      'questionText':
      'في أي عام تم جلاء أخر جندي بريطاني من اليمن؟',
      'answers': [
        {'text': 'عام 1969م', 'score': 0},
        {'text': 'عام 1997م', 'score': 0},
        {'text': 'عام 1967م', 'score': 1},
        {'text': 'عام 1987م', 'score': 0},
      ]
    },

    {
      'questionText':
      'تقع الصحراء الرملية الكبرى في...؟',
      'answers': [
        {'text': 'أمريكا الجنوبية', 'score': 0},
        {'text': 'أمريكا الشمالية', 'score': 0},
        {'text': 'أستراليا', 'score': 1},
        {'text': 'روسيا', 'score': 0},
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
    name.level = 8;
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
