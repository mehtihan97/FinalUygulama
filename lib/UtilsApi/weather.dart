import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'location.dart';
const apiKey="474ffe072620b42473bd7c0c960159e9";
class WeatherDisplayData{
  Icon weatherIcon;
  AssetImage weatherImage;
  WeatherDisplayData({@required this.weatherIcon,this.weatherImage});
}
class WeatherData{
  WeatherData({@required this.locationData});
  LocationHelper locationData;
  double currentTemperature;
  int currentCondition;

  Future<void> getCurrentTemperatures() async{
    Response response= await get(Uri.parse("http://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}&units=metric"));
    if(response.statusCode==200){
      String data=response.body;
      var currentWeather=jsonDecode(data);
      try{
        currentTemperature=currentWeather['main']['temp'];
        currentCondition=currentWeather['weather'][0]['id'];
      }catch(e){
        print(e);
      }
    }
    else{
      print("apiden veri gelmiyor");
    }
  }
  WeatherDisplayData getWeatherDisplayData(){
    if(currentCondition<600){
      return WeatherDisplayData(
          weatherIcon:Icon(
              FontAwesomeIcons.cloud,
              size:75.0,
              color:Colors.white
          ),
          weatherImage:AssetImage('assets/bulutlu.jpg')
      );
    }else{
      var now=new DateTime.now();
      if(now.hour>=19){
        return WeatherDisplayData(
            weatherIcon:Icon(
                FontAwesomeIcons.moon,
                size:75.0,
                color:Colors.white
            ),
            weatherImage:AssetImage('assets/aksam.jpg')
        );
      }else{
        return WeatherDisplayData(
            weatherIcon:Icon(
                FontAwesomeIcons.sun,
                size:75.0,
                color:Colors.white
            ),
            weatherImage:AssetImage('assets/gunduz.jpg')
        );
      }
    }
  }
}