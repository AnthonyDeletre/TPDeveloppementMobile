import 'package:DelivrEcrous/panierData.dart';
import 'package:flutter/material.dart';
import 'package:DelivrEcrous/panierScreen.dart';
import 'package:DelivrEcrous/detailScreen.dart';
import 'package:DelivrEcrous/data.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScreen extends StatelessWidget {

  final List<Produit> produits = getListProduit();

  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant<PanierData>(
      builder: (BuildContext context, Widget child, PanierData model) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(61, 56, 160, 1.0),
          body: ListView(
          children: <Widget>[
            Padding(
            padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 0.0),
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
                          MaterialPageRoute(builder: (context) => PanierScreen()),
                          );
                        }
                      ),
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
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 25.0, fontFamily: "Montserrat"),
                  children: <TextSpan>[
                    TextSpan(text: "Delivr'"),
                    TextSpan(text: "Écrous", style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
                ),
              ),
            ),
            /*
            Padding(
            padding: EdgeInsets.only(left: 130.0),
            child: Row(
              children: <Widget>[
              Text('Delivr\'',
                style: TextStyle(
                color: Colors.white,
                fontSize: 25.0)),
              SizedBox(width: 2.0),
              Text('Écrous',
              // todo(faudra suppr le ! )
                style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0)),
              ],
            ),
            ),
            */
            SizedBox(height: 20.0),
            Container(
            height: MediaQuery.of(context).size.height - 138.0,
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
                height: MediaQuery.of(context).size.height - 138.0,
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

    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen(
              produit : produits[index]
              )),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 3,
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
                  Expanded(
                    flex: 1,
                    child: 
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
                              color: Color.fromRGBO(61, 56, 160, 1.0)
                            ),
                          ),
                      ],
                    )
                  )
                ],
              ),
            )
          ),
          Expanded(flex: 1,
          child: 
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.black,
              onPressed: () {
                model.addProduit(produits[index]);
              },
            ),
            )
          ],
        ),
      ),
    );
  }  
}


