import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:jettaexstores/Module/subabi.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/widget.dart';

class SubCategory extends StatefulWidget {
  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  Future<List<Subapi>> _getData() async {
    String url = 'http://45.76.132.167/api/authentication/subabi.php';
    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    List<Subapi> sub = [];

    for (var itm in jsonData) {
      sub.add(Subapi.fromJson(itm));
    }
    return sub;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: SecondryColor,
        appBar: appBar,
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
                        Navigator.pushNamed(context, 'ProscutDitalScreen');
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
        ));
  }
}
