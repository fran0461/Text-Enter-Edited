import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'add_image.dart';
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

  Future<File> imageFile;

  pickImageFromGallery(ImageSource source){
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget showImage(){
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot){
        if(snapshot.connectionState == ConnectionState.done &&
            snapshot.data !=null){
          return Image.file(
            snapshot.data,
            width: 200,
            height: 200,
          );
        }else if(snapshot.error != null){
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        }else{
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title:widget.title,),
        body: new Column(
          children: <Widget>[
            new TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
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
            new Text("\n\n $value"),
            showImage(),
            RaisedButton(
                child: Text("Select Image from Gallery"),
                onPressed: (){
                  pickImageFromGallery(ImageSource.gallery);
                }
            ),
          ],
        ),
      ),
    );
  }
}
