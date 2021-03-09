import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home.dart';

//async
void main()  {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  //runApp(MaterialApp(
   // home: MyApp(),
   // debugShowCheckedModeBanner: false,
 // ));
  runApp(new MyApp(
    title: new Text("My App"), someText: new Text("Some Text..."),));
}

class MyApp extends StatefulWidget {
  MyApp({this.title,this.someText});
  final Widget title,someText;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController eCtrl = new TextEditingController();
  String value = "";
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
      appBar: new AppBar(title:widget.title,),
        body: new Column(
          children: <Widget>[
            //widget.someText,
            new TextField(
              controller: eCtrl,
              decoration: new InputDecoration.collapsed(hintText: "ADD SOMETHING"),

              onChanged: (String text){
               setState(() {
                 //value = text;
               });
              },
              onSubmitted: (String text){
                setState(() {
                  value = text;
                });
                eCtrl.clear();
              },
            ),
            new Text("\n\n $value")
          ],
        ),
      ),
      );
    //return HomePage();
  }
}
