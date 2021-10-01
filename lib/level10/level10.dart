import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:diamondgame/level1/level1.dart';
import 'package:flutter/material.dart';
import 'package:diamondgame/models/name.dart';
import 'package:diamondgame/utilities/database_helper.dart';

import '../start.dart';
import 'quiz10.dart';
import 'result10.dart';

class level10 extends StatefulWidget {
  Name name;

  level10(this.name);

  @override
  State<StatefulWidget> createState() {
    return _level10(name);
  }
}

class _level10 extends State<level10> {
  Name name;

  _level10(this.name);

  SQL_Helper helper = new SQL_Helper();

  final _questions = const [
    {
      'questionText': 'من أول من ألّف موسوعة عربية للمصطلحات العلمية؟',
      'answers': [
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'الحسن بن الهيثم', 'score': 0},
        {'text': 'ابن سينا', 'score': 0},
        {'text': 'الخوارزمي', 'score': 1},
      ]
    },
    {
      'questionText': 'من هو مؤرخ كتاب تاريخ الأمم والملوك؟',
      'answers': [
        {'text': 'ابن خلدون', 'score': 0},
        {'text': 'الطبري', 'score': 1},
        {'text': 'ابن تيمية', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو الشاعر الذي قتله شعره؟',
      'answers': [
        {'text': 'أحمد شوقي', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'أبو الطيب المتنبي', 'score': 1},
        {'text': 'امرؤ القيس', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو الشاعر الذي لقب بذي القروح؟',
      'answers': [
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'نزار قباني', 'score': 0},
        {'text': 'امرؤ القيس', 'score': 1},
        {'text': 'المتنبي', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو مؤلف كتاب سبل الإسلام؟',
      'answers': [
        {'text': 'ابن طفيل', 'score': 0},
        {'text': 'الصنعاني', 'score': 1},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'ابن منظور', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو مؤلف كتاب ” إحصاء العلوم ” ؟',
      'answers': [
        {'text': 'الغزالي', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
        {'text': 'ابن سينا', 'score': 0},
        {'text': 'الفارابي', 'score': 1},
      ]
    },
    {
      'questionText':
          'في أحد الأيام أجتمع 8 أصدقاء معًا في مكان واحد، وبعد أنتهاء الأمسية قام كل  واحد لمغادرة المكان وقام بمصافحة الجميع لبعضهم البعض، فكم مرة تمت المصافحة بالأيدي بينهم؟',
      'answers': [
        {'text': '15', 'score': 0},
        {'text': '28', 'score': 1},
        {'text': '23', 'score': 0},
        {'text': '20', 'score': 0},
      ]
    },
    {
      'questionText':
          'فصل دراسي يبلغ عدد الطلاب فيه 25 طالب، رسب منهم 40%، احسب عدد الطلاب الناجحين في هذا الفصل؟',
      'answers': [
        {'text': '60', 'score': 0},
        {'text': '40', 'score': 0},
        {'text': '15', 'score': 1},
        {'text': '10', 'score': 0},
      ]
    },
    {
      'questionText': 'الجازولين هو أحد مستخرجات النفط ويستخدم كوقود للـ....؟',
      'answers': [
        {'text': 'مولدات طواحين الحبوب', 'score': 0},
        {'text': 'الطائرات', 'score': 0},
        {'text': 'مولدات الكهرباء', 'score': 0},
        {'text': 'السيارات', 'score': 1},
      ]
    },
    {
      'questionText':
          'قال تعالى(لابثين فيها أحقابا) سورة النبأ(23) المقصود بـ (أحقابا)جمع حقب والحقب فترة من الزمن مقداره...؟',
      'answers': [
        {'text': '100 سنة', 'score': 0},
        {'text': '800 سنة', 'score': 0},
        {'text': '80 سنة', 'score': 1},
        {'text': '50 سنة', 'score': 0},
      ]
    },
    {
      'questionText':
      'من المآسي التي وقعت للمسلمين في حياة الرسول صلى الله عليه وسلم, مأساة وقعت في شهر صفر سنة 4هـ قتل فيها حوالي تسعة وستين أو سبعين من الصحابة ... فما هي؟',
      'answers': [
        {'text': 'مآساة بئر معونة ', 'score': 1},
        {'text': 'مآساة الرجيع ', 'score': 0},
        {'text': 'مآساة دومة الجندل', 'score': 0},
        {'text': 'مآساة حمراء الأسد', 'score': 0},
      ]
    },
    {
      'questionText':
      'من القائل: وما السعادة في الدنيا سوى شبح يرجى فإن صار جسما مله البشر؟',
      'answers': [
        {'text':'مصطفى لطفي المنفلوطي', 'score': 0},
        {'text': 'أحمد شوقي ', 'score': 0},
        {'text': 'محمود سامي البارودي ', 'score': 0},
        {'text': 'جبران خليل جبران', 'score': 1},
      ]
    },
    {
      'questionText':
      'من هو مؤسس وباني مدينة العسكر في مصر؟',
      'answers': [
        {'text': 'أحمد بن طولون', 'score': 0},
        {'text': 'أبو جعفر المنصورى', 'score': 0},
        {'text': ' صالح بن علي العباسي', 'score': 1},
        {'text': 'عمرو بن العاص ', 'score': 0},
      ]
    },
    {
      'questionText':
      'عاصمة عربية أسمها يعني(عطية الله) فما هي؟',
      'answers': [
        {'text': 'بغداد', 'score': 1},
        {'text': 'دمشق', 'score': 0},
        {'text': 'الرباط', 'score': 0},
        {'text': 'الرياض', 'score': 0},
      ]
    },
    {
      'questionText':
      'ماذا يسمى الحلف الدفاعي الذي يوحد استراليا ونينوزيلندا والولايات المتحدة الأمريكية؟',
      'answers': [
        {'text': 'حلف الأنزاس', 'score': 1},
        {'text': 'حلف الأطلنطي', 'score': 0},
        {'text': 'حلف النيتو', 'score': 0},
        {'text': 'لا يوجد اجابة صحيحة', 'score': 0},
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
    name.level = 10;
    _save();
  }

  void back() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Start()),
    );
  }

  void restart() {
    name.totalScore = 0;
    name.question = 0;
    name.scoreLevel = 0;
    name.level = 1;
    // ignore: unnecessary_statements
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => level1(name)),
    );
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
                          : Result(name, back, restart),
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
