import 'package:flutter/material.dart';
import 'package:jettaexstores/homepage.dart';
import 'package:jettaexstores/widget.dart';

class InfoScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBar,
      bottomNavigationBar: CbottomNavigationBar,
      body: Center(
        child: Text('Info Screen',style: TextStyle(color: Colors.amber,fontSize: 35,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
