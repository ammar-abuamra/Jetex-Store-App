import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/Screens/LoginScreen.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/homepage.dart';



class SpalshScreen extends StatefulWidget {

  @override
  _SpalshScreenState createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {

  void initState(){
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: SecondryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height* .7,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/image/cheetah.png')),
            SizedBox(height: 3,),
            Container(

              child: Text('JETTAEX STORE',style: TextStyle(color: PrimaryColor,fontSize: 30,fontWeight: FontWeight.bold),),
            )

          ],
        ),
      ),
    );
  }
}
  