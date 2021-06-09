import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uygulama/UtilsApi/location.dart';
import 'package:uygulama/UtilsApi/weather.dart';

import 'Weather_Screen.dart';
class LoadingScreen extends StatefulWidget{
  @override
  _LoadingScreenState createState() =>_LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen>{
  @override
  LocationHelper locationData;
  Future<void> getLocationData() async{
    locationData=LocationHelper();
    await locationData.getCurrentLocation();
    if(locationData.longitude==null || locationData.latitude==null){
      print("konum bilgisi gelmiyor");
    }
    else{
      print("latitude"+locationData.latitude.toString());
      print("longitude"+locationData.longitude.toString());
    }
  }
  void getWeatherData() async{
    await getLocationData();
    WeatherData weatherData=WeatherData(locationData:locationData);
    await weatherData.getCurrentTemperatures();
    if(weatherData.currentTemperature==null || weatherData.currentCondition==null){
      print("apı den durum gelmiyor");
    }
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
      return WeatherScreen(weatherData: weatherData,);
    }));
  }
  @override
  void initState(){
    super.initState();
    getWeatherData();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:ThemeData.dark(),
        home:Scaffold(
          body:Container(
              decoration:BoxDecoration(
                  gradient:LinearGradient(
                      begin:Alignment.topLeft,
                      end:Alignment.bottomRight,
                      colors:[Colors.green,Colors.yellow]
                  )
              ) ,
              child:Center(
                  child:SpinKitCubeGrid(
                    color:Colors.white,
                    size:150.0,
                    duration: Duration(milliseconds:1200),
                  )
              )
          ),
        )
    );
  }
}