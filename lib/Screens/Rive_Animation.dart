import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uygulama/Screens/HomeScreen.dart';

import 'Grafic_Screen.dart';
class Animations extends StatefulWidget {

  @override
  _AnimationsState createState() => _AnimationsState();
}
class _AnimationsState extends State<Animations> with TickerProviderStateMixin {
  bool _isPlaying = false;
  AnimationController _animationController;
  Animation<double> _pulseAnimation;

  void animate() {
    if (_isPlaying)
      _animationController.stop();
    else
      _animationController.forward();

    setState(() {
      _isPlaying =!_isPlaying;
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));

    _pulseAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        _animationController.reverse();
      else if (status == AnimationStatus.dismissed)
        _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor:Colors.lightGreenAccent ,
        title: Text("",style:TextStyle(color:Colors.green,fontSize:40 ) ,),
        actions: [
          IconButton(
            icon: Icon(Icons.home, size:40,color:Colors.green),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>LoginPage()));
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.map, size:40,color:Colors.green),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>Grafic()));
            },
          ),
        ],
        ),
      body: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ScaleTransition(
                  scale: _pulseAnimation,
                  child: Container(
                    child: Image.asset('Animation/orman.png'),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text('Daha yeşil bir dünya',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        letterSpacing: 2)),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: animate,
        backgroundColor:Colors.lightGreen ,
        tooltip: 'Increment',
        child: _isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
      ),
    );
  }
}