import 'package:TPDeveloppementMobile/panierData.dart';
import 'package:TPDeveloppementMobile/validationScreen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

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
                }
              ),
              ],
            )
            ),
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
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0))
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 25.0, right: 20.0),
                children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 0.1),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height - 148.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 30.0,top: 40.0),
                              child : Text(
                                "Où veux-tu te faire livrer ?",
                                style: TextStyle(
                                  color: Color.fromRGBO(61, 56, 160, 1.0),
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ),
                            SizedBox(height: 40.0),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Nom",
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(61, 56, 160, 1.0),
                                  fontSize: 20.0
                                )
                              ),
                            ),
                            SizedBox(height: 40.0),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(61, 56, 160, 1.0),
                                  fontSize: 20.0
                                )
                              ),
                            ),
                            SizedBox(height: 40.0),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Rue",
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(61, 56, 160, 1.0),
                                  fontSize: 20.0
                                )
                              ),
                            ),
                            SizedBox(height: 40.0),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Ville",
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(61, 56, 160, 1.0),
                                  fontSize: 20.0
                                )
                              ),
                            ),
                            SizedBox(height: 40.0),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Code Postal",
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(61, 56, 160, 1.0),
                                  fontSize: 20.0
                                )
                              ),
                            ),
                          ]
                        )
                      ),
                      Positioned(
					              top: 570.0,
                        width: 360.0,
                        child: InkWell(
                           onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ValidationScreen()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
                            color: Colors.green
                            ),
                            height: 50.0,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 13.0, right: 7.0),
                                      child: Center(
                                        child: Text(
                                          'Valider votre commande',
                                          style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          )
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Icon(
                                        Icons.done,
                                        color: Colors.white,
                                        size: 25
                                      )
                                    )
                                  ]
                                )
                              ],
                            )
                          ),
                        )
                      )
                    ],
                  )
                ),
                ],
              ),
            ),
          ],
          ),
			);
      }
    );
  }
}