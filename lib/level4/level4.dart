import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:diamondgame/level5/level5.dart';
import 'package:flutter/material.dart';
import 'package:diamondgame/models/name.dart';
import 'package:diamondgame/utilities/database_helper.dart';

import '../start.dart';
import 'quiz4.dart';
import 'result4.dart';

class level4 extends StatefulWidget {
  Name name;

  level4(this.name);

  @override
  State<StatefulWidget> createState() {
    return _level4(name);
  }
}

class _level4 extends State<level4> {
  Name name;

  _level4(this.name);

  SQL_Helper helper = new SQL_Helper();

  final _questions = const [
    {
      'questionText': 'من شعراء العصر الأموي ..؟',
      'answers': [
        {'text': 'أبو الطيب المتنبي', 'score': 0},
        {'text': 'الكميت', 'score': 1},
        {'text': 'ابن خفاجي الأندلسي', 'score': 0},
        {'text': 'ابن هانئ الأندلسي', 'score': 0},
      ]
    },
    {
      'questionText': 'يضرب به المثل في الحلم فيقال أحلم من …؟',
      'answers': [
        {'text': 'الأحنف بن حسان', 'score': 0},
        {'text': 'المهلب بن حاتم', 'score': 0},
        {'text': 'الأحنف بن قيس', 'score': 1},
        {'text': 'المهلب بن صفرة', 'score': 0},
      ]
    },
    {
      'questionText': 'اكبر دولة افريقية من حيث المساحة هي دولة …؟',
      'answers': [
        {'text': 'السودان', 'score': 1},
        {'text': 'مورتانيا', 'score': 0},
        {'text': 'مصر', 'score': 0},
        {'text': 'الجزائر', 'score': 0},
      ]
    },
    {
      'questionText': 'الغاز الذي يشكل حوالي 75 %من اجمالي كتلة الشمس هو…؟',
      'answers': [
        {'text': 'النتروجين', 'score': 0},
        {'text': 'الكالسيوم', 'score': 0},
        {'text': 'الهيدروجين', 'score': 1},
        {'text': 'الأوكسجين', 'score': 0},
      ]
    },
    {
      'questionText': 'صاحب كتاب (حي إبن يقظان) هو..؟',
      'answers': [
        {'text': 'إبن رشد', 'score': 0},
        {'text': 'إبن طفيل', 'score': 1},
        {'text': 'إبن عربي', 'score': 0},
        {'text': 'ابن خلدون', 'score': 0},
      ]
    },
    {
      'questionText':
          'المد في قوله تعالى(ويزداد الذينَ ءامنوا إيماناً) في كلمة ايمانا هو مد..؟',
      'answers': [
        {'text': 'مد اللين', 'score': 0},
        {'text': 'مد العوض', 'score': 0},
        {'text': 'مد الصلة القصيرة', 'score': 0},
        {'text': 'مد البدل', 'score': 1},
      ]
    },
    {
      'questionText': 'ما العاصمة الأوربية التي تقع على ضفاف نهر التيبر؟',
      'answers': [
        {'text': 'مدينة باريس', 'score': 0},
        {'text': 'مدينة روما', 'score': 1},
        {'text': 'مدينة مدريد', 'score': 0},
        {'text': 'مدينة لندن', 'score': 0},
      ]
    },
    {
      'questionText': 'ما نظام الحكم في جزر القمر الاتحادية الإسلامية؟',
      'answers': [
        {'text': 'فدرالي', 'score': 0},
        {'text': 'ملكي', 'score': 0},
        {'text': 'جمهوري', 'score': 1},
        {'text': 'أماراة', 'score': 0},
      ]
    },
    {
      'questionText':
          'أقسم الله عزوجل بالتين والزيتون كناية عن الأرض التي تزرع فيها ومهبط الرسالات السماوية وهي أرض …؟',
      'answers': [
        {'text': 'الحجاز', 'score': 0},
        {'text': 'مصر', 'score': 0},
        {'text': 'اليمن', 'score': 0},
        {'text': 'فلسطين', 'score': 1},
      ]
    },
    {
      'questionText':
          'الماء الذي يتجمد على نحو أسرع عند وضعه في داخل الفريزرهو…؟',
      'answers': [
        {'text': 'الماء البارد', 'score': 0},
        {'text': 'الماء المعتدل', 'score': 0},
        {'text': 'الماء الساخن', 'score': 1},
        {'text': 'كلها في وقت واحد', 'score': 0},
      ]
    },
    {
      'questionText':
          'من هي اول بلد قامت بتطوير كرة القدم ووضعت اللعبة الدفاعية في كرة القدم ؟',
      'answers': [
        {'text': 'المانيا', 'score': 0},
        {'text': 'ايطاليا ', 'score': 1},
        {'text': 'اسبانيا', 'score': 0},
        {'text': 'البرازيل', 'score': 0},
      ]
    },
    {
      'questionText': 'من هو المنتخب صاحب المركز الأول في كاس العالم 1982 ؟',
      'answers': [
        {'text': 'ايطاليا', 'score': 1},
        {'text': 'انجلترا ', 'score': 0},
        {'text': 'اسبانيا', 'score': 0},
        {'text': 'البرازيل', 'score': 0},
      ]
    },
    {
      'questionText': 'ما هو الشيء الذي يزيد مع النقل ولا ينقص؟',
      'answers': [
        {'text': 'الكلمة', 'score': 1},
        {'text': 'الزرع ', 'score': 0},
        {'text': 'الملفات', 'score': 0},
        {'text': 'الشجر', 'score': 0},
      ]
    },
    {
      'questionText': 'في أي مركز حصلت إسبانيا في مونديال 1982 ؟',
      'answers': [
        {'text': 'الثانى عشر', 'score': 1},
        {'text': 'الاول ', 'score': 0},
        {'text': 'الثانى', 'score': 0},
        {'text': 'الرابع', 'score': 0},
      ]
    },
    {
      'questionText': 'ماذا يطلق ع كل ارض مستوية ؟',
      'answers': [
        {'text': 'صعيد', 'score': 1},
        {'text': 'وادى ', 'score': 0},
        {'text': 'حفرة', 'score': 0},
        {'text': 'جبل', 'score': 0},
      ]
    },
    {
      'questionText':
      'كم عدد الدول التي لها حق النقص(الفيتو) في مجلس الأمن؟',
      'answers': [
        {'text': '5', 'score': 1},
        {'text': '4', 'score': 0},
        {'text': '6', 'score': 0},
        {'text': '7', 'score': 0},
      ]
    },

    {
      'questionText':
      'من هي زوجة الخليفتين وصاحبة الهجرتين ومصلية القبلتين وزوجة الشهيدين؟',
      'answers': [
        {'text': 'أم سليم بنت ملحان', 'score': 0},
        {'text': 'أسماء بنت عميس', 'score': 1},
        {'text': 'عفراء بنت عبيد', 'score': 0},
        {'text': 'سوداء بنت الفقيه', 'score': 0},
      ]
    },

    {
      'questionText':
      'الكوكب الذي طول العام فيه11,86 سنة أرضية... هو كوكب..؟',
      'answers': [
        {'text': 'المشتري', 'score': 1},
        {'text': 'زحل', 'score': 0},
        {'text': 'المريخ', 'score': 0},
        {'text': 'بلوتو', 'score': 0},
      ]
    },
    {
      'questionText':
      'كم عدد الدول التي يتكون منها حلف وارسو؟',
      'answers': [
        {'text': '8', 'score': 0},
        {'text': '6', 'score': 0},
        {'text': '7', 'score': 1},
        {'text': '5', 'score': 0},
      ]
    },

    {
      'questionText':
      'من الذي أكتشف دواء الكلب بالتلقيح؟',
      'answers': [
        {'text': 'لويس باستر', 'score': 1},
        {'text': 'جورج أوهم', 'score': 0},
        {'text': 'غراهام بيل', 'score': 0},
        {'text': 'روبرت توماس', 'score': 0},
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
    name.level = 4;
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
