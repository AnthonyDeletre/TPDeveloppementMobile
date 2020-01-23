import 'package:DelivrEcrous/panierData.dart';
import 'package:DelivrEcrous/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ValidationScreen extends StatefulWidget {
  @override
  _ValidationScreenState createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<PanierData>(
        builder: (BuildContext context, Widget child, PanierData model) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(61, 56, 160, 1.0),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30.0, bottom: 30),
              child: Center(
                child: Text('Commande',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 78.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0))),
              child: ListView(
                primary: false,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 0.1),
                      child: Column(
                        children: <Widget>[
                          Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                Image(
                                    image: AssetImage(
                                        'assets/images/delivery.png'),
                                    fit: BoxFit.cover,
                                    height: 350.0,
                                    width: 350.0),
                                Center(
                                    child: Text(
                                      "Commande envoyée !",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(61, 56, 160, 1.0),
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Center(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 10, bottom: 40, left: 15, right: 15),
                                    child: Text(
                                      "Votre commande vous sera envoyé dans les prochains jours",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 25, right: 25),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => HomeScreen()),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                        color: Color.fromRGBO(61, 56, 160, 1.0)),
                                      height: 50.0,
                                      child: Center(
                                        child: Text('Retour à vos achats',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Montserrat',
                                            )),
                                      ),
                                    ),
                                  )
                                ),
                                Container(
                                  height: 20,
                                )
                              ]))
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
