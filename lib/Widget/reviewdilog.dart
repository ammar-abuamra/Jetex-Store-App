import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:jettaexstores/Module/productjson.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/config/Constant.dart';

class revied extends StatefulWidget {
  final String namee;

  final String reviwee;

  const revied(
    this.namee,
    this.reviwee,
  );

  @override
  State<revied> createState() => _reviedState();
}

class _reviedState extends State<revied> {
  // Future<List<ProductApi>> _getData() async {
  //   String url = 'http://45.76.132.167/api/authentication/productview.php';
  //   var response = await http.get(Uri.parse(url));
  //   var jsonData = json.decode(response.body);
  //   List<ProductApi> products = [];
  //
  //   for (var itm in jsonData) {
  //     products.add(ProductApi.fromJson(itm));
  //   }
  //   return products;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      width: MediaQuery.of(context).size.width * .5,
      decoration: BoxDecoration(
        color: SecondryColor,
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Center(
                child: Text(
              widget.namee,
              style: TextStyle(
                  color: SecondryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: PrimaryColor,
            ),
            padding: EdgeInsets.all(5),
            width: double.infinity,
          ),
          buildListTile(
            widget.reviwee,
          ),

          // buildListTile(
          //     Icons.location_on, getLang(context, "StoreLocationEdit")),
        ],
      ),
    );
  }
}

Widget buildListTile(String fname) {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0),
    child: Center(
      child: ListTile(
        title: Text(
          fname,
          textAlign: TextAlign.center,
          style: TextStyle(color: PrimaryColor),
        ),
      ),
    ),
  );
}
