import 'package:TPDeveloppementMobile/panierData.dart';
import 'package:flutter/material.dart';
import 'package:TPDeveloppementMobile/data.dart';
import 'package:TPDeveloppementMobile/panierScreen.dart';
import 'package:scoped_model/scoped_model.dart';

class DetailScreen extends StatelessWidget {

  final Produit produit;
  int count = 1;

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
						  }
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
				  Stack(children: [
					Container(
					  height: MediaQuery.of(context).size.height - 86.5,
					  width: MediaQuery.of(context).size.width,
					  color: Colors.transparent),
					Positioned(
					  top: 45.0,
					  child: Container(
						decoration: BoxDecoration(
							borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0),),
							color: Colors.white),
						height: MediaQuery.of(context).size.height - 130.0,
						width: MediaQuery.of(context).size.width)),
					Positioned(
					  top: 0.0,
					  left: (MediaQuery.of(context).size.width / 2) - 100.0,
					  child: Hero(
						tag: produit.imgPath,
						child: Container(
							decoration: BoxDecoration(
								image: DecorationImage(
									image: AssetImage(produit.imgPath),
									fit: BoxFit.cover)),
							height: 200.0,
							width: 200.0))),
					Positioned(
						top: 220.0,
						left: 25.0,
						right: 25.0,
						child: Column(
						  crossAxisAlignment: CrossAxisAlignment.start,
						  children: <Widget>[
							Text(produit.name,
								style: TextStyle(
									fontFamily: 'Montserrat',
									fontSize: 22.0,
									fontWeight: FontWeight.bold)),
							SizedBox(height: 20.0),
							Row(
							  mainAxisAlignment: MainAxisAlignment.spaceBetween,
							  children: <Widget>[
								Text(produit.price,
									style: TextStyle(
										fontFamily: 'Montserrat',
										fontSize: 20.0,
										color: Color.fromRGBO(61, 56, 160, 1.0))),
							  ],
							),
							SizedBox(height: 20.0),
							Container(
							  width: 350,
							  height: 220.0,
							  child:
								Text(
								  produit.description,
								  textAlign: TextAlign.justify,
								  style: TextStyle(
									fontSize: 16.0,
									fontWeight: FontWeight.bold
								  ),
								),
							),
							SizedBox(height: 60.0),
							  Padding(
								padding: EdgeInsets.only(bottom:0.0),
                child: Container(
								  width: 500.0,
								  height: 50.0,
								  decoration: BoxDecoration(
									  borderRadius: BorderRadius.circular(50.0),
									  color: Colors.black),
								  child: Row(
									mainAxisAlignment: MainAxisAlignment.spaceEvenly,
									children: <Widget>[
										Container(
										  height: 45.0,
										  width: 55.0,
										  child: Center(
											child: 
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 25.0,
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
										  width: 55.0,
										  child: Center(
											child: 
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        onPressed: () {
                          model.addProduit(produit); // incremente le compteur si deja ajoute
                        },
                      ),
										  ),
										)
									],
								  ),
								)
							  )
						  ],
						))
						])
				],
			  ),
			);
      }
    );

    
  }

  int _incrementation(){
    return count++;
  }
}