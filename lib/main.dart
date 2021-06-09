import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}
class MyAppState extends State{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LoginPage()
    );
  }
}
