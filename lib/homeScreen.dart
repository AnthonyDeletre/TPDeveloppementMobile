import 'package:TPDeveloppementMobile/panierData.dart';
import 'package:flutter/material.dart';
import 'package:TPDeveloppementMobile/panierScreen.dart';
import 'package:TPDeveloppementMobile/detailScreen.dart';
import 'package:TPDeveloppementMobile/data.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScreen extends StatelessWidget {

  final List<Produit> produits = getListProduit();

  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant<PanierData>(
      builder: (BuildContext context, Widget child, PanierData model) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(66, 123, 201, 1.0),
          body: ListView(
          children: <Widget>[
            Padding(
            padding: EdgeInsets.only(top: 15.0, left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Image(
                image: AssetImage('assets/images/UPHF.png'),
                fit: BoxFit.cover,
                height: 30.0,
                width: 85.0
              ),
              Container(
                width: 135.0,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                  icon: Icon(Icons.shopping_basket),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PanierScreen()),
                    );
                  }
                  ),
                ],
                ),
              )
              ],
            )
            ),
            Padding(
            padding: EdgeInsets.only(left: 120.0),
            child: Row(
              children: <Widget>[
              Text('Delivr\'',
                style: TextStyle(
                color: Colors.white,
                fontSize: 25.0)),
              SizedBox(width: 2.0),
              Text('Écriiious',
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
                  itemCount: produits.length,
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
      });
    
  }

  Widget _listItem(BuildContext context, int index, PanierData model){
    String imgPath = produits[index].imgPath; 
    String name = produits[index].name; 
    String price = produits[index].price;
    int id = produits[index].id;

    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen(produit : produits[index])),
          );
        },
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
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.black,
              onPressed: () {
                print("yyya");
                model.addProduit(produits[index]);

              },
            ),
          ],
        ),
      ),
    );
  }  
}


