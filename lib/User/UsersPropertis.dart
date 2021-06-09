import 'package:flutter/cupertino.dart';

class User1 {
int id;
String username;
String telno;
String adres;
User1(this.username,this.adres,this.telno);
User1.withID(this.id,this.username, this.telno, this.adres);

User1.fromMap(dynamic o) {
this.id=o['id'];
this.username = o['username'];
this.telno =o['telno'];
this.adres =o['adres'];
}

Map<String, dynamic> toMap() {
  var map =Map<String,dynamic>();
  map['id']=this.id;
  map['username'] = this.username;
  map['telno'] = this.telno;
  map['adres'] = this.adres;

  return map;
}

}