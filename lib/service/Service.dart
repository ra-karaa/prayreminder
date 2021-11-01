import 'package:flutterquran/models/Surah.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class Service{

   static Future<List<Surah>> getSurah() async {
    var data = await http.get("https://equran.id/api/surat");
    var jsonData = jsonDecode(data.body);
    List<Surah> users = [];
    for(var u in jsonData){
      Surah user = Surah(u["nomor"], u["nama_latin"], u["jumlah_ayat"], u["arti"], u["deskripsi"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }
}