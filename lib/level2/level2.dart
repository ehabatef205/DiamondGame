import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:diamondgame/level3/level3.dart';
import 'package:flutter/material.dart';
import 'package:diamondgame/models/name.dart';
import 'package:diamondgame/utilities/database_helper.dart';

import '../start.dart';
import 'quiz2.dart';
import 'result2.dart';

class level2 extends StatefulWidget {
  Name name;

  level2(this.name);

  @override
  State<StatefulWidget> createState() {
    return _level2(this.name);
  }
}

class _level2 extends State<level2> {
  Name name;

  _level2(this.name);

  SQL_Helper helper = new SQL_Helper();

  final _questions = const [
    {
      'questionText': 'في أي عام تم تصميم مسدس M1911؟',
      'answers': [
        {'text': '1911', 'score': 1},
        {'text': '1905', 'score': 0},
        {'text': '1907', 'score': 0},
        {'text': '1906', 'score': 0},
      ]
    },
    {
      'questionText': 'تم تفكيك الدولة العثمانية بعد خسارتهم في أي حرب؟',
      'answers': [
        {'text': 'حرب القرم', 'score': 0},
        {'text': 'حرب البلقان الثانية', 'score': 0},
        {'text': 'الحرب العالمية الثانية', 'score': 1},
        {'text': 'الثورة الصربية', 'score': 0},
      ]
    },
    {
      'questionText': 'أي دولة هي ثاني أكبر دولة في العالم من حيث المساحة؟',
      'answers': [
        {'text': 'روسيا', 'score': 0},
        {'text': 'كندا', 'score': 1},
        {'text': 'الولايات المتحدة الامريكية', 'score': 0},
        {'text': 'الصين', 'score': 0},
      ]
    },
    {
      'questionText': 'أي من هذه ليست ولاية أو إقليم أسترالي؟',
      'answers': [
        {'text': 'كوينزلاند', 'score': 0},
        {'text': 'نيو ساوث ويلز', 'score': 0},
        {'text': 'فيكتوريا', 'score': 0},
        {'text': 'ألبرتا', 'score': 1},
      ]
    },
    {
      'questionText': 'ما هي عاصمة كوريا الجنوبية؟',
      'answers': [
        {'text': 'سول', 'score': 1},
        {'text': 'كايتكاشو', 'score': 0},
        {'text': 'بيونج يونج', 'score': 0},
        {'text': 'تاجو', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هو اسم السكان الأصليين لنيوزيلندا؟',
      'answers': [
        {'text': 'البولينيزيين', 'score': 0},
        {'text': 'الماورى', 'score': 1},
        {'text': 'الفايكينج', 'score': 0},
        {'text': 'ساموا', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هي أكبر دولة في العالم مساحة ؟',
      'answers': [
        {'text': 'الولايات المتحدة الامريكية', 'score': 0},
        {'text': 'روسيا', 'score': 1},
        {'text': 'كندا', 'score': 0},
        {'text': 'الصين', 'score': 0},
      ]
    },
    {
      'questionText': 'كم عدد النجوم التي تم تمييزها على علم نيوزيلندا؟',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '3', 'score': 0},
        {'text': '4', 'score': 1},
        {'text': '1', 'score': 0},
      ]
    },
    {
      'questionText':
          'كم عدد البلدان التي تشترك معها الولايات المتحدة في الحدود البرية؟',
      'answers': [
        {'text': '1', 'score': 0},
        {'text': '3', 'score': 0},
        {'text': '5', 'score': 0},
        {'text': '2', 'score': 1},
      ]
    },
    {
      'questionText': 'ما هو لقب ولاية ديلاوير الأمريكية؟',
      'answers': [
        {'text': 'الولاية الخمسون', 'score': 0},
        {'text': 'الولاية السادسة عشر', 'score': 0},
        {'text': 'الولاية الأولى', 'score': 1},
        {'text': 'الولاية الثانية عشر', 'score': 0},
      ]
    },
    {
      'questionText': 'من صفعنى ....؟ ',
      'answers': [
        {'text': 'اهانى', 'score': 0},
        {'text': 'نفعنى', 'score': 1},
        {'text': 'اكرمنى', 'score': 0},
        {'text': 'اضرنى', 'score': 0},
      ]
    },
    {
      'questionText':
          'أي من الكواكب الآتية يعتبر أصغر كوكب داخل المجموعة الشمسية؟',
      'answers': [
        {'text': 'الزهرة', 'score': 0},
        {'text': 'بلوتو', 'score': 1},
        {'text': 'الارض', 'score': 0},
        {'text': 'المريخ', 'score': 0},
      ]
    },
    {
      'questionText': 'اى نوع من الحيوانات الاتية يصدر صوتا يسمى : "النميم"؟',
      'answers': [
        {'text': 'الفئران', 'score': 0},
        {'text': 'النمل ', 'score': 1},
        {'text': 'الاتان', 'score': 0},
        {'text': 'سحلية الصحراء', 'score': 0},
      ]
    },
    {
      'questionText': 'دخول كميات كبيرة من المواد غريبة على البيئة يسمى ؟',
      'answers': [
        {'text': 'التحفة', 'score': 0},
        {'text': 'التراث ', 'score': 0},
        {'text': 'التلوث', 'score': 1},
        {'text': 'التكثف', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هي المادة التي تصنع منها عجلات السيارات ؟',
      'answers': [
        {'text': 'البلاستيك', 'score': 0},
        {'text': 'القطن ', 'score': 0},
        {'text': 'المطاط', 'score': 1},
        {'text': 'السيليكون', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو اول رسول الى اهل الأرض ؟',
      'answers': [
        {'text': 'نوح عليه السلام', 'score': 1},
        {'text': 'موسى عليه السلام ', 'score': 0},
        {'text': 'ادم عليه السلام', 'score': 0},
        {'text': 'إبراهيم عليه السلام', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هي عاصمة لبنان ؟',
      'answers': [
        {'text': 'القاهرة', 'score': 0},
        {'text': 'بيروت ', 'score': 1},
        {'text': 'طرابلس', 'score': 0},
        {'text': 'الخرطوم', 'score': 0},
      ]
    },
    {
      'questionText': 'كم عدد دول أمريكا الشمالية ؟',
      'answers': [
        {'text': '5', 'score': 0},
        {'text': '3 ', 'score': 0},
        {'text': '2', 'score': 1},
        {'text': '4', 'score': 0},
      ]
    },
    {
      'questionText': 'مرادف كلمة قنوط ؟',
      'answers': [
        {'text': 'جبن', 'score': 0},
        {'text': 'امل ', 'score': 0},
        {'text': 'حيرة', 'score': 0},
        {'text': 'يأس', 'score': 1},
      ]
    },
    {
      'questionText': 'اغنية للفنانة نجاة الصغير؟',
      'answers': [
        {'text': 'الف ليلية وليلة', 'score': 0},
        {'text': 'امل حياتى ', 'score': 0},
        {'text': 'يا حكاية العمر كله', 'score': 0},
        {'text': 'عيون القلب', 'score': 1},
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

  List<int> s = new List<int>(10);

  @override
  void initState() {
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
    name.level = 2;
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
