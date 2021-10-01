import 'package:flutter/material.dart';
import 'package:diamondgame/level1/level1.dart';
import 'package:diamondgame/level10/level10.dart';
import 'package:diamondgame/level2/level2.dart';
import 'package:diamondgame/level3/level3.dart';
import 'package:diamondgame/level4/level4.dart';
import 'package:diamondgame/level5/level5.dart';
import 'package:diamondgame/level8/level8.dart';
import 'package:diamondgame/level9/level9.dart';
import 'package:diamondgame/utilities/database_helper.dart';
import 'package:sqflite/sqflite.dart';

import 'level6/level6.dart';
import 'level7/level7.dart';
import 'models/name.dart';

class levelAndQuestion extends StatefulWidget {
  List<Name> namesList;

  levelAndQuestion(this.namesList);

  @override
  _levelAndQuestionState createState() => _levelAndQuestionState(namesList);
}

class _levelAndQuestionState extends State<levelAndQuestion> {
  SQL_Helper helper = new SQL_Helper();
  List<Name> namesList;
  int count = 0;

  _levelAndQuestionState(this.namesList);

  @override
  Widget build(BuildContext context) {
    if (namesList == null) {
      namesList = new List<Name>();
      updateListView();
    }

    return namesList[0].level == 1
        ? level1(namesList[0])
        : namesList[0].level == 2
            ? level2(namesList[0])
            : namesList[0].level == 3
                ? level3(namesList[0])
                : namesList[0].level == 4
                    ? level4(namesList[0])
                    : namesList[0].level == 5
                        ? level5(namesList[0])
                        : namesList[0].level == 6
                            ? level6(namesList[0])
                            : namesList[0].level == 7
                                ? level7(namesList[0])
                                : namesList[0].level == 8
                                    ? level8(namesList[0])
                                    : namesList[0].level == 9
                                        ? level9(namesList[0])
                                        : namesList[0].level == 10
                                            ? level10(namesList[0])
                                            : Container();
  }

  void updateListView() {
    final Future<Database> db = helper.initializedDatabase();
    db.then((database) {
      Future<List<Name>> names = helper.getNameList();
      names.then((theList) {
        setState(() {
          this.namesList = theList;
          this.count = theList.length;
        });
      });
    });
  }
}
