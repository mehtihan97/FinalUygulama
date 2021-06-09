import 'package:flutter/material.dart';
import 'package:uygulama/File/File_Manager.dart';
import 'dart:async';
import 'dart:io';
import 'dart:core';

import 'package:uygulama/Screens/HomeScreen.dart';
import 'package:uygulama/Screens/CommentR.dart';
class AppComment extends StatefulWidget{
  final FileManager fileManager;

  const AppComment({Key key, this.fileManager}) : super(key: key);
  @override
  State<StatefulWidget> createState(){
    return _AppCommentState();
  }
}
class _AppCommentState extends State<AppComment>{
  final metinCtrl=TextEditingController();
  String veri;
  Future<File> veriKaydet() async{
    setState(() {
      veri=metinCtrl.text;
    });
    return widget.fileManager.DosyaYaz(veri);
  }
  void initState(){
    super.initState();
    widget.fileManager.DosyaOku().then((String deger){
      setState(() {
        veri=deger;
      });
    });
  }
  void dosyaOku(){
    widget.fileManager.DosyaOku().then((String deger){
      setState(() {
        veri=deger;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(backgroundColor:Colors.green ,title:Text("Yorum") ,
          actions: [
            IconButton(
              icon: Icon(Icons.home,size: 35),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },
            ),
          ]
      ) ,
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          TextField(
            decoration:InputDecoration(
                hintText:"Yorumu giriniz..!"
            ),
            controller:metinCtrl,
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Expanded(child:Padding(padding: EdgeInsets.all(0.8),
                  child:ElevatedButton(
                      onPressed:(){
                        veriKaydet();
                      },
                      child:Text(("YORUMU GÖNDER")),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                      )
                  )
              )
              ),
              Expanded(child:Padding(padding: EdgeInsets.all(0.8),
                  child:ElevatedButton(
                      onPressed:(){
                        dosyaOku();
                        Navigator.push(context,MaterialPageRoute(builder:(context)=>CommentR(veri)));
                       },
                      child:Text(("YORUMU OKU")),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                      )
                  )
              )
              ),

            ],
          ),
        ],
      ),
    );
  }

}