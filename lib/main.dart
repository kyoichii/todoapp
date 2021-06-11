import 'dart:async';
import 'Onbording.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget{
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomepage>{
  @override
  //ウィジェットが作成されたタイミングで処理
  void initState(){
    Timer(Duration(seconds: 3), openOnBoard);
    super.initState();
  }


  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/image/aking.png')
            )
          ),
        ),
      ),
    );
  }
  void openOnBoard(){
    //Onbording()に移る　=> Onbording.dartに記載
    Navigator.push(context, MaterialPageRoute(builder: (context) => Onbording()));
  }

}