import 'package:diamondgame/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:diamondgame/levelAndQuestion.dart';
import 'package:diamondgame/utilities/database_helper.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';

import 'models/name.dart';

class Start extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StartState();
  }
}

class StartState extends State<Start> {
  SQL_Helper helper = new SQL_Helper();
  List<Name> namesList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (namesList == null) {
      namesList = new List<Name>();
      updateListView();
    }

    // TODO: implement build
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
          SystemNavigator.pop();
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(
            children: [
              DecoratedBox(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/start.jpg"),
                          fit: BoxFit.fill)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [Image.asset("assets/game4.png",
                                height: 50, width: width * 0.1),
                              SizedBox(width: width * 0.1),
                              Expanded(
                                child: Container(
                                  width: width * 0.5,
                                  child: Center(
                                    child: Text(
                                      "DIAMOND",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.1,
                                          fontFamily: "Source Sans Pro"),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: width * 0.1),
                              Image.asset("assets/game4.png", height: 50, width: width * 0.1),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: _container(),
                        ),
                        RaisedButton(
                          padding:
                              EdgeInsets.symmetric(horizontal: 90, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          color: Colors.amber[800],
                          child: Text(
                            "ابدأ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          ),
                          onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          levelAndQuestion(namesList)));
                          },
                        ),
                        SizedBox(height: 20),
                        RaisedButton(
                          padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          color: Colors.blueAccent,
                          child: Text(
                            "التعليمات",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => info()));
                          }
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Container _container() {
    String name = "";
    for (int i = 0; i < count; i++) {
      name = this.namesList[0].name;
    }
    return Container(
      child:
          Text(name, style: TextStyle(fontSize: 20, color: Colors.white)),
    );
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
