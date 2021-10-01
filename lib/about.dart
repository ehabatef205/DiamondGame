import 'package:diamondgame/start.dart';
import 'package:flutter/material.dart';

class info extends StatefulWidget {
  @override
  _infoState createState() => _infoState();
}

class _infoState extends State<info> {
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
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/game1.jpg"),
                      fit: BoxFit.fill)),
              child: SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("شرح لعبة Diamond:", style: TextStyle(fontSize: 20),),
                          Text("اللعبة من بناء وتطوير فريق عمل شركة X-Code لبناء وتطوير التطبيقات الالكترونية وهى شركة مصرية خالصة , تتكون اللعبة من 100 سؤال منقسمين الى 10 مستويات بواقع 10 أسئلة في كل مستوى ومدة كل مستوى هي 60ث وتحتاج الى الحصول ع 80% من نقاط المستوى حتى تعبر للمستوى القادم او مشاهدة اعلان لتعويض فرق النقاط , ف على سبيل المثال للصعود من المستوى الأول للثانى ف انت تحتاج الى 8 دايموند من اصل 10 وفى حالة حصولك على نقاط اقل ف يمكنك مشاهدة اعلان لتعويض فارق النقاط.", style: TextStyle(fontSize: 18),),
                          Text(""),
                          Text("للصعود من المستوى الأول تحتاج   8 دايموند", style: TextStyle(fontSize: 18),),
                          Text("للصعود من المستوى الثانى تحتاج  16 دايموند", style: TextStyle(fontSize: 18),),
                          Text("للصعود من المستوى الثالث تحتاج  24 دايموند", style: TextStyle(fontSize: 18),),
                          Text("للصعود من المستوى الرابع تحتاج  32 دايموند", style: TextStyle(fontSize: 18),),
                          Text("للصعود من المستوى الخامس تحتاج  40 دايموند", style: TextStyle(fontSize: 18),),
                          Text("للصعود من المستوى السادس تحتاج  48 دايموند", style: TextStyle(fontSize: 18),),
                          Text("للصعود من المستوى السابع تحتاج  56 دايموند", style: TextStyle(fontSize: 18),),
                          Text("للصعود من المستوى الثامن تحتاج 64 دايموند", style: TextStyle(fontSize: 18),),
                          Text("للصعود من المستوى التاسع تحتاج 72 دايموند", style: TextStyle(fontSize: 18),),
                          Text("لانهاء اللعبة وعبور المستوى العاشر تحتاج 80 دايموند", style: TextStyle(fontSize: 18),),
                          Text(""),
                          RichText(text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "الشخص الذى سيحصل على 100 دايموند كاملة يرسل لنا على الايميل الخاص بنا ",
                                style: TextStyle(fontSize: 20, color: Colors.black),
                              ),
                              TextSpan(
                                text: "xcodeteam99@gmail.com",
                                style: TextStyle(fontSize: 20, color: Colors.blue),
                              ),
                              TextSpan(
                                text: " له جائزة مادية قيمة وأصحاب النقاط من 90 ل 100 سيرسلون لنا ويدخلوا سحب اسبوعى على صفحتنا على فيس بوك وسوف يفوز منه شخص واحد ب جائزة مالية قيمة أيضا, وصاحب اعلى ترتيب أسبوعيا سيتم نشر اسمه ع الصفحة الخاصة بنا ع فيس بوك مع جائزة تقديرية له.",
                                style: TextStyle(fontSize: 20, color: Colors.black),
                              ),
                            ]
                          )),
                          Text(""),
                          Text("اذا كان لديك اى اقتراحات او مشاكل تواصل معنا ع الميل الخاص بنا ودائما سعداء بآرائكم ...", style: TextStyle(fontSize: 20)),
                          SizedBox(height: 50)
                        ],
                      ),
                    ),
                  ),
              )
              ),
        ),
      ),
    );
  }
}
