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
            Padding(
                padding: EdgeInsets.only(top: 15.0, left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(left: 130.0),
              child: Row(
                children: <Widget>[
                  Text('Commande',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              height: MediaQuery.of(context).size.height - 148.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0))),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 25.0, right: 20.0),
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 0.1),
                      child: Column(
                        children: <Widget>[
                          Container(
                              //height: MediaQuery.of(context).size.height - 148.0,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                Image(
                                    image: AssetImage(
                                        'assets/images/delivery.png'),
                                    fit: BoxFit.cover,
                                    height: 430.0,
                                    width: 430.0),
                                Padding(
                                    padding: EdgeInsets.only(left: 40.0),
                                    child: Text(
                                      "Commande envoyée !",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(61, 56, 160, 1.0),
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 25.0, top: 10.0),
                                  child: Container(
                                    width: 300,
                                    height: 100.0,
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
                                    width: 570.0,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen()),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30.0),
                                                topRight: Radius.circular(30.0),
                                                bottomLeft:
                                                    Radius.circular(30.0),
                                                bottomRight:
                                                    Radius.circular(30.0)),
                                            color: Color.fromRGBO(
                                                61, 56, 160, 1.0)),
                                        height: 50.0,
                                        child: Center(
                                          child: Text('Retour à vos achats',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Montserrat',
                                              )),
                                        ),
                                      ),
                                    )),
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
