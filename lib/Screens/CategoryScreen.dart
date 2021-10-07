import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jettaexstores/Module/categoryapi.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/widget.dart';

class ProdcutScreen extends StatefulWidget {
  @override
  _ProdcutScreenState createState() => _ProdcutScreenState();
}

class _ProdcutScreenState extends State<ProdcutScreen> {


  Future<List<Categoryapi>> _getData() async {
    String url = 'http://45.76.132.167/api/authentication/categoryapi.php';
    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    List<Categoryapi> cat = [];

    for (var itm in jsonData) {
      cat.add(Categoryapi.fromJson(itm));
    }
    return cat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: SecondryColor,
        backgroundColor: PrimaryColor,
        title: Text('Categorys ',style: TextStyle(color: SecondryColor)),

      ),
      backgroundColor: SecondryColor,
      body: FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(
                child: Container(
              child: Text('Loading...'),
            ));
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xffedb54f),
                      borderRadius: BorderRadius.circular(5)),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, 'SubCategory');
                    },
                    title: Text(snapshot.data[index].nameEn,
                        style: CategoryTextStyle),
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: SecondryColor,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
