import 'package:flutter/material.dart';
import 'package:diamondgame/level2/level2.dart';
import 'package:diamondgame/models/name.dart';
import 'package:diamondgame/utilities/database_helper.dart';

import 'level1.dart';

class Result extends StatelessWidget {
  Name name;
  Result(this.name);

  SQL_Helper helper = new SQL_Helper();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Text
          Text(
            'Score ' '${name.totalScore}',
            style: TextStyle(
                color: Colors.blue[800],
                fontSize: 36,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          name.totalScore < 8
              ? Column(children: [
                  RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    color: Colors.blue[900],
                    child: Text(
                      "إعادة المستوى",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    onPressed: () {
                      name.totalScore = name.totalScore - name.scoreLevel;
                      name.question = 0;
                      name.scoreLevel = 0;
                      name.level = 1;
                      // ignore: unnecessary_statements
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => level1(name)),
                      );
                      _save();
                    },
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    color: Colors.blue[900],
                    child: Text(
                      "مشاهدة إعلان",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    onPressed: (){}
                  ),
                ])
              : RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  color: Colors.blue[900],
                  child: Text(
                    "المستوى التالي",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onPressed: () {
                    name.question = 0;
                    name.scoreLevel = 0;
                    name.level = 2;
                    _save();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => level2(name)));
                  },
                ),
        ], //<Widget>[]
      ), //Column
    ); //Center
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

}
