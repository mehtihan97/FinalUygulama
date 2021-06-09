import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:uygulama/Screens/user_List.dart';



class InformationScreens extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InformationScreensState();
  }
}

class InformationScreensState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 35),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
            backgroundColor: Colors.green,
            title: Text("BİLGİLEDİRME",
                style: TextStyle(fontSize: 35, letterSpacing: 0.5)),
          ),
          body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              child: Marquee(
                text: "SATIN ALMAK İÇİN LÜTFEN DEVAM EDİN..!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 100,
                  color: Colors.green,
                ),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                blankSpace: 20.0,
                velocity: 100.0,
                pauseAfterRound: Duration(seconds: 0),
                showFadingOnlyWhenScrolling: true,
                fadingEdgeStartFraction: 0.1,
                fadingEdgeEndFraction: 0.1,
                numberOfRounds: 3,
                startPadding: 10.0,
                accelerationDuration: Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ),
            ),
            Flexible(
                fit: FlexFit.tight,
                flex: 7,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => HomePages()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.navigate_next,
                          size: 35,
                        ),
                        SizedBox(width: 5.0),
                        Center(
                          child: Text(
                            "SATIN AL",
                            style: TextStyle(fontSize: 25),
                          ),
                        )
                      ],
                    )))
          ]),
        ));
  }
}