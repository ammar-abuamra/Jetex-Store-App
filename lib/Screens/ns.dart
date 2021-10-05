import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show get;
import 'package:jettaexstores/Module/Info_Api.dart';
import 'package:jettaexstores/Module/OrderDataList.dart';
import 'package:jettaexstores/Module/PodcutDataList.dart';
import 'package:image_picker/image_picker.dart';



class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

File _file;
Future InsertImage ()async{
  final imagefile =await ImagePicker().pickImage(source: ImageSource.gallery );
  setState(() {
    _file = File(imagefile.path);
  });
}

Future upload()async{
  if (_file ==null )return ;
  String base64 = base64Encode(_file.readAsBytesSync());
  String imagename= _file.path.split("/").last;
  var ure = Uri.http('45.76.132.167', '/api/authentication/insertimage.php');
  final response = await http.post(ure, body: {
    "image_name":imagename,
    "image_path":base64,

  });

  print(response.body);

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add photo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          InkWell(
            onTap: (){
              InsertImage();
            },
            child: Container(
              color: Colors.amber,
              height: 50,width: 50,
                      child: Text( 'Get Image '),

            ),
          ),

          Container(
            height: 300,width: 300,
            child: _file == null ? Text('Insert image')  : Image.file(_file, fit: BoxFit.cover,)),
          InkWell(
            onTap: (){ upload();
            print(upload);

            },
            child: Container(
              color: Colors.amber,
              height: 50,width: 50,
              child: Text( 'upload Image '),

            ),
          ),


        ],
      ),
    );
  }


}


