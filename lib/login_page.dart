import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:diamondgame/start.dart';
import 'package:diamondgame/utilities/database_helper.dart';

import 'models/name.dart';

class Login extends StatefulWidget {
  Name name;

  Login(this.name);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState(this.name);
  }
}

class LoginState extends State<Login> {
  Name name;
  SQL_Helper helper = new SQL_Helper();

  LoginState(this.name);

  TextEditingController nameController = new TextEditingController();
  String _enteredMessage = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
          alignment: Alignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/start.jpg"),
                        fit: BoxFit.fill))),
            SingleChildScrollView(
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
                    SizedBox(height: 40),
                    Container(
                      width: width * 0.8,
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          focusColor: Colors.grey,
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "ادخل اسمك هنا",
                          labelText: "الاسم",
                          labelStyle: TextStyle(color: Colors.blue),
                          filled: true,
                          fillColor: Colors.lightBlue[50],
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Colors.grey[500],
                                  style: BorderStyle.solid,
                                  width: 1)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1),
                          ),
                        ),
                        controller: nameController,
                        onChanged: (value) {
                          name.name = value;
                          _enteredMessage = value;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        color: Colors.blue[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                        onPressed: () {
                          _enteredMessage.trim().isEmpty ? null : _save();
                        },
                        child: Text(
                          "التالي",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  void goBack() {
    Navigator.pop(context, true);
  }

  void _save() async {
    getFilePath();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Start()),
    );

    int result;
    if (name.id == null) {
      result = await helper.insertName(name);
    } else {
      result = await helper.updateName(name);
    }
  }

  void getFilePath() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/names.db';
    Directory d = Directory(path);
    print(path);
    print(path);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
      print(d);
    }
  }
}
