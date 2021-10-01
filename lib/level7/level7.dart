import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:diamondgame/level8/level8.dart';
import 'package:flutter/material.dart';
import 'package:diamondgame/models/name.dart';
import 'package:diamondgame/utilities/database_helper.dart';

import '../start.dart';
import 'quiz7.dart';
import 'result7.dart';

class level7 extends StatefulWidget {
  Name name;

  level7(this.name);

  @override
  State<StatefulWidget> createState() {
    return _level7(name);
  }
}

class _level7 extends State<level7> {
  Name name;

  _level7(this.name);

  SQL_Helper helper = new SQL_Helper();

  final _questions = const [
    {
      'questionText': 'أين توجد صخرة إيرس؟',
      'answers': [
        {'text': 'استراليا', 'score': 1},
        {'text': 'البرازيل', 'score': 0},
        {'text': 'روسيا', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText': 'ماذا يعني اسم لوس أنجلوس؟',
      'answers': [
        {'text': 'مدينة الحدائق', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'مدينة الملائكة', 'score': 1},
        {'text': 'مدينة الكنوز', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو صاحب لقب الشيخ الرئيس؟',
      'answers': [
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'سقراط', 'score': 0},
        {'text': 'الخوارزمي', 'score': 0},
        {'text': 'ابن سينا', 'score': 1},
      ]
    },
    {
      'questionText': 'من هو صاحب كتاب طبقات الشعراء؟',
      'answers': [
        {'text': 'أحمد شوقي', 'score': 0},
        {'text': 'المعتز', 'score': 1},
        {'text': 'أبو تمام', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو الشاعر الذي ألف كتاب الحماسة وكتاب فحول الشعراء؟',
      'answers': [
        {'text': 'نزار القباني', 'score': 0},
        {'text': 'بشار بن برد', 'score': 0},
        {'text': 'أبو تمام', 'score': 1},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو الشاعر الذي يُلقب بالمرعث؟',
      'answers': [
        {'text': 'بشار بن برد', 'score': 1},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': ' نزار قباني', 'score': 0},
        {'text': 'أحمد شوقي', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو الأديب العربي مؤلف مسرحية ”يا طالع الشجرة” ؟ ',
      'answers': [
        {'text': 'محمد عبد الوهاب', 'score': 0},
        {'text': 'توفيق الحكيم', 'score': 1},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'طه حسين', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو هداف الدورى الانجليزى في 2012 ؟',
      'answers': [
        {'text': 'واين روني', 'score': 0},
        {'text': 'لامبارد ', 'score': 0},
        {'text': 'اجويرو', 'score': 0},
        {'text': 'روبن فان بيرسي', 'score': 1},
      ]
    },
    {
      'questionText': 'ما هي أكثر قارة شاركت في إستضافة بطولة كأس العالم؟',
      'answers': [
        {'text': 'اوروبا', 'score': 1},
        {'text': 'أمريكا الجنوبية', 'score': 0},
        {'text': 'افريقيا', 'score': 0},
        {'text': 'اسيا', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو أكبر لاعب سناً شارك في كاس العالم؟',
      'answers': [
        {'text': 'توتى', 'score': 0},
        {'text': 'ليونيل ميسى', 'score': 0},
        {'text': 'عصام الحضرى', 'score': 1},
        {'text': 'لبرازيلي رونالدو', 'score': 0},
      ]
    },
    {
      'questionText': 'أي ولاية أمريكية لديها أكثر البراكين نشاطًا ؟',
      'answers': [
        {'text': 'الاسكا', 'score': 1},
        {'text': 'واشنطن ', 'score': 0},
        {'text': 'كاليفورنيا', 'score': 0},
        {'text': 'نيويورك', 'score': 0},
      ]
    },
    {
      'questionText':
          'ما هي القارة التي تقع عند خط الطول 90 درجة جنوبا على خط الطول 0.00 درجة شرقا؟',
      'answers': [
        {'text': 'انتاركاتيكا', 'score': 1},
        {'text': 'افريقيا ', 'score': 0},
        {'text': 'اسيا', 'score': 0},
        {'text': 'اوروبا', 'score': 0},
      ]
    },
    {
      'questionText': 'من اول من اخترع البطارية الاولى؟',
      'answers': [
        {'text': 'أليساندرو فولتا', 'score': 1},
        {'text': 'اديسون ', 'score': 0},
        {'text': 'امبير', 'score': 0},
        {'text': 'اينشتاين', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هو الهرمون الذي ينتجه البنكرياس؟',
      'answers': [
        {'text': 'الانسولين', 'score': 1},
        {'text': 'دوبامين', 'score': 0},
        {'text': 'الميلاتونين', 'score': 0},
        {'text': 'الكورتيزول', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هو معدل ضربات قلب الطائر الطنان؟',
      'answers': [
        {'text': '1200 نبضة في الدقيقة', 'score': 0},
        {'text': '1260 نبضة في الدقيقة', 'score': 1},
        {'text': '800 نبضة في الدقيقة', 'score': 0},
        {'text': '1150 نبضة في الدقيقة', 'score': 0},
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
    name.level = 7;
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
