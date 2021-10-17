import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show get;
import 'package:jettaexstores/Module/Info_Api.dart';
import 'package:jettaexstores/Module/OrderDataList.dart';
import 'package:jettaexstores/Module/PodcutDataList.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/main.dart';

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final categor = ['categor1','categor2','category3','category4'];
  String  Value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('order test'),
      ),
      body:  Center(
        child: Container(

          child: DropdownButton<String>(
              value: Value,
              isExpanded: true,
              icon:Icon(Icons.arrow_drop_down) ,
              iconSize: 30,
              onChanged:(Value)=> setState(() =>this.Value =Value),
              items: categor.map(categoryiteam).toList()


          ),
        ),
      )
      ,
    );
  }
DropdownMenuItem<String> categoryiteam(String cat)=>DropdownMenuItem(
  value:cat ,
  child: Text(cat,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
);
}
