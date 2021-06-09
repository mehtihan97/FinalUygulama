import 'package:flutter/material.dart';
import 'package:uygulama/Products/Product.dart';
import 'LemonTree.dart';
class Lemon extends StatelessWidget{
  Product product2 =new Product(
      "LİMON AĞACI",
      "Limon ağaçları, bakımları kolay ve evlerde bile yetiştirilebilen ağaçlardır. Ege ve Akdeniz bölgesinde oldukça fazla üretimi yapılan limonların ağaçlarından yılda 6 ila 10 kez hasat yapılabilmektedir"
      ,1);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
            backgroundColor:(Colors.green) ,
            body:Column(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height:MediaQuery.of(context).size.height *0.1 ,
                    child:Text(product2.name,style:TextStyle(
                        fontSize:40,
                        letterSpacing:0.5,
                        color:(Colors.white)
                    ) ,)

                ),
                Container(
                    margin:EdgeInsets.only(left:7 ) ,
                    child:Text(product2.description,style:TextStyle(
                        fontSize:25,
                        letterSpacing:0.5,
                        color:(Colors.white)
                    ) ,)
                ),
                Container(
                  height:MediaQuery.of(context).size.height *0.1 ,
                  child:Text("ÜCRET ="+product2.price.toString()+" "+"YTL",style:TextStyle(
                    fontSize:40,
                    letterSpacing:0.5,
                    color:(Colors.white),
                  ) ,) ,

                ),
                ElevatedButton( child:Text("Geri",style:TextStyle(color:Colors.black,fontSize:20) ,),
                  style:ElevatedButton.styleFrom(
                    primary: Colors.yellowAccent,
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context)=>LTree()),
                    );
                  },
                )

              ],
            )
        )
    );
  }

}