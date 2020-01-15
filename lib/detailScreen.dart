import 'package:flutter/material.dart';
import 'package:TPDeveloppementMobile/data.dart';

class DetailScreen extends StatelessWidget {

  final Produit produit;

  DetailScreen({Key key, @required this.produit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                ),
                Container(
                  width: 135.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.shopping_basket),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            )
          ),
          Padding(
            padding: EdgeInsets.only(left: 160.0),
            child: Row(
              children: <Widget>[
                Image(
                  image: AssetImage(produit.imgPath),
                  fit: BoxFit.cover,
                  height: 75.0,
                  width: 75.0
                ),
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
                    child: ListView(
                      children: [
                        _listItem('assets/images/ecrou-borgne-hexagonal.png', 'Ecrou Borgne Hexagonal', '6.25 €'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _listItem(String imgPath, String name, String price){
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
      child: InkWell(
        onTap: () {

        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          produit.name,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                          ),
                        ), 
                      // Container(
                      //   child: Row(
                      //     children: <Widget>[
                      //       Flexible(
                      //         child: Text(
                      //           produit.description,
                      //           overflow: TextOverflow.clip,
                      //           softWrap: true,
                      //           maxLines: 20,
                      //           style: TextStyle(
                      //             fontSize: 16.0,
                      //             fontWeight: FontWeight.bold
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   )
                      // ),
                      Text(
                        produit.price,
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
              icon: Icon(Icons.clear),
              color: Colors.red,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}