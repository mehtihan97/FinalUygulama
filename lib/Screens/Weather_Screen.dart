import 'package:flutter/material.dart';
import 'package:uygulama/Screens/HomeScreen.dart';
import 'package:uygulama/UtilsApi/weather.dart';
class WeatherScreen extends StatefulWidget{
  final WeatherData weatherData;
  WeatherScreen({@required this.weatherData});
  @override
  _WeatherScreenState createState() =>_WeatherScreenState();
}
class _WeatherScreenState extends State<WeatherScreen> {
  int temperature;
  Icon weatherDisplay;
  AssetImage backgroundImage;
  void updateDisplayInfo(WeatherData weatherData){
    setState(() {
      temperature=weatherData.currentTemperature.round();
      WeatherDisplayData weatherDisplayData=weatherData.getWeatherDisplayData();
      backgroundImage=weatherDisplayData.weatherImage;
      weatherDisplay=weatherDisplayData.weatherIcon;
    });
  }
  @override
  void initState() {
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          body:InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage()));
            },
            child: Container(
                constraints: BoxConstraints.expand(),
                decoration:BoxDecoration(
                    image:DecorationImage(
                      image:backgroundImage,
                      fit:BoxFit.cover,
                    )
                ) ,
                child:Column(
                  crossAxisAlignment:CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 40,),
                    Container(
                      child: weatherDisplay,
                    ),
                    SizedBox(height:15,),
                    Center(
                      child:Text('$temperature°',style:TextStyle(
                        color:Colors.white,
                        fontSize:80.0,
                        letterSpacing:-5,
                      )) ,
                    )
                  ],
                ) ,
              ),
          ),

      );
  }
}