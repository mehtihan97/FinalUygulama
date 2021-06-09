import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uygulama/Screens/singin.dart';
import 'About.dart';
import 'Loading_Screens.dart';
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                centerTitle:true,
                title: Text(
                  "WELCOME",
                  style: TextStyle(letterSpacing: 1.5, fontSize: 35),
                ),
                backgroundColor: Colors.green,
                actions: [
                  IconButton(
                    icon: Icon(Icons.description, size: 35),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutC()));
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.sun,color:Colors.yellow, size: 35),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadingScreen()));
                    },
                  ),
                ]
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: CircleAvatar(
                      radius: 200,
                      backgroundImage: AssetImage(
                          "assets/anasayfa.jpg"),
                    )),
                Container(
                    height:100,
                    width:200,
                    child: ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        child: Text(
                          "LOGİN",
                          style: TextStyle(
                              fontSize: 20.0,
                              letterSpacing: 1.5,
                              color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SingUp()),
                          );
                        }))
              ],
            )));
  }
}
