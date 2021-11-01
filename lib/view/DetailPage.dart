import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterquran/models/Ayat.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:html/parser.dart';

class DetailPage extends StatefulWidget{
  final int number;
  DetailPage(this.number);
  @override
  DetailPageState createState() => DetailPageState(number);
}

class DetailPageState extends State<DetailPage> {

  int number;
  DetailPageState(this.number);
  
  
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  Duration duration = new Duration();
  Duration position = new Duration();
  bool playing = false;


  Future<List<Ayat>> getAyat() async {
    var data = await http.get("https://equran.id/api/surat/" + "$number");
    var jsonData = json.decode(data.body)['ayat'];
    List<Ayat> users = [];
    for(var u in jsonData){
      Ayat user = Ayat(u["id"], u["surah"], u["ar"], u["tr"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  void initState() {
    super.initState();
    this.getAyat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Bacaan Surah'),
            centerTitle: true,
          ),
        body: Container(
          height: 600.0,
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              Expanded(
                child:  FutureBuilder<List<dynamic>>(
                  future: getAyat(),
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                          padding: EdgeInsets.all(8),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index){
                            final givenString = snapshot.data[index].tr;
                            final tindis = parse(givenString).documentElement.text;
                            return Card(
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text(snapshot.data[index].ar),
                                    subtitle: Text(tindis),
                                  ),
                                ],
                              ),
                            );
                          }
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    slider(),
                    InkWell(
                      onTap: (){
                        getAudio();
                      },
                      child: Icon(
                        playing == false ?
                            Icons.play_circle_outline : Icons.pause_circle_outline,
                            size: 100,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ),
    );
  }

  Widget slider(){
    return Slider.adaptive(
        min: 0.0,
        value: position.inSeconds.toDouble(),
        max: duration.inSeconds.toDouble(),
        onChanged: (double value){
          setState(() {
            audioPlayer.seek(new Duration(seconds: value.toInt()));
          });
        }
    );
  }

  void getAudio() async {
    String oke = "https://equran.id/content/audio/001.mp3";
    if(playing){
      var res = await audioPlayer.pause;
      if(res == 1){
        playing = false;
        print("sudah");
      }
    } else {
      var res = await audioPlayer.play(oke, volume: 10);
      if(res == 1){
        playing = true;
      }
    }

    audioPlayer.onDurationChanged.listen((Duration duration) {
        setState(() {
          duration = duration;
        });
    });

    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });

  }


}

