import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uygulama/Screens/AppleTree.dart';

class CommentR extends StatefulWidget {
  String v;
  CommentR(this.v);
  @override
  _CommentRS createState() => _CommentRS();
}

class _CommentRS extends State<CommentR> {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.shoppingBasket, size: 35),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>ATree()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.arrow_back, size: 35),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
              title: Text(
                "Yorum Oku",
                style: TextStyle(fontSize: 35.0),
              ),
              backgroundColor: Colors.green,
            ),
            body: Center(
              child: Container(
                width: MediaQuery.of(context).size.height*.7,
                height: MediaQuery.of(context).size.height*.85,
                decoration:BoxDecoration(
                  color:Colors.green,
                  borderRadius:BorderRadius.all(Radius.circular(20))
                ) ,
                child:Center(
                  child:Text( widget.v,style:TextStyle(fontSize:25,letterSpacing: 0.5,color:Colors.black)
                ) ,
              ),
              ))));
  }
}
