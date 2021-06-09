import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
class FileManager {
  Future<String> get DosyaKonumu async{
    final konum=await getApplicationDocumentsDirectory();
    return konum.path;
  }
  Future<File> get yerelDosya async{
    final yol =await DosyaKonumu;
    return File("$yol/YorumDosya");
  }
  Future<String> DosyaOku() async{
    try{
      final dosya=await yerelDosya;
      String icerik= await dosya.readAsString();
      return icerik;
    }catch(error){
      return "Dosya okunurken hata.$error";
    }
  }
  Future<File> DosyaYaz(String metin) async{
    final dosya =await yerelDosya;
    return dosya.writeAsString("$metin");
  }
}