import 'package:flutterquran/models/Kota.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServiceKota{

  static Future<List<Kota>> getKota() async {
    var data = await http.get("https://api.banghasan.com/sholat/format/json/kota");
    var jsonData = json.decode(data.body)['kota'];
    List<Kota> city = [];
    for(var u in jsonData){
      Kota kota = Kota(u["id"], u["nama"]);
      city.add(kota);
    }
    print(city.length);
    return city;
  }
}