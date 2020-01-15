import 'package:flutter/material.dart';
import 'package:TPDeveloppementMobile/homeScreen.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: HomeScreen(),
    );
  }
}
