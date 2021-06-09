import 'package:flutter/material.dart';
class AboutC extends StatefulWidget{
  _AboutCState createState()=>_AboutCState();
}
class _AboutCState extends State<AboutC>{
  Color color=Colors.black;
  double size=20;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(actions: [
              IconButton(
                icon: Icon(Icons.arrow_back, size:35),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
              backgroundColor: Colors.green,
              title: Text("HAKKINDA", style: TextStyle(color:Colors.white,fontSize:35)),),
            body: Center(child: GestureDetector(
              child: Text(
                "Bu uygulama DR.ÖĞRETİM ÜYESİ AHMET CEVAHİR ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 193301008 numaralı Muhammed Nehdihan Bayaroğulları tarafından 9 Haziran 2021 günü yapılmıştır. ",style:TextStyle(
                  fontSize:size,letterSpacing: 0.5,color:color
              ),),
              onDoubleTapCancel:(){
                setState(() {
                  color=Colors.blue;
                });
              },
              onDoubleTap:(){
                setState(() {
                  size=25;
                });
              },
              onLongPress:(){
                setState(() {
                  color=Colors.green;
                });
              },
              onTapCancel:(){
                setState(() {
                  color=Colors.black;
                  size=25;
                });
              },
            )
              ,))
    );
  }
}