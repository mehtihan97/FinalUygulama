import 'package:flutter/material.dart';
import 'package:uygulama/Products/Product.dart';
import 'AppleTree.dart';
import 'CherryTree.dart';
import 'InformationScreen.dart';
import 'LemonTree.dart';
class Basket extends StatefulWidget {
  Product p1 = new Product.List("", 0, "");
  Basket(Product product) {
    this.p1.image = product.image;
    this.p1.price = product.price;
    this.p1.name = product.name;
  }
  @override
  State<StatefulWidget> createState() {
    return BasketState();
  }
}

class BasketState extends State<Basket> {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                centerTitle:true,
                backgroundColor: Colors.yellow,
                title: (Text("SEPET",
                    style: TextStyle(fontSize: 45, letterSpacing: 0.5)))),
            body: buildBody()));
  }

  Widget buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 150,
                      backgroundImage:AssetImage(widget.p1.image),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Text(
                          widget.p1.name + " " + "FİDANI",
                          style: TextStyle(
                              fontSize: 50,
                              letterSpacing: 0.5,
                              color: Colors.black),
                        )),
                    Text(widget.p1.price.toString() + " " + "TL",
                        style: TextStyle(fontSize: 40, color: Colors.black))
                  ],
                ),
              )),
        ),
        Row(children: <Widget>[
          Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.navigate_before),
                      SizedBox(width: 5.0),
                      Center(
                        child: Text(
                          "GERİ",
                          style: TextStyle(fontSize:20),
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    if (widget.p1.name == "ELMA") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ATree()));
                    }
                    else if(widget.p1.name=="LİMON"){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>LTree()));
                    }
                    else if(widget.p1.name=="KİRAZ"){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>CTree()));
                    }
                  }
              )),
          Flexible(
              fit: FlexFit.tight,
              flex: 4,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.done),
                    SizedBox(width: 5.0),
                    Center(
                      child: Text(
                        "SATIN AL",
                        style: TextStyle(fontSize: 25),
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>InformationScreens()));
                },
              )),
        ])
      ],
    );
  }
}
