import 'package:flutter/material.dart';
import 'package:DelivrEcrous/homeScreen.dart';
import 'package:DelivrEcrous/panierData.dart';
import 'package:scoped_model/scoped_model.dart'; 

void main() => runApp(Main());

class Main extends StatelessWidget {
  final PanierData _model = PanierData();

  
  @override
  Widget build(BuildContext context) {
    return ScopedModel<PanierData>(
      model: _model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Montserrat'),
        home: HomeScreen(),
      )       
    );
  }
}
