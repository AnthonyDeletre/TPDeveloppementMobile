import 'package:TPDeveloppementMobile/data.dart';
import 'package:TPDeveloppementMobile/panierData.dart';
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
          backgroundColor: Color.fromRGBO(66, 66, 66, 1.0),
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
              )
              ],
            )
            ),
            Padding(
            padding: EdgeInsets.only(left: 160.0),
            child: Row(
              children: <Widget>[
              Text('Panier',
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
              )
              ],
            ),
            )
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
                  Column(
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
                          color: Colors.grey
                        ),
                      ),
                      // Text(
                      //   "Quantité: " + model.getQuantiteByProduit(id),
                      //   style: TextStyle(
                      //     fontSize: 16.0,
                      //     fontWeight: FontWeight.bold
                      //   ),
                      // )
                      SizedBox(height: 10.0),
                      Container(
                        width: 200.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Color.fromRGBO(66, 66, 66, 1.0)),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 45.0,
                            width: 35.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Color.fromRGBO(66, 66, 66, 1.0)),
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
                            //pp.quantite.toString(),
                            //count.toString(),
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
                  
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.clear),
              color: Colors.red,
              onPressed: () {
                print("yooo");
                model.deleteProduit(id);
              },
            ),
          ],
        ),
    );
  }
}