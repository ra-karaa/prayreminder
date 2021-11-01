import 'package:flutter/material.dart';
import 'package:flutterquran/models/Kota.dart';
import 'package:flutterquran/service/ServiceKota.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class KotaPage extends StatefulWidget{
  @override
  _KotaState createState() => new _KotaState();
}

class _KotaState extends State<KotaPage>{

  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Kota'),
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
                future: ServiceKota.getKota(),
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
                                    title: Text(snapshot.data[index].nama),
                                      onTap: (){
                                        print(snapshot.data[index].nama);
                                      }
                                  ),
                                ],
                              ),
                            );
                          } else if(snapshot.data[index].nama
                              .toLowerCase()
                              .contains(editingController.text)) {
                            return Card(
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text(snapshot.data[index].nama),
                                      onTap: (){
                                        print(snapshot.data[index].nama);
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