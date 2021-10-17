import 'package:flutter/material.dart';


import 'package:splashscreen/splashscreen.dart';


class spb extends StatefulWidget {

  @override
  _spbState createState() => _spbState();
}

class _spbState extends State<spb> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(
          seconds: 4,
          backgroundColor: Colors.amber,
        ),
      ),

    );
  }
}
