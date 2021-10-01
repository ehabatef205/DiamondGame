import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:diamondgame/level7/level7.dart';
import 'package:flutter/material.dart';
import 'package:diamondgame/models/name.dart';
import 'package:diamondgame/utilities/database_helper.dart';

import '../start.dart';
import 'quiz6.dart';
import 'result6.dart';

class level6 extends StatefulWidget {
  Name name;

  level6(this.name);

  @override
  State<StatefulWidget> createState() {
    return _level6(name);
  }
}

class _level6 extends State<level6> {
  Name name;

  _level6(this.name);

  SQL_Helper helper = new SQL_Helper();

  final _questions = const [
    {
      'questionText': 'أين توجد جزر القمر؟',
      'answers': [
        {'text': 'المحيط الأطلسي', 'score': 0},
        {'text': 'المحيط الهندي', 'score': 1},
        {'text': 'المحيط الهادي', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText': 'ماذا يحد فلسطين من الشرق؟',
      'answers': [
        {'text': 'مصر', 'score': 0},
        {'text': 'لبنان', 'score': 0},
        {'text': 'الأردن', 'score': 1},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هي عاصمة السنغال؟',
      'answers': [
        {'text': 'سكوبيا', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'داكار', 'score': 1},
        {'text': 'سكوبيا', 'score': 0},
      ]
    },
    {
      'questionText': 'من هي المدينة الأوروبية التي يطلق عليها مدينة الضباب؟',
      'answers': [
        {'text': 'نيويورك', 'score': 0},
        {'text': 'لندن', 'score': 1},
        {'text': 'باريس', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هي الدولة التي شاهدت التلفزيون لأول مرة؟',
      'answers': [
        {'text': 'مصر', 'score': 0},
        {'text': 'أوروبا', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'أمريكا', 'score': 1},
      ]
    },
    {
      'questionText': 'أين كان أول مكان اخترع فيه البارود؟',
      'answers': [
        {'text': 'العرب', 'score': 0},
        {'text': 'الصين', 'score': 1},
        {'text': 'الروم', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText': 'أين يوجد أكبر سوق للتمور في السعودية؟',
      'answers': [
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'عنيزة', 'score': 0},
        {'text': 'بريدة', 'score': 1},
        {'text': 'عكاظ', 'score': 0},
      ]
    },
    {
      'questionText': 'أي من الشعوب الذين وضعوا الحروف الهجائية؟',
      'answers': [
        {'text': 'العرب', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'الأغريق', 'score': 0},
        {'text': 'الفينيقيين', 'score': 1},
      ]
    },
    {
      'questionText': 'ما هي عاصمة ألبانيا؟',
      'answers': [
        {'text': 'كتمندو', 'score': 0},
        {'text': 'ساوتومي', 'score': 0},
        {'text': 'تيرانا', 'score': 1},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو رئيس جمهورية مصر العربية فى عام 1980',
      'answers': [
        {'text': 'جمال عبد الناصر', 'score': 0},
        {'text': 'انور السادات', 'score': 1},
        {'text': 'محمد حسنى مبارك', 'score': 0},
        {'text': 'محمد نجيب', 'score': 0},
      ]
    },
    {
      'questionText': 'من هي الممثلة بطلة مسلسل العائلة ؟',
      'answers': [
        {'text': 'حنان ترك', 'score': 0},
        {'text': 'ليلى علوى ', 'score': 1},
        {'text': 'ياسمين صبرى', 'score': 0},
        {'text': 'هند صبرى', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو الممثل بطل مسلسل الاختيار ؟',
      'answers': [
        {'text': 'محمد هنيدى', 'score': 0},
        {'text': 'امير كرارة ', 'score': 1},
        {'text': 'احمد السقا', 'score': 0},
        {'text': 'كريم عبد العزيز', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هو الكوكب الذي تم تلقيبه بالكوكب الأحمر؟ ؟',
      'answers': [
        {'text': 'عطارد', 'score': 0},
        {'text': 'المريخ ', 'score': 1},
        {'text': 'الارض', 'score': 0},
        {'text': 'الزهرة', 'score': 0},
      ]
    },
    {
      'questionText':
          'من القائل (لو تسلم زمام الحكم في العالم رجل كمحمد لقاده الى حل جميع مشاكله) ؟',
      'answers': [
        {'text': 'برناردشو', 'score': 1},
        {'text': 'أبو بكر الصديق ', 'score': 0},
        {'text': 'السادات', 'score': 0},
        {'text': 'ديكنز', 'score': 0},
      ]
    },
    {
      'questionText': 'من هي الدولة الوحيدة في العالم التي ليس لديها جيش ؟',
      'answers': [
        {'text': 'سويسرا', 'score': 1},
        {'text': 'الصومال ', 'score': 0},
        {'text': 'اثيوبيا', 'score': 0},
        {'text': 'كوريا الجنوبية', 'score': 0},
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
    name.level = 6;
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
