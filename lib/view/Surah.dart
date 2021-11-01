import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterquran/models/Surah.dart';
import 'package:flutterquran/service/Service.dart';
import 'package:flutterquran/view/DetailPage.dart';


class SurahPage extends StatefulWidget{
  @override
  SurahState createState() => SurahState();
}

class SurahState extends State<SurahPage>{

  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Surah'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child:  FutureBuilder<List<dynamic>>(
                future: Service.getSurah(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                        padding: EdgeInsets.all(8),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index){
                          if(editingController.text.isEmpty){
                            return Card(
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                      title: Text(snapshot.data[index].nama_latin),
                                      onTap: (){
                                        Navigator.push(context,
                                            new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index].nomor))
                                        );
                                      }
                                  ),
                                ],
                              ),
                            );
                          } else if(snapshot.data[index].nama_latin
                              .toLowerCase()
                              .contains(editingController.text)) {
                            return Card(
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                      title: Text(snapshot.data[index].nama_latin),
                                      onTap: (){
                                        Navigator.push(context,
                                            new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index].nomor))
                                        );
                                      }
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Container();
                          }
                        }
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
