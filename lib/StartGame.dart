import 'dart:io';
import 'package:flutter/material.dart';
import 'package:diamondgame/start.dart';
import 'login_page.dart';
import 'models/name.dart';

class startApp extends StatefulWidget {
  _startApp createState() => _startApp();
}

class _startApp extends State<startApp> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    //initPlayer();
    Directory dir = Directory(
        '/data/user/0/com.xcodeteam.diamondgame/app_flutter/names.db');
    Future.delayed(Duration(seconds: 5), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => dir.existsSync()? Start() : Login(Name("", 1, 0, 0, 0, 0))));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/game5.jpg"), fit: BoxFit.fill)),
          child: Container(),
        ));
  }
}
