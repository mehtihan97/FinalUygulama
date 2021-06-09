import 'package:location/location.dart';
import'package:async/async.dart';
class LocationHelper{
  double latitude;
  double longitude;
  Future<void> getCurrentLocation() async{
    Location location=Location();

    bool _serviceEnable;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnable=await location.serviceEnabled();
    if(!_serviceEnable){
      _serviceEnable=await location.requestService();
      if(!_serviceEnable){
        return;
      }
    }

    _permissionGranted=await location.hasPermission();
    if(_permissionGranted==PermissionStatus.denied){
      _permissionGranted=await location.requestPermission();
      if(_permissionGranted!=PermissionStatus.granted){
        return;
      }
    }

    //izinler tamam ise
    _locationData=await location.getLocation();
    latitude=_locationData.latitude;
    longitude=_locationData.longitude;

  }
}