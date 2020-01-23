import 'package:DelivrEcrous/panierData.dart';
import 'package:flutter/material.dart';
import 'package:DelivrEcrous/data.dart';
import 'package:DelivrEcrous/panierScreen.dart';
import 'package:scoped_model/scoped_model.dart';

class DetailScreen extends StatelessWidget {
  final Produit produit;
  // int count = 1;

  DetailScreen({Key key, @required this.produit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int id = produit.id;
    return ScopedModelDescendant<PanierData>(
        builder: (BuildContext context, Widget child, PanierData model) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(38, 34, 107, 1.0),
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
                        Navigator.of(context).pop();
                      }),
                  Container(
                    width: 80.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.shopping_basket),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PanierScreen()),
                                  );
                                }),
                            Positioned(
                              top: 0.0,
                              right: 0.0,
                              child: Icon(
                                Icons.brightness_1,
                                size: 25.0, 
                                color: Colors.red
                              )
                            ),
                            Positioned(
                                top: 4.0,
                                right: 8.0,
                                child: Center(
                                  child: Text(
                                    model.produits.length.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 85,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Hero(
                    tag: produit.imgPath,
                    child: Image.asset(produit.imgPath, width: 250.0, height: 250.0),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      produit.name,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      produit.price.toString()+ " €",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(61, 56, 160, 1.0)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text(produit.description,
                        style: TextStyle(fontSize: 16)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(40))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.remove),
                            iconSize: 20,
                            color: Colors.white,
                            onPressed: () {
                              model.decrementQuantite(id);
                            },
                          ),
                        ),
                        Text(
                          model.getQuantiteByProduit(id),
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.add),
                            iconSize: 20,
                            color: Colors.white,
                            onPressed: () {
                              model.addProduit(produit);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0)
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
