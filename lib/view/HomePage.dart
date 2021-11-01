import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterquran/view/KotaPage.dart';
import 'package:flutterquran/view/Surah.dart';

class HomePage extends StatefulWidget{
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage>{
  String nama = "Fietra Prabaskara";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.menu, color: Colors.white,size: 52.0,),
                      Image.asset("assets/img/image.png",width: 52.0,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Welcome, $nama",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Wrap(
                      spacing:20,
                      runSpacing: 20.0,
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SurahPage()));
                          },
                          child:  SizedBox(
                            width:160.0,
                            height: 160.0,
                            child: Card(
                              color: Color.fromARGB(255,21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              child:Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset("assets/img/todo.png",width: 64.0,),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "List Surah",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            print("tafsir");
                          },
                          child: SizedBox(
                            width:160.0,
                            height: 160.0,
                            child: Card(
                              color: Color.fromARGB(255,21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              child:Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset("assets/img/note.png",width: 64.0,),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Tafsir",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),

                                      ],
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => KotaPage()));
                          },
                          child: SizedBox(
                            width:160.0,
                            height: 160.0,
                            child: Card(
                              color: Color.fromARGB(255,21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              child:Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset("assets/img/calendar.png",width: 64.0,),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Sholat",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            print("setting");
                          },
                          child: SizedBox(
                            width:160.0,
                            height: 160.0,
                            child: Card(

                              color: Color.fromARGB(255,21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              child:Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset("assets/img/settings.png",width: 64.0,),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Settings",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
        )
    );
  }
}