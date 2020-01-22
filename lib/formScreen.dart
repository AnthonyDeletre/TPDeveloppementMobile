import 'package:DelivrEcrous/panierData.dart';
import 'package:DelivrEcrous/validationScreen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _nom = TextEditingController();
  final _email = TextEditingController();
  final _rue = TextEditingController();
  final _ville = TextEditingController();
  final _cp = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<PanierData>(
        builder: (BuildContext context, Widget child, PanierData model) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(61, 56, 160, 1.0),
        body: ListView(
          //scrollDirection: Axis.horizontal,
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
            Center(
              //padding: EdgeInsets.only(left: 130.0),
              child:
                  Text('Commande',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
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
                              //height: MediaQuery.of(context).size.height*0.5,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 30.0, top: 30.0),
                                    child: Text(
                                      "Où veux-tu te faire livrer ?",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(61, 56, 160, 1.0),
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  controller: _nom,
                                  decoration: InputDecoration(
                                    labelText: "Nom",
                                    labelStyle: TextStyle(
                                        color: Color.fromRGBO(61, 56, 160, 1.0),
                                        fontSize: 20.0),
                                    errorText: _validate
                                        ? 'Veuillez remplir ce champ'
                                        : null,
                                    fillColor: _validate ? Colors.red : null,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  controller: _email,
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    labelStyle: TextStyle(
                                        color: Color.fromRGBO(61, 56, 160, 1.0),
                                        fontSize: 20.0),
                                    errorText: _validate
                                        ? 'Veuillez remplir ce champ'
                                        : null,
                                    fillColor: _validate ? Colors.red : null,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  controller: _rue,
                                  decoration: InputDecoration(
                                    labelText: "Rue",
                                    labelStyle: TextStyle(
                                        color: Color.fromRGBO(61, 56, 160, 1.0),
                                        fontSize: 20.0),
                                    errorText: _validate
                                        ? 'Veuillez remplir ce champ'
                                        : null,
                                    fillColor: _validate ? Colors.red : null,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  controller: _ville,
                                  decoration: InputDecoration(
                                    labelText: "Ville",
                                    labelStyle: TextStyle(
                                        color: Color.fromRGBO(61, 56, 160, 1.0),
                                        fontSize: 20.0),
                                    errorText: _validate
                                        ? 'Veuillez remplir ce champ'
                                        : null,
                                    fillColor: _validate ? Colors.red : null,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  controller: _cp,
                                  decoration: InputDecoration(
                                    labelText: "Code Postal",
                                    labelStyle: TextStyle(
                                        color: Color.fromRGBO(61, 56, 160, 1.0),
                                        fontSize: 20.0),
                                    errorText: _validate
                                        ? 'Veuillez remplir ce champ'
                                        : null,
                                    fillColor: _validate ? Colors.red : null,
                                  ),
                                ),
                              ])),
                          Container(
                            height: 20,
                          ),
                          Container(
                              child: InkWell(
                            onTap: () {
                              if (_validation(_nom.text, _email.text, _rue.text,
                                      _ville.text, _cp.text) ==
                                  false) {
                                model.deleteAllProduit();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ValidationScreen()),
                                );
                              }
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0),
                                        bottomLeft: Radius.circular(30.0),
                                        bottomRight: Radius.circular(30.0)),
                                    color: Colors.green),
                                height: 50.0,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 13.0, right: 7.0),
                                            child: Center(
                                              child: Text(
                                                  'Valider votre commande',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Montserrat',
                                                  )),
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 10.0),
                                              child: Icon(Icons.done,
                                                  color: Colors.white,
                                                  size: 25))
                                        ])
                                  ],
                                )),
                          )),
                          Container(
                            height: 20,
                          )
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

  bool _validation(
      String _nom, String _email, String _rue, String _ville, String _cp) {
    setState(() {
      _nom.isEmpty ||
              _email.isEmpty ||
              _rue.isEmpty ||
              _ville.isEmpty ||
              _cp.isEmpty
          ? _validate = true
          : _validate = false;
    });

    return _validate;
  }
}
