import 'package:flutter/material.dart';
import 'package:uygulama/Products/Product.dart';
import 'CherryTree.dart';
class Cheryy extends StatelessWidget{
  Product product3 =new Product(
      "KİRAZ AĞACI",
      "Kiraz ince dokulu, sert sıkı bir ağaçtır. Zor yarılır. Rahat ve kolay işlenir. Fiziki etkilere dayanımı zayıftır. Rendelendiğinde düzgün ve parlak bir yüzey verir. kururken çok çeker. Açık havada dayanıklı değildir. Uygunsuz koşullarda kısa sürede bozulur. Böcekler ve mikroorganizmalar tarafından kolayca yıkımlanır.l Gevrektir. Çivi, vida ve tutkalla bağlantı kurma yeteneği iyidir. İyi pedal edilebilir. İyi boyanır ve iyi verniklenir."
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
                    child:Text(product3.name,style:TextStyle(
                        fontSize:40,
                        letterSpacing:0.5,
                        color:(Colors.white)
                    ) ,)

                ),
                Container(
                    margin:EdgeInsets.only(left:7 ) ,
                    child:Text(product3.description,style:TextStyle(
                        fontSize:20,
                        letterSpacing:0.5,
                        color:(Colors.white)
                    ) ,)
                ),
                Container(
                  height:MediaQuery.of(context).size.height *0.1,
                  child:Text("ÜCRET ="+product3.price.toString()+" "+"YTL",style:TextStyle(
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
                        MaterialPageRoute(builder:(context)=>CTree())
                    );
                  },
                )

              ],
            )
        )
    );
  }

}