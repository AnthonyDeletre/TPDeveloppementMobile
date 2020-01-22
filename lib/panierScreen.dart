import 'package:DelivrEcrous/data.dart';
import 'package:DelivrEcrous/homeScreen.dart';
import 'package:DelivrEcrous/panierData.dart';
import 'package:DelivrEcrous/FormScreen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class PanierScreen extends StatefulWidget {
  @override
  _PanierScreenState createState() => _PanierScreenState();
}

class _PanierScreenState extends State<PanierScreen> {

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
              IconButton(
                icon: Icon(Icons.home),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                }
              ),
              Container(
                width: 80.0,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Icon(
                        Icons.brightness_1,
                        color: Colors.red,
                        size: 30
                      ),
                      Positioned(
                        top: 5.0,
                        right: 11.0,
                        child: Center(
                          child: Text(
                            model.produits.length.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ),
                    ],
                  )
                ],
                ),
              )
              ],
            )
            ),
            Center(
            // padding: EdgeInsets.only(left: 80.0),
            child: Text('Panier',
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
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0))
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 25.0, right: 20.0),
                children: <Widget>[
                model.produits.length == 0 ? 
                Padding(
                  padding: EdgeInsets.only(top: 0.1),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height - 148.0,
                        child: ListView(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image(
                              image: AssetImage('assets/images/empty.png'),
                              fit: BoxFit.cover,
                              height: 430.0,
                              width: 430.0
                            ),
                            Center(
                              //padding: EdgeInsets.only(left: 0.0),
                              child : Text(
                                "Votre panier est vide !",
                                style: TextStyle(
                                  color: Color.fromRGBO(61, 56, 160, 1.0),
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ),
                            SizedBox(height: 100.0),
                            Container(
                            width: 570.0,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
                                color: Color.fromRGBO(61, 56, 160, 1.0)
                                ),
                                height: 50.0,
                                child: Center(
                                  child: Text(
                                    'Retour à vos achats',
                                    style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    )
                                  ),
                                ),
                              ),
                            )
                          )
                          ]
                        )
                      )
                    ],
                  )
                )
                :
                Padding(
                  padding: EdgeInsets.only(top: 0.1),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Container(
                        height: MediaQuery.of(context).size.height - 148.0,
                        child: 
                          ListView.builder(
                            itemCount: model.produits.length,
                            itemBuilder: (context, index) {
                            return _listItem(context, index, model);            
                            },
                          )
                        ),
                      ),
                      Positioned(
					              top: 570.0,
                        width: 360.0,
                        child: InkWell(
                           onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FormScreen()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
                            color: Color.fromRGBO(61, 56, 160, 1.0)
                            ),
                            height: 50.0,
                            child: Center(
                              child: Text(
                                'Valider votre panier',
                                style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                )
                              ),
                            ),
                          ),
                        )
                      )
                    ],
                  )
                )
                ],
              ),
            ),
          ],
          ),
			);
      }
    );

    
  }

  Widget _listItem(BuildContext context, int index, PanierData model){
    ProduitPanier pp = model.produits[index];

    String imgPath = pp.produit.imgPath; 
    String name = pp.produit.name; 
    String price = pp.produit.price;
    int id = pp.produit.id;

    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(flex: 3,
            child: 
              Container(
              child: Row(
                children: [
                  Hero(
                    tag: imgPath, 
                    child: Image(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                      height: 75.0,
                      width: 75.0
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(flex: 1,
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromRGBO(61, 56, 160, 1.0),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: 200.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.black),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 45.0,
                            width: 35.0,
                            child: Center(
                            child: 
                            IconButton(
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              onPressed: () {
                                model.decrementQuantite(id);
                              },
                            ),
                            ),
                          ),
                          Text(
                            model.getQuantiteByProduit(id),
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 15.0)),
                          Container(
                            height: 45.0,
                            width: 35.0,
                            child: Center(
                            child: 
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              onPressed: () {
                                model.addProduit(pp.produit); // incremente le compteur si deja ajoute
                              },
                            ),
                            ),
                          )
                        ],
                        ),
                      )
                    ],
                  ),
                  )     
                ],
              ),
            ),
            ),
            Expanded(flex: 1,
            child: IconButton(
              icon: Icon(Icons.clear),
              color: Colors.red,
              onPressed: () {
                model.deleteProduit(id);
              },
            ))
          ],
        ),
    );
  }
}