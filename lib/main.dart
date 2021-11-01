import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterquran/view/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Al - Quran',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomeScreen extends StatefulWidget{
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<WelcomeScreen>{
  @override
  Widget build(BuildContext context) {
    String asset = "assets/img/logo.png";
    var size = MediaQuery.of(context).size;
    return SplashScreen.callback(
        name: asset,
        onSuccess: (_){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
    },
        onError: (e,s){},
        height: size.height,
        startAnimation: '0',
        endAnimation: '4',
        loopAnimation: 'Untitled',
        backgroundColor: Colors.white,
        until: () => Future.delayed(Duration(milliseconds: 4)),
    );
  }
}