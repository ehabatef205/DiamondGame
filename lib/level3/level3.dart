import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:diamondgame/level4/level4.dart';
import 'package:flutter/material.dart';
import 'package:diamondgame/models/name.dart';
import 'package:diamondgame/utilities/database_helper.dart';

import '../start.dart';
import 'quiz3.dart';
import 'result3.dart';

class level3 extends StatefulWidget {
  Name name;

  level3(this.name);

  @override
  State<StatefulWidget> createState() {
    return _level3(name);
  }
}

class _level3 extends State<level3> {
  Name name;

  _level3(this.name);

  SQL_Helper helper = new SQL_Helper();

  final _questions = const [
    {
      'questionText':
          'أول صحابي حيّا الرسول صلى الله عليه وسلم بتحية الإسلام هو…؟',
      'answers': [
        {'text': 'أبو ذر الغفاري', 'score': 1},
        {'text': 'أبو موسى الأشعري', 'score': 0},
        {'text': 'أبو أيوب الأنصاري', 'score': 0},
        {'text': 'أبو بكر الصديق', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هو البحر الذي يسمى بحر القلزم ؟',
      'answers': [
        {'text': 'البحر الأحمر', 'score': 0},
        {'text': 'بحر قزوين', 'score': 0},
        {'text': 'البحر العربي', 'score': 1},
        {'text': 'البحر الأسود', 'score': 0},
      ]
    },
    {
      'questionText':
          'أسماء بنت عمرو بن عدي ونسيبة بنت كعب بايعتا الرسول صلى الله عليه وسلم في بيعة العقبة الثانية في بيعة…؟',
      'answers': [
        {'text': 'العقبة الأولى', 'score': 0},
        {'text': 'الخندق', 'score': 0},
        {'text': 'بيعة الرضوان', 'score': 0},
        {'text': 'العقبة الثانية', 'score': 1},
      ]
    },
    {
      'questionText': 'النحلة ترفرف بجناحيها في الثانية الواحدة بمعدل….؟',
      'answers': [
        {'text': '250 مرة', 'score': 0},
        {'text': '550 مرة', 'score': 0},
        {'text': '350 مرة', 'score': 1},
        {'text': '150 مرة', 'score': 0},
      ]
    },
    {
      'questionText': 'العالم الذي أخترع التلفون هو…؟',
      'answers': [
        {'text': 'بجوار سيكو رسكي', 'score': 0},
        {'text': 'الكسندر غراهام بيل', 'score': 1},
        {'text': 'جوزف برستلي', 'score': 0},
        {'text': 'فلهلم رونتفن', 'score': 0},
      ]
    },
    {
      'questionText': 'من مؤ لفات الطبيب العربي أبو بكر الرازي كتاب ..؟',
      'answers': [
        {'text': 'هيئة الكبد', 'score': 1},
        {'text': 'الأدوية والعلل', 'score': 0},
        {'text': 'فردوس الحكمة', 'score': 0},
        {'text': 'الطب والحكمة', 'score': 0},
      ]
    },
    {
      'questionText':
          'قال تعالى(وزرابي مبثوثة)سورة الغاشية(16) المقصود بـ(زرابي) هي …؟',
      'answers': [
        {'text': 'الفرش', 'score': 0},
        {'text': 'الطنافس', 'score': 1},
        {'text': 'الأسرة', 'score': 0},
        {'text': 'الوسائد', 'score': 0},
      ]
    },
    {
      'questionText':
          'اذا قطع المسلم إحدى شفتي أخيه المسلم فيجب عليه أن يسلم له…؟',
      'answers': [
        {'text': 'ربع الدية', 'score': 0},
        {'text': 'دية النفس كاملة', 'score': 0},
        {'text': 'ثلث الدية', 'score': 0},
        {'text': 'نصف الدية', 'score': 1},
      ]
    },
    {
      'questionText': 'تصل مده حمل أنثى الفيل إلى…؟',
      'answers': [
        {'text': '22 شهرًا', 'score': 1},
        {'text': '32 شهرًا', 'score': 0},
        {'text': '18 شهر', 'score': 0},
        {'text': '12شهر', 'score': 0},
      ]
    },
    {
      'questionText':
          ' ما المقصود بيوم الفرقان الذي ذكره الله تعالى في القرآن؟',
      'answers': [
        {'text': 'غزوة تبوك', 'score': 0},
        {'text': 'غزوة أحد', 'score': 0},
        {'text': 'فتح مكة', 'score': 0},
        {'text': 'غزوة بدر', 'score': 1},
      ]
    },
    {
      'questionText': 'ما ينحت من الحجر او المعدن يسمى ؟',
      'answers': [
        {'text': 'البستان', 'score': 0},
        {'text': 'الفنجان ', 'score': 0},
        {'text': 'التمثال', 'score': 1},
        {'text': 'الجبال', 'score': 0},
      ]
    },
    {
      'questionText': 'مدينة لقبت ب مدينة التلال السبعة؟',
      'answers': [
        {'text': 'طوكيو', 'score': 0},
        {'text': 'روما ', 'score': 1},
        {'text': 'لندن', 'score': 0},
        {'text': 'موسكو', 'score': 0},
      ]
    },
    {
      'questionText':
          'ما هو اليوم الذي بدأ فيه الخلق بداية من سيدنا آدم عليه السلام؟',
      'answers': [
        {'text': 'الاحد', 'score': 0},
        {'text': 'الجمعة ', 'score': 1},
        {'text': 'الثلاثاء', 'score': 0},
        {'text': 'السبت', 'score': 0},
      ]
    },
    {
      'questionText': 'حيوان لا يملك صوت ؟',
      'answers': [
        {'text': 'الفيل', 'score': 0},
        {'text': 'الزرافة ', 'score': 1},
        {'text': 'الحوت', 'score': 0},
        {'text': 'الدب', 'score': 0},
      ]
    },
    {
      'questionText': 'اين توجد مدينة دخيل ؟',
      'answers': [
        {'text': 'الصومال', 'score': 0},
        {'text': 'جيبوتى ', 'score': 1},
        {'text': 'موريتانيا', 'score': 0},
        {'text': 'السودان', 'score': 0},
      ]
    },
    {
      'questionText': 'حيوان لون دمه ازرق ؟',
      'answers': [
        {'text': 'الحوت الازرق', 'score': 0},
        {'text': 'الاخطبوط ', 'score': 1},
        {'text': 'القرش', 'score': 0},
        {'text': 'البطريق', 'score': 0},
      ]
    },
    {
      'questionText': 'كم كيلو جرام يساوى الطن ؟',
      'answers': [
        {'text': '952', 'score': 0},
        {'text': '800 ', 'score': 1},
        {'text': '1050', 'score': 0},
        {'text': '1200', 'score': 0},
      ]
    },
    {
      'questionText': 'حيوان لا يمكن له أن يتنفس إلا من خلال لسانه؟',
      'answers': [
        {'text': 'السمكة', 'score': 0},
        {'text': 'الثعبان ', 'score': 1},
        {'text': 'الكلب', 'score': 0},
        {'text': 'القطة', 'score': 0},
      ]
    },
    {
      'questionText': 'المكون الاساسى للزجاج ؟',
      'answers': [
        {'text': 'الحديد', 'score': 0},
        {'text': 'الزجاج ', 'score': 0},
        {'text': 'الرمل', 'score': 1},
        {'text': 'النحاس', 'score': 0},
      ]
    },
    {
      'questionText':
          'هناك عدد إذا ضرب في نفسه واضاف له نفسه اصبح الناتج ثلاثين؟',
      'answers': [
        {'text': '9', 'score': 0},
        {'text': '5 ', 'score': 1},
        {'text': '8', 'score': 0},
        {'text': '4', 'score': 0},
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
    name.level = 3;
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
