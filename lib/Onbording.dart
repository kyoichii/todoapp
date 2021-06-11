import 'package:flutter/material.dart';

class Onbording extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: onbording(),
    );
  }
}

class onbording extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<onbording> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}






